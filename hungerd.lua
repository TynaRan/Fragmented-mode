local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local function SetDeathCause(cause, messages, color)
    local player = game:GetService("Players").LocalPlayer
    game:GetService("ReplicatedStorage").GameStats["Player_"..player.Name].Total.DeathCause.Value = cause
    firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, messages, color)
end

local entity = spawner.Create({
Entity = {
Name = "Hungered",
Asset = "https://github.com/ThatOneGuyRuben/Stuff/blob/main/FG/HungerMDL.rbxm?raw=true",
HeightOffset = 1
},
Lights = {
Flicker = {
Enabled = false,
Duration = 1
},
Shatter = true,
Repair = false
},
Earthquake = {
Enabled = false
},
CameraShake = {
Enabled = false,
Range = 100,
Values = {1.5, 20, 0.1, 1}
},
Movement = {
Speed = 500,
Delay = 11,
Reversed = false
},
Rebounding = {
Enabled = true,
Type = "Ambush",
Min = 1,
Max = 3,
Delay = 1
},
Damage = {
Enabled = true,
Range = 80,
Amount = 125
},
Crucifixion = {
Enabled = true,
Range = 40,
Resist = false,
Break = true
},
Death = {
Type = "Guiding",
Hints = {"You Died to who you call..", "Dread!", "First his watch appears, Then he appears too!", "LMFAO STUPID NIGGA"},
Cause = ""
}
})



entity:SetCallback("OnSpawned", function()
    local cue2 = Instance.new("Sound")
    cue2.Parent = game.Workspace
    cue2.Name = "Spawn"
    cue2.SoundId = "rbxassetid://9125712561"
    cue2.Volume = 9999
    cue2.PlaybackSpeed = 1
    cue2:Play()
    --CheckLookAt()
end)
--[[
entity:SetCallback("OnStartMoving", function()
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
if firstTime == true then
else
--end
--end)
--]]

--entity:SetCallback("OnLookAt", function(lineOfSight)
--if lineOfSight == true then
--game.Players.LocalPlayer.Character.Humanoid.Health = 0            
--else
--game.Players.LocalPlayer.Character.Humanoid.Health = 0            
--end
--end)

--entity:SetCallback("OnRebounding", function(startOfRebound)
--if startOfRebound == true then
--else
--end
--end)

--entity:SetCallback("OnDespawning", function()
--end)

entity:SetCallback("OnDespawned", function()
local success, achievement = pcall(function()
return loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
end)

if success then
achievement({
Title = "Give me you Soul",
Desc = "̷͙͍͛I w̸̘̓͝a̴̹̾n̵̛̼t̶̢͠ ̴̮̓e̶͙̋a̷̧̕t̴̺͒ ̵̘͝y̸̼͗o̵̗̊u̷̩̒",
Reason = "Encounter Hungerd",
Image = "rbxassetid://127887967230160"
})
end
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
if newHealth == 0 then
SetDeathCause("Hungered", {"It consumed you...", "Your soul is now its meal"}, "Blue")
end
end)

entity:Run()
