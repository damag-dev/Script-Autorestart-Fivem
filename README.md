# Script-Autorestart-Fivem
The script allows you to auto-restart the script in fivem :)
Enjoy :)

Use your own reboots only if the scheme does not give you such an opportunity or you want the scheme to restart automatically every x time and your restart will take place only once

```lua
---here you have template how to make your own autorestarts.
local app = "Name of your srcipt" 
Citizen.CreateThread(function() 
  while true do 
    Citizen.Wait(1)
    PerformHttpRequest(weabhooklink, function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, content = "ALLERT autorestart in 10 sec", avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' }) 
      Citizen.Wait(10000)
     StopResource(app)
     Citizen.Wait(100)
     StartResource(app) 
     sendToDiscord("Discord Control", "AUTO RESTART\nStatus - `Successful`\nNext restart in - `30 min`", 1645055)
     Citizen.Wait(1800000) --- wait 30 min if you want to restart only ones insted of Citizen.Wait(1800000) put break
  end
end)
```

Made by damag #4013
