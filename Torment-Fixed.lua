local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()
local entity = spawner.Create({
Entity = {
Name = "Torment",
Asset = "rbxassetid://14019230123",
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
Speed = 25,
Delay = 3,
Reversed = false
},
Rebounding = {
Enabled = false,
Type = "Ambush",
Min = 1,
Max = 1,
Delay = 1
},
Damage = {
Enabled = true,
Range = 20,
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
print("Entity has spawned")
function GitAud(soundgit,filename)
local url=soundgit
local FileName = filename
writefile(FileName..".mp3", game:HttpGet(url))
return (getcustomasset or getsynasset)(FileName..".mp3")
end
CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/raw/main/StepsNLooks.mp3", 1, "StepForStepIGotYourDataFiles")
end)
entity:SetCallback("OnStartMoving", function()
local textLabel = Instance.new("TextLabel")
textLabel.Parent = gui
textLabel.Font = Enum.Font.Jura
textLabel.TextSize = 24
textLabel.TextColor3 = Color3.fromRGB(200, 160, 255)
textLabel.BackgroundTransparency = 1
textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
textLabel.Position = UDim2.new(0.5, 0, 0.8, 0)
textLabel.Size = UDim2.new(0, 300, 0, 50)
coroutine.wrap(function()
while workspace:FindFirstChild("Torment") do
textLabel.Text = "Run"
wait(2)
textLabel.Text = "he is coming"
wait(2)
end
for i = 1, 10 do
textLabel.TextTransparency = i/10
wait(0.05)
end
textLabel:Destroy()
gui:Destroy()
end)()
end)
entity:SetCallback("OnEnterRoom", function(room, firstTime)
if firstTime == true then
print("Entity has entered room: ".. room.Name.. " for the first time")
else
print("Entity has entered room: ".. room.Name.. " again")
end
end)
entity:SetCallback("OnLookAt", function(lineOfSight)
if lineOfSight == true then
print("Player is looking at entity")
else
print("Player view is obstructed by something")
end
end)
entity:SetCallback("OnRebounding", function(startOfRebound)
if startOfRebound == true then
print("Entity has started rebounding")
else
print("Entity has finished rebounding")
end
end)
entity:SetCallback("OnDespawning", function()
print("Entity is despawning")
end)
entity:SetCallback("OnDespawned", function()
print("Entity has despawned")
end)
entity:SetCallback("OnDamagePlayer", function(newHealth)
if newHealth == 0 then
firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"You died to who you call Hunger..", "Before he spawns he doing his warn sound first!", "If you will not be in closet he will kill you!", "Remember this!"}, "Blue")
end
end)
entity:Run()
