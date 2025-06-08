local plr = game.Players.LocalPlayer
local chr = plr.Character or plr.CharacterAdded:Wait()
local cam = workspace.CurrentCamera
local offsetgyat = 7.5
local TweenService = game:GetService("TweenService")

local entity = game:GetObjects("rbxassetid://14123016442")[1]
entity.Parent = workspace
local primary_part = entity:FindFirstChildWhichIsA("BasePart") or entity:FindFirstChildWhichIsA("Part")
entity.PrimaryPart = primary_part

if not entity.PrimaryPart then return end

entity:SetPrimaryPartCFrame(chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -offsetgyat))
entity.PrimaryPart.Anchored = true

local horrorScream = entity:WaitForChild("OOGA BOOGAAAA"):WaitForChild("jumpscare")
game.workspace.Daze.PlaySound:Destroy()


local function damageblud()
    local hum = chr:FindFirstChild("Humanoid")
    if hum then
        local dmg = 30
        hum:TakeDamage(dmg)
    end
end

local function check()
    local direction = (entity.PrimaryPart.Position - cam.CFrame.Position).unit
    local dot_product = direction:Dot(cam.CFrame.LookVector)
    return dot_product > 0.50
end

local function move(target_cframe, duration)
    local tween_info = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(entity.PrimaryPart, tween_info, {CFrame = target_cframe})
    tween:Play()
    tween.Completed:Wait()
end

entity.PrimaryPart.Anchored = false
wait(4)

if check() then
firesignal(game.ReplicatedStorage.RemotesFolder.DeathHint.OnClientEvent, {"You died to who you call Daze...", "Don't Look At Him And He Wouldn't Damage You!"}, "Blue")

    move(chr.HumanoidRootPart.CFrame, 0.5)
    damageblud()
    horrorScream:Play()
end

entity.PrimaryPart.Anchored = false
entity.PrimaryPart.CanCollide = false


local YouStupidNigger= loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()


YouStupidNigger({
    Title = "Stay Tuned",
    Desc = "Wake Up!",
    Reason = "Encounter Daze.",
    Image = "rbxassetid://123892760857811"
})

wait(1)
entity:Destroy()
