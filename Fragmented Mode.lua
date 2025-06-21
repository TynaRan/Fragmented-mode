local ReplicatedStorage = game:GetService("ReplicatedStorage")

 
if ReplicatedStorage:FindFirstChild("Fragments") then
    require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Fragmented Mode Has Been Executed 2 Times! Returning...", true)
    return
end


local boolean = Instance.new("BoolValue")
boolean.Name = "Fragments"
boolean.Parent = ReplicatedStorage

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Settings
local maxStamina = 100
local currentStamina = maxStamina
local staminaDepletionRate = 15  -- Stamina lost per second while sprinting
local staminaRegenRate = 8       -- Stamina regained per second when not sprinting
local sprintSpeedBonus = 10      -- Extra speed when sprinting

-- State variables
local isSprinting = false
local naturalWalkSpeed = humanoid.WalkSpeed  -- Tracks the "default" speed (can change due to external forces)
local lastUpdateTime = os.clock()

-- UI Setup (same as before)
local staminaUI = Instance.new("ScreenGui")
staminaUI.Name = "StaminaUI"
staminaUI.Parent = player.PlayerGui

local staminaFrame = Instance.new("Frame")
staminaFrame.Size = UDim2.new(0.25, 0, 0.02, 0)
staminaFrame.Position = UDim2.new(0.375, 0, 0.94, 0)
staminaFrame.BackgroundColor3 = Color3.new(0, 0, 0)
staminaFrame.BorderSizePixel = 0

local staminaBar = Instance.new("Frame")
staminaBar.Size = UDim2.new(1, 0, 1, 0)
staminaBar.BackgroundColor3 = Color3.new(1, 1, 1)
staminaBar.BorderSizePixel = 0
staminaBar.Parent = staminaFrame
staminaFrame.Parent = staminaUI

local sprintButton = Instance.new("TextButton")
sprintButton.Size = UDim2.new(0.4, 0, 0.4, 0)
sprintButton.Position = UDim2.new(0.875, 0, 0.8, 0)
sprintButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
sprintButton.BorderSizePixel = 2
sprintButton.BorderColor3 = Color3.new(0, 0, 0)
sprintButton.Text = ""
sprintButton.Parent = staminaUI

-- Update stamina bar
local function updateStaminaBar()
    staminaBar.Size = UDim2.new(currentStamina / maxStamina, 0, 1, 0)
end

-- Toggle sprint
local function toggleSprint()
    isSprinting = not isSprinting
    sprintButton.BackgroundColor3 = isSprinting and Color3.new(0, 0.6, 0) or Color3.new(0.3, 0.3, 0.3)
    
    -- On sprint end, revert to natural speed (which may have been modified externally)
    if not isSprinting then
        humanoid.WalkSpeed = naturalWalkSpeed
    end
end

-- Button & keyboard controls
sprintButton.MouseButton1Click:Connect(toggleSprint)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftShift then
        toggleSprint()
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftShift then
        toggleSprint()
    end
end)

-- Main logic
RunService.Heartbeat:Connect(function()
    local now = os.clock()
    local deltaTime = now - lastUpdateTime
    lastUpdateTime = now

    -- Update natural speed if not sprinting (to adapt to external changes)
    if not isSprinting then
        naturalWalkSpeed = humanoid.WalkSpeed
    end

    -- Check if player is actively moving
    local isMoving = humanoid.MoveDirection.Magnitude > 0.1

    -- Handle sprinting logic
    if isSprinting and isMoving and currentStamina > 0 then
        -- Apply sprint bonus on top of natural speed
        humanoid.WalkSpeed = naturalWalkSpeed + sprintSpeedBonus
        currentStamina = math.max(0, currentStamina - staminaDepletionRate * deltaTime)

        -- Auto-disable sprint if stamina runs out
        if currentStamina <= 0 then
            isSprinting = false
            sprintButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
            humanoid.WalkSpeed = naturalWalkSpeed
        end
    else
        -- Regenerate stamina when not sprinting
        currentStamina = math.min(maxStamina, currentStamina + staminaRegenRate * deltaTime)
    end

    updateStaminaBar()
end)

