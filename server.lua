ESX = nil


------------------------------------------------
---------Script made by damag#4013--------------
-------------------v 1.0------------------------
------------------------------------------------

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
ReplyUserName = "Your Discord Bot Name"
AvatarURL = "logo url"

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
    PerformHttpRequest("Your weabhook link", function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, embeds = connect, avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' })
  end
  

---Config----
---here you have template how it should look like
local app1 = "Name of your srcipt"


--- dont edit below
Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1)
    PerformHttpRequest("Your weabhook link", function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, content = "ALLERT autorestart in 10 sec", avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' }) 
      Citizen.Wait(10000)
     StopResource(app1)
     Citizen.Wait(100)
     StartResource(app1)
     sendToDiscord("Discord Control", "AUTO RESTART\nStatus - `Successful`\nNext restart in - `30 min`", 1645055)
     Citizen.Wait(1800000) --- wiat 30 min
  end
end)