

local currentLoadedRoom=workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local clock=game:GetObjects("rbxassetid://14700391347")[1]
clock.Parent = workspace


local num = math.floor(#currentLoadedRoom.Nodes:GetChildren() / 2)
local targetCFrame = (
    num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
).CFrame + Vector3.new(0, 4, 0)

clock:SetPrimaryPartCFrame(targetCFrame)

wait(5)
function GitAud(soundgit,filename)
    SoundName=tostring(SoundName)
    local url=soundgit
    local FileName = filename
    writefile(FileName..".mp3", game:HttpGet(url))
    return (getcustomasset or getsynasset)(FileName..".mp3")
end

function CustomGitSound(soundlink, vol, filename)
    local Sound = Instance.new("Sound")
    Sound.SoundId = GitAud(soundlink, filename)
    Sound.Parent = workspace
    Sound.Volume = vol
    Sound:Play()
end

CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/blob/main/ClockSounds.mp3?raw=true", 1, "ClockSound")


local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TensionEffect"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.Parent = playerGui


local vignette = Instance.new("ImageLabel")
vignette.Size = UDim2.new(1.2, 0, 1.2, 0)
vignette.Position = UDim2.new(-0.1, 0, -0.1, 0)
vignette.BackgroundTransparency = 1
vignette.Image = "rbxassetid://14403272059"
vignette.ImageTransparency = 1
vignette.ZIndex = 5
vignette.Parent = screenGui

local darken = Instance.new("Frame")
darken.Size = UDim2.new(1, 0, 1, 0)
darken.Position = UDim2.new(0, 0, 0, 0)
darken.BackgroundColor3 = Color3.new(0, 0, 0)
darken.BackgroundTransparency = 1
darken.ZIndex = 4
darken.Parent = screenGui
local TweenService = game:GetService("TweenService")


TweenService:Create(vignette, TweenInfo.new(1), {ImageTransparency = 0.3}):Play()


TweenService:Create(darken, TweenInfo.new(1), {BackgroundTransparency = 0.5}):Play()



game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(30, 30, 80)
game.Lighting.MainColorCorrection.Contrast = 1
local tween = game:GetService("TweenService")
tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(2.5), {Contrast = 0}):Play()




local camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")


local fovTween = TweenService:Create(camera, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
	FieldOfView = 40 
})
fovTween:Play()


wait(33)

clock:Destroy()
	
	TweenService:Create(vignette, TweenInfo.new(1), {ImageTransparency = 1}):Play()
	TweenService:Create(darken, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()

	
	TweenService:Create(camera, TweenInfo.new(1), {FieldOfView = 70}):Play()

local TweenService = game:GetService("TweenService")
local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(80),{TintColor = Color3.fromRGB(255, 255, 255)})
TW:Play()

	
	task.wait(1.1)
	if screenGui then screenGui:Destroy() end

local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Dread",
		Asset = "rbxassetid://14477437827",
		HeightOffset = 1
	},
	Lights = {
		Flicker = {
			Enabled = true,
			Duration = 4
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
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 6,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 2,
		Delay = 3
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 125
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = false,
		Break = true
	},
	Death = {
		Type = "Guiding", -- "Curious"
		Hints = {"You Died to who you call..", "Dread!", "First his watch appears, Then he appears too!", "LMFAO STUPID NIGGA"},
		Cause = ""
	}
})



entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)

entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
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
local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()


achievementGiver({
    Title = "Death Of Night",
    Desc = "The time was come...",
    Reason = "Encounter Dread.",
    Image = "rbxassetid://17818670913"
})
end)



entity:Run()