-- Reset on respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    naturalWalkSpeed = humanoid.WalkSpeed  -- Reset to new character's default
    currentStamina = maxStamina
    isSprinting = false
    sprintButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    updateStaminaBar()
end)

-- Initial setup
naturalWalkSpeed = humanoid.WalkSpeed  -- Initialize with current speed
updateStaminaBar()




local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

local allowedCommandsUsers = {
	[7937814192] = true
}

local prefixes = {
	[7937814192] = "<font color='#FF0000'>[Owner]</font> <font color='#4e03fc'>[No Name]</font> "
}

TextChatService.OnIncomingMessage = function(message)
	local props = Instance.new("TextChatMessageProperties")

	if not message.TextSource then return end

	local userId = message.TextSource.UserId
	local msg = string.lower(message.Text or "")

	
	if prefixes[userId] then
		props.PrefixText = prefixes[userId] .. (message.PrefixText or "")
	end


	if userId == 2300945089 and (msg == "/subscribe" or msg == "/sub") then
		props.PrefixText = "<font color='#b71109'>https://www.youtube.com/@kardinhong</font> " .. (message.PrefixText or "")
	end

	
	if allowedCommandsUsers[userId] and msg == "/rebound" then
		loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/f11740c3038d1a1a1039409f8b62978d/raw/e2a02bee3761cf886303fc7c6d8aeab21cf8b9ba/ReboundMoving"))()
	end

if allowedCommandsUsers[userId] and msg == "/hunger" then
loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/cced3f24fa9d4146852441970bf42f9d/raw/7ad70c2ca25409f5936f60e61f06937aed123cef/Hungered"))()
end

if allowedCommandsUsers[userId] and msg == "/struggle" or msg == "/strug" then
    loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/c819c88a3f856e68f257203e7d614d29/raw/af70c3ca7ffe7f1a0c5d826bb45e04b5f58e9e9e/Struggle"))()
end

if allowedCommandsUsers[userId] and msg == "/depth" or msg == "/dt" then
    loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/8350756c7afc7b87cc6f534f07fbdf08/raw/e8396030645c84248e57e325cad518bbf5f4f050/Depth"))()
end

if allowedCommandsUsers[userId] and msg == "/revoker" or msg == "/revoke" then
    loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/aa182cc52ceb581c7aaecf995898f4d1/raw/5112f4b495dc263472e7108cb232ae70ba62cea9/Revoker"))()
end

if allowedCommandsUsers[userId] and msg == "/daunt" or msg == "/Daunt" then
    loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/d4a36b88bac6255cba8a5c8e1d42b7ee/raw/da56bc3421169802433f78fcaf1a847f7abae7ca/Daunt"))()
end

if allowedCommandsUsers[userId] and msg == "/dread" then
loadstring(game:HttpGet("https://gist.github.com/Kotyara19k-Doorsspawner/65b34c4d01746bbf74438681d03ac2f3/raw/3549cd1ee3e2cf0b2e67255d6b9dd67cf5e37e94/Dread"))()
end



	return props
end






local tween = game:GetService("TweenService")
local idk = [[
Yo! welcome to Doors Fragmented Mode!
if you want to record a gameplay or something, make sure to 
credit me (the creator) and please, do not post the script in 
Pastebin, YouTube, Glot.io or in other sites without the owner's 
permission!  
If you want to share the script, share the Discord server.  
Have fun and thank you for playing! 
- The Jabiss
]]

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.Enabled = true
gui.Name = "Info"

local click = Instance.new("Sound")
click.SoundId = "rbxassetid://6042053626"
click.Parent = workspace
local button = Instance.new("ImageButton")
button.Size = UDim2.new(0.1, 0, 0.23, 0)
button.Position = UDim2.new(0.9, 0, 0.4, 0)
button.Image = "rbxassetid://135349722575340"
button.Parent = gui


local plsread = Instance.new("Frame")
plsread.BackgroundColor3 = Color3.fromRGB(85, 35, 5)
plsread.Size = UDim2.new(0.8, 0, 0.8, 0)
plsread.Position = UDim2.new(0.1, 0, 1, 0)
plsread.Parent = gui
plsread.Visible = false

