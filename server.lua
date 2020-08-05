ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------------------------------------
---------Script made by damag#4013--------------
-------------------v 1.0------------------------
------------------------------------------------

---Config----
weabhooklink = "Your weabhook link"
ReplyUserName = "Your Discord Bot Name"
AvatarURL = "logo url"


--- dont edit below
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
  

--- First autorestart
local app1 = "Name of your srcipt"

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1)
    PerformHttpRequest(weabhooklink, function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, content = "ALLERT autorestart in 10 sec", avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' }) 
      Citizen.Wait(10000)
     StopResource(app1)
     Citizen.Wait(100)
     StartResource(app1)
     sendToDiscord("Discord Control", "AUTO RESTART\nStatus - `Successful`\nNext restart in - `30 min`", 1645055)
     Citizen.Wait(1800000) --- wiat 30 min
  end
end)
-- Next autorestart
-- If you want add next script to autorestart all you need to do is add new local with script name add new Citizen.CreateThread(function()
-- with you have bellow but with app2 insted app1 like this one bellow or look into the template in README
local app2 = "Name of your srcipt"

Citizen.CreateThread(function()
  while true do 
    Citizen.Wait(1)
    PerformHttpRequest(weabhooklink, function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, content = "ALLERT autorestart in 10 sec", avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' }) 
      Citizen.Wait(10000)
     StopResource(app2)
     Citizen.Wait(100)
     StartResource(app2)
     sendToDiscord("Discord Control", "AUTO RESTART\nStatus - `Successful`\nNext restart in - `30 min`", 1645055)
     Citizen.Wait(1800000) --- wiat 30 min
  end
end)

