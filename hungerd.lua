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
    print("Entity has spawned")
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

CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/raw/refs/heads/main/Y2meta.app%20-%20Doors%20Fragmented%20Mode%20v4_%20Hunger%20Spawned%20Warn%20(256%20kbps).mp3", 1, "ImHungry")
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
    --print("Entity has despawned")
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	if newHealth == 0 then
		
	end
end)


entity:Run()