local Text = Instance.new("TextLabel")
Text.BackgroundTransparency = 1
Text.Text = idk
Text.TextColor3 = Color3.fromRGB(255, 240, 195)
Text.Size = UDim2.new(0.9, 0, 0.9, 0)
Text.TextScaled = true
Text.Position = UDim2.new(0.05, 0, 0.05, 0)
Text.FontFace = Font.new(
    "rbxasset://fonts/families/RomanAntique.json",
    Enum.FontWeight.Regular,
    Enum.FontStyle.Normal
)
Text.Parent = plsread

button.MouseButton1Up:Connect(function()
if plsread.Visible == false then
click:Play()
plsread.Visible = true
tween:Create(plsread, TweenInfo.new(2), {
        Position = UDim2.new(0.1, 0, 0.1, 0),
    }):Play()

elseif plsread.Visible == true then

tween:Create(plsread, TweenInfo.new(2), {
        Position = UDim2.new(0.1, 0, 1, 0),
    }):Play()
click:Play()
wait(2)
plsread.Visible = false
end
end)


coroutine.wrap(function()
game:GetService("ReplicatedStorage").GameData.LatestRoom.Changed:Connect(function(v)
   L = game:GetService("Workspace").CurrentRooms[v].PathfindNodes:Clone()
L.Parent = game:GetService("Workspace").CurrentRooms[v]
L.Name = 'Nodes'

end)
end)()
local function ReplaceAudGit(GithubSnd,SoundName)
local url=GithubSnd
local filePath=SoundName..".mp3"
if not isfile(filePath)then
writefile(filePath,game:HttpGet(url))
end
return(getcustomasset or getsynasset)(filePath)
end

local function replaceSeekMusic(GithubSnd,SoundName)
local customAsset=ReplaceAudGit(GithubSnd,SoundName)
for _,obj in ipairs(workspace:GetDescendants())do
if obj:IsA("Model")and obj.Name=="SeekMovingNewClone"then
local seekMusic=obj:FindFirstChild("SeekMusic")
if seekMusic and seekMusic:IsA("Sound")then
seekMusic.SoundId=customAsset
end
end
end
end

coroutine.wrap(function()
while true do
--game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
			
replaceSeekMusic("https://github.com/Brololto/BUUMMM/blob/main/Screen_Recording_20230404-233303_YouTube%20(online-audio-converter.com).mp3?raw=true","Seek_RUN_frag")

wait(0.01)
end
end)()
function Chat(args)
	game:GetService("TextChatService").TextChannels.RBXSystem:DisplaySystemMessage(args);
end
Chat("Fragmented Mode V4 Loaded.")
Chat("if you play this He is very hard")
Chat("Dread has bugs. I'm sorry :(")


-- Door Change
coroutine.wrap(function()
    while true do
        wait(0.0005)
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value].Door.Door.Open.SoundId = "rbxassetid://833871080"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("Door"):FindFirstChild("Door").Material = "Slate"
workspace.CurrentRooms[game.ReplicatedStorage.GameData.LatestRoom.Value]:FindFirstChild("Door"):FindFirstChild("Door"):FindFirstChild("Sign").Material = "Slate"
    end
end)()
-- echo sound
--game.SoundService.AmbientReverb = "ConcertHall"
-- ambient fog and horror sound
 
-- Get services
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")



local sfx = Instance.new("Sound")
sfx.SoundId = "rbxassetid://9113731836"
sfx.Volume = 2
sfx.Looped = true
sfx.Parent = workspace
sfx:Play()

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Made by the Jabiss, Don't share this script on any app, link, site, or server",true)

game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()

require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Made By The Jabiss (jabiss_).",true)
wait(3)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("Credits to Vynixus, Noah, ThatOneRubenGuy(Thanks you so much), and people who made the models",true)
loadstring(game:HttpGet('https://pastefy.app/LXPjhzXK/raw'))()



