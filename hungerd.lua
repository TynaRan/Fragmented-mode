local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

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
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 500,
		Delay = 11,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
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
		Type = "Guiding", -- "Curious"
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
end)

entity:SetCallback("OnStartMoving", function()
    --print("Entity has started moving")
end)

entity:SetCallback("OnEnterRoom", function(room, firstTime)
    if firstTime == true then
        --print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        --print("Entity has entered room: ".. room.Name.. " again")
    end
end)

entity:SetCallback("OnLookAt", function(lineOfSight)
	if lineOfSight == true then
		--print("Player is looking at entity")
	else
		--print("Player view is obstructed by something")
	end
end)

entity:SetCallback("OnRebounding", function(startOfRebound)
    if startOfRebound == true then
        --print("Entity has started rebounding")
	else
        --print("Entity has finished rebounding")
	end
end)

entity:SetCallback("OnDespawning", function()
    --print("Entity is despawning")
end)

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
		
	end
end)


entity:Run()
