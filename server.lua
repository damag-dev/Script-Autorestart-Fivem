ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------------------------------------
---------Script made by damag#4013--------------
-------------------v 2.0------------------------
------------------------------------------------

---Config----
weabhooklink = "" ---weabhook link
ReplyUserName = "Autorestart" ---Bot name
AvatarURL = "" ---Url of avatar 
local scripts = {'script1', 'script2'}  ---Scripts to restart
local allert_msg = "'ALLERT' autorestart in 10 sec"  ---Allert before script restart message on discord
local restart_title = "Autorestart" ---Script restart title on discord
local restart_msg = "AUTO RESTART\nStatus - ``Successful``\nNext restart in - `6h`"  ---Script restart message on discord
local everytime = true ---if false then will restart scripts only once at the beginning of the script
local time_break = 21600000  ---time between restarts [6h] [Set everytime to true to use it]

------------------------------------------------
---------------DONT EDIT BELOW------------------
------------------------------------------------
function sendToDiscord(name, message, color)
    local connect = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = "Made by damag",
              },
          }
      }
    PerformHttpRequest(weabhooklink, function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, embeds = connect, avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' })
  end


Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1)
    PerformHttpRequest(weabhooklink, function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, content = allert_msg, avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' }) 
      Citizen.Wait(10000)
      for index, value in next, scripts do
    StopResource(value)
    Citizen.Wait(1000)
    StartResource(value)
    end
     sendToDiscord(restart_title, restart_msg, 1645055)
     if everytime then
        Citizen.Wait(time_break)
     else
      break 
     end
  end
end)
------------------------------------------------
-----------YOUR OWN RESTARTS BELOW--------------
------------------------------------------------