game.ReplicatedStorage.Sounds.BulbCharge.SoundId = "rbxassetid://9125973034"
game.ReplicatedStorage.Sounds.BulbZap.SoundId = "rbxassetid://4288784832"
game.ReplicatedStorage.Sounds.BulbBreak.SoundId = "rbxassetid://6737582273"

 
local function loadEntity(url, delay, checkRoomChange)
    coroutine.wrap(function()
        while true do
            wait(delay)
            if checkRoomChange then 
                game.ReplicatedStorage.GameData.LatestRoom.Changed:Wait()
            end
            
            local latestRoom = game.ReplicatedStorage.GameData.LatestRoom.Value
            local seekMovingExists = false
            for _, obj in ipairs(game.Workspace:GetChildren()) do
                if string.find(obj.Name, "SeekMovingNewClone") then
                    seekMovingExists = true
                    break
                end
            end
            
            if not (latestRoom == 50 or latestRoom == 100 or seekMovingExists) then
                loadstring(game:HttpGet(url))()
            end
        end
    end)()
end

-- Entities with their URLs and spawn conditions
loadEntity("https://github.com/TynaRan/Fragmented-mode/blob/main/dread.lua", 150, true)
loadEntity("https://raw.githubusercontent.com/TynaRan/Fragmented-mode/refs/heads/main/Daze.lua", math.random(15, 40), false)
loadEntity("https://gist.github.com/Kotyara19k-Doorsspawner/6c571d1af1fe3892eb2427a46193bf56/raw/b0508ee42958e1ee4312ea842456a8a1f6bb058f/Fluster", 250, true)
loadEntity("https://gist.github.com/Kotyara19k-Doorsspawner/aa182cc52ceb581c7aaecf995898f4d1/raw/5112f4b495dc263472e7108cb232ae70ba62cea9/Revoker", 500, false)
loadEntity("https://raw.githubusercontent.com/TynaRan/Fragmented-mode/refs/heads/main/hungerd.lua", 350, true)
loadEntity("https://raw.githubusercontent.com/TynaRan/Fragmented-mode/refs/heads/main/Torment-Fixed.lua", 600, true)
--loadEntity("https://gist.github.com/Kotyara19k-Doorsspawner/c819c88a3f856e68f257203e7d614d29/raw/af70c3ca7ffe7f1a0c5d826bb45e04b5f58e9e9e/Struggle", 400, true)
loadEntity("https://gist.github.com/Kotyara19k-Doorsspawner/f11740c3038d1a1a1039409f8b62978d/raw/e2a02bee3761cf886303fc7c6d8aeab21cf8b9ba/ReboundMoving", 650, true)
--loadEntity("https://gist.github.com/Kotyara19k-Doorsspawner/8350756c7afc7b87cc6f534f07fbdf08/raw/e8396030645c84248e57e325cad518bbf5f4f050/Depth", 520, true)
loadEntity("https://gist.github.com/Kotyara19k-Doorsspawner/d4a36b88bac6255cba8a5c8e1d42b7ee/raw/da56bc3421169802433f78fcaf1a847f7abae7ca/Daunt", 650, true)
loadEntity("https://raw.githubusercontent.com/TynaRan/Fragmented-mode/refs/heads/main/Disturbance.lua", 280, true)
local function loadHallucination()
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://9113335392"
sound.PlaybackSpeed = 0.875
sound.Volume = 3
sound.Parent = workspace

local gui = Instance.new("ScreenGui")
gui.Name = "CGui"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local imageLabel = Instance.new("ImageLabel")
imageLabel.Name = "CenterImage"
imageLabel.Image = "rbxassetid://18147873567"
imageLabel.BackgroundTransparency = 1
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
imageLabel.Size = UDim2.new(0, 250, 0, 250)
imageLabel.ImageTransparency = 1
imageLabel.Parent = gui

