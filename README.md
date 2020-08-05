# Script-Autorestart-Fivem
The script allows you to auto-restart the script in fivem :)
Enjoy :)


```lua
---here you have template how next autorestarts should look like.
local app = "Name of your srcipt" --- add to app next number like  [app1,app2,app3] and change the name bellow 

Citizen.CreateThread(function() 
  while true do 
    Citizen.Wait(1)
    PerformHttpRequest(weabhooklink, function(err, text, headers) end, 'POST', json.encode({username = ReplyUserName, content = "ALLERT autorestart in 10 sec", avatar_url = AvatarURL}), { ['Content-Type'] = 'application/json' }) 
      Citizen.Wait(10000)
     StopResource(app)  --- here change name like is in local above
     Citizen.Wait(100)
     StartResource(app) --- here change name like is in local above
     sendToDiscord("Discord Control", "AUTO RESTART\nStatus - `Successful`\nNext restart in - `30 min`", 1645055)
     Citizen.Wait(1800000) --- wiat 30 min
  end
end)
```

Made by damag #4013
