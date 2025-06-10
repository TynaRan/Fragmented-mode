--sfx: 9113731836 
--Struggle/Disturbance Appear sound: 1546975842 (pitch 0.6)


local spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Entity%20Spawner/V2/Source.lua"))()

local entity = spawner.Create({
	Entity = {
		Name = "Disturbance",
		Asset = "https://github.com/ThatOneGuyRuben/Stuff/raw/main/FG/DisturbMDL.rbxm",
		HeightOffset = 1
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 1
		},
		Shatter = false,
		Repair = false
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = false,
		Range = 170,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 100,
		Delay = 5,
		Reversed = false
	},
	Rebounding = {
		Enabled = false,
		Type = "Ambush", -- "Blitz"
		Min = 1,
		Max = 1,
		Delay = 1
	},
	Damage = {
		Enabled = true,
		Range = 40,
		Amount = 1
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
workspace.Disturbance.scream:Destroy()

local slam = Instance.new("Sound")
        slam.Parent = workspace
				slam.Pitch = 0.6
				slam.SoundId = "rbxassetid://1546975842"

	local redtweeninfo = TweenInfo.new(3)
				local redinfo = {Color = Color3.fromRGB(255, 0, 255)}
				for i,v in pairs(game.Workspace.CurrentRooms:GetDescendants()) do
					if v:IsA("Light") then
						game.TweenService:Create(v,redtweeninfo,redinfo):Play()
						if v.Parent.Name == "LightFixture" then
							game.TweenService:Create(v.Parent,redtweeninfo,redinfo):Play()
						end
					end
				end

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
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local slam = Instance.new("Sound")
        slam.Parent = workspace
				slam.Volume = 3
        slam.Pitch = 0.6
				slam.SoundId = "rbxassetid://1837829565"
        slam:Play()
				local camara = game.Workspace.CurrentCamera
local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
 camara.CFrame = camara.CFrame * shakeCf
end)
camShake:Start()
camShake:ShakeOnce(15,25,0,2,1,6)
				slam:Play()

local achievementGiver = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

---====== Display achievement ======---
achievementGiver({
    Title = "A Memorable Fright",
    Desc = "Found you...",
    Reason = "Encounter Disturbance.",
    Image = "rbxassetid://17865443325"
})
end)

entity:SetCallback("OnDamagePlayer", function(newHealth)
	




		local TS = game:GetService("TweenService")
local CG = game:GetService("CoreGui")


local function playSound(id, volume)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. tostring(id)
    sound.Volume = volume or 1
    sound.PlayOnRemove = true
    sound.Parent = workspace
    sound:Destroy()
    
end


function jumpscare(imageId1, imageId2, soundId1, soundId2, flashColor, teaseData, shakeEnabled)
    local MinTeaseSize, MaxTeaseSize = 150, 750

    
    local image1 = "rbxassetid://" .. tostring(imageId1)
    local image2 = "rbxassetid://" .. tostring(imageId2)


    local JumpscareGui = Instance.new("ScreenGui")
    local Background = Instance.new("Frame")
    local Face = Instance.new("ImageLabel")

    JumpscareGui.Name = "JumpscareGui"
    JumpscareGui.IgnoreGuiInset = true
    JumpscareGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.new(0, 0, 0)
    Background.BorderSizePixel = 0
    Background.Size = UDim2.new(1, 0, 1, 0)
    Background.ZIndex = 999

    Face.Name = "Face"
    Face.AnchorPoint = Vector2.new(0.5, 0.5)
    Face.BackgroundTransparency = 1
    Face.Position = UDim2.new(0.5, 0, 0.5, 0)
    Face.ResampleMode = Enum.ResamplerMode.Pixelated
    Face.Size = UDim2.new(0, MinTeaseSize, 0, MinTeaseSize)
    Face.Image = image1

    Face.Parent = Background
    Background.Parent = JumpscareGui
    JumpscareGui.Parent = CG

    -- Tease
    local sound1
    if teaseData and teaseData.Enabled then
        if soundId1 then
            sound1 = playSound(soundId1, teaseData.Sound1Volume or 1)
        end

        local rdmTease = math.random(teaseData.Min, teaseData.Max)

        for _ = 1, rdmTease do
            task.wait(math.random(100, 200) / 100)
            local growFactor = (MaxTeaseSize - MinTeaseSize) / rdmTease
            Face.Size = UDim2.new(0, Face.AbsoluteSize.X + growFactor, 0, Face.AbsoluteSize.Y + growFactor)
        end

        task.wait(math.random(100, 200) / 100)
    end


    if flashColor then
        task.spawn(function()
            while JumpscareGui.Parent do
                Background.BackgroundColor3 = flashColor
                task.wait(math.random(25, 100) / 1000)
                Background.BackgroundColor3 = Color3.new(0, 0, 0)
                task.wait(math.random(25, 100) / 1000)
            end
        end)
    end

    
    if shakeEnabled then
        task.spawn(function()
            local origin = Face.Position

            while JumpscareGui.Parent do
                Face.Position = origin + UDim2.new(0, math.random(-10, 10), 0, math.random(-10, 10))
                Face.Rotation = math.random(-5, 5)
                task.wait()
            end
        end)
    end

   
    local sound2
    if soundId2 then
        sound2 = playSound(soundId2, 1)
    end

    
    Face.Image = image2
    Face.Size = UDim2.new(0, 750, 0, 750)

    TS:Create(Face, TweenInfo.new(0.75), {
        Size = UDim2.new(0, 2000, 0, 2000),
        ImageTransparency = 0.5
    }):Play()

    task.wait(0.75)
    JumpscareGui:Destroy()
end

jumpscare(
    135322783205122, 
    135322783205122, 
    10483790459, 
    5263560566, 
    Color3.fromRGB(255, 0, 0), 
    {
        Enabled = true,
        Min = 2,
        Max = 5,
        Sound1Volume = 1
    },
    true 
)
game.Players.LocalPlayer.Character.Humanoid.Health = 0

end)


entity:Run()