local instructionLabel = Instance.new("TextLabel")
instructionLabel.Name = "Instruction"
instructionLabel.Text = ""
instructionLabel.TextSize = 24
instructionLabel.TextColor3 = Color3.new(0, 0.5, 1)
instructionLabel.Font = Enum.Font.Jura
instructionLabel.BackgroundTransparency = 1
instructionLabel.AnchorPoint = Vector2.new(0.5, 0.5)
instructionLabel.Position = UDim2.new(0.5, 0, 0.65, 0)
instructionLabel.Size = UDim2.new(0, 200, 0, 50)
instructionLabel.Visible = false
instructionLabel.Parent = gui

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

local function fadeObject(obj, duration, startTrans, endTrans)
local startTime = tick()
while tick() - startTime < duration do
local progress = (tick() - startTime)/duration
local transparency = startTrans + (endTrans - startTrans)*progress
if obj:IsA("ImageLabel") then
obj.ImageTransparency = transparency
elseif obj:IsA("TextLabel") then
obj.TextTransparency = transparency
obj.TextStrokeTransparency = transparency
end
task.wait()
end
end

local function checkPlayerAction(requiredAction)
local failed = false
local connection
local startTime = tick()
local duration = 2

connection = humanoid:GetPropertyChangedSignal("MoveDirection"):Connect(function()
local moveDir = humanoid.MoveDirection
local isMoving = moveDir.Magnitude > 0

if requiredAction == "Move" then
if isMoving then failed = false end
elseif requiredAction == "Don't move" then
if isMoving then failed = true end
end
end)

while tick() - startTime < duration do task.wait() end
connection:Disconnect()

if requiredAction == "Move" and humanoid.MoveDirection.Magnitude == 0 then
failed = true
end

if failed then
humanoid.Health = 0
return false
end
return true
end

local function runSequence()
fadeObject(imageLabel, 13, 1, 0)

local instructions = {"Move", "Don't move"}
local survived = true
local startTime = tick()
local challengeDuration = 10

while tick() - startTime < challengeDuration and survived do
local instruction = instructions[math.random(2)]
instructionLabel.Text = instruction
instructionLabel.TextTransparency = 0
instructionLabel.Visible = true

survived = checkPlayerAction(instruction)

if not survived then
firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"hallucination...", "wow"}, "Blue")
break
end

fadeObject(instructionLabel, 0.5, 0, 1)
instructionLabel.Visible = false
task.wait(0.5)
end

if survived then
if not player:FindFirstChild("HallucinationAchievement") then
local achievementTracker = Instance.new("BoolValue")
achievementTracker.Name = "HallucinationAchievement"
achievementTracker.Parent = player

local success, achievement = pcall(function()
return loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()
end)

if success then
achievement({
Title = "Insanity hallucination",
Desc = "H0l_ m0 I'0 dy00g",
Reason = "Encounter Reverse hallucination",
Image = "rbxassetid://18147873567"
})
end
end

fadeObject(imageLabel, 1, 0, 1)
fadeObject(instructionLabel, 1, 0, 1)
task.wait(1)
end

gui:Destroy()
sound:Destroy()
end

sound.Loaded:Connect(function()
sound:Play()
runSequence()
end)

if not sound.IsLoaded then
sound.Loaded:Wait()
end
end

local function checkRoom()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 63 then
loadHallucination()
else
local connection
connection = game.ReplicatedStorage.GameData.LatestRoom.Changed:Connect(function()
if game.ReplicatedStorage.GameData.LatestRoom.Value == 63 then
connection:Disconnect()
loadHallucination()
end
end)
end
end

checkRoom()
local function handleInfoGui()
local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local infoGui = playerGui:FindFirstChild("Info")

if infoGui then
local mainFrame = infoGui:FindFirstChild("MainFrame") or infoGui:FindFirstChildOfClass("Frame") or infoGui

local startPos = mainFrame.Position
local endPos = UDim2.new(1, mainFrame.AbsoluteSize.X, startPos.Y.Scale, startPos.Y.Offset)

local slideDuration = 2
local startTime = tick()

while tick() - startTime < slideDuration do
local progress = (tick() - startTime) / slideDuration
mainFrame.Position = startPos:Lerp(endPos, progress)
task.wait()
end

infoGui:Destroy()
end
end

-- Wait 5 seconds then execute
task.delay(5, handleInfoGui)
