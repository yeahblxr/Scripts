-- Midnight Fly GUI with author credit

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

local flying = false
local flySpeed = 80
local attachment
local linearVelocity
local descending = false

-- Colors (Amethyst)
local BG = Color3.fromRGB(45, 25, 85)
local HEADER = Color3.fromRGB(110, 65, 200)
local ACCENT = Color3.fromRGB(170, 120, 230)
local TEXT = Color3.fromRGB(245, 245, 255)
local BUTTON = Color3.fromRGB(140, 100, 220)
local BUTTON_DARK = Color3.fromRGB(100, 60, 180)

-- Enable/disable fly
local function enableFly()
    if flying then return end
    flying = true
    if not attachment then
        attachment = Instance.new("Attachment")
        attachment.Parent = hrp
    end
    if not linearVelocity then
        linearVelocity = Instance.new("LinearVelocity")
        linearVelocity.Attachment0 = attachment
        linearVelocity.RelativeTo = Enum.ActuatorRelativeTo.World
        linearVelocity.MaxForce = 1e5
        linearVelocity.Parent = hrp
    end
    linearVelocity.Enabled = true
end

local function disableFly()
    if not flying then return end
    flying = false
    if linearVelocity then
        linearVelocity.Enabled = false
    end
end

-- Flight logic
RunService.Heartbeat:Connect(function()
    if not flying or not linearVelocity then return end
    local moveDir = humanoid.MoveDirection or Vector3.new()
    local upward = 0
    if humanoid.Jump then
        upward = upward + 1
    end
    if descending then
        upward = upward - 1
    end
    local direction = moveDir + Vector3.new(0, upward, 0)
    if direction.Magnitude > 0 then
        linearVelocity.VectorVelocity = direction.Unit * flySpeed
    else
        linearVelocity.VectorVelocity = Vector3.new(0, 0, 0)
    end
end)

-- GUI setup
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MidnightFlyGUI"
if syn and syn.protect_gui then
    syn.protect_gui(screenGui)
end
if pcall(function() screenGui.Parent = game:GetService("CoreGui") end) == false then
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 330, 0, 190)
frame.Position = UDim2.new(0.5, -165, 0.4, -95)
frame.BackgroundColor3 = BG
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- Header
local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, 32)
titleBar.BackgroundColor3 = HEADER
titleBar.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 1, 0)
title.BackgroundTransparency = 1
title.Text = "Midnight Fly"  -- Renamed title here
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = TEXT
title.Parent = titleBar

-- Author label top-left corner
local authorLabel = Instance.new("TextLabel")
authorLabel.Size = UDim2.new(0, 80, 0, 16)
authorLabel.Position = UDim2.new(0, 6, 0, 6)
authorLabel.BackgroundTransparency = 1
authorLabel.Text = "by yeahblxr"
authorLabel.Font = Enum.Font.Gotham
authorLabel.TextSize = 12
authorLabel.TextColor3 = Color3.fromRGB(190, 180, 230) -- lighter subtle color
authorLabel.TextXAlignment = Enum.TextXAlignment.Left
authorLabel.TextYAlignment = Enum.TextYAlignment.Top
authorLabel.Parent = frame

-- Close button (X)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 32)
closeBtn.Position = UDim2.new(1, -36, 0, 0)
closeBtn.BackgroundColor3 = BUTTON_DARK
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 18
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BorderSizePixel = 0
closeBtn.Parent = titleBar

-- Fly toggle button
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 130, 0, 32)
toggleBtn.Position = UDim2.new(0, 12, 0, 48)
toggleBtn.BackgroundColor3 = BUTTON
toggleBtn.Text = "Enable Fly"
toggleBtn.Font = Enum.Font.GothamSemibold
toggleBtn.TextSize = 14
toggleBtn.TextColor3 = Color3.fromRGB(25, 25, 40)
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = frame

-- Minus button
local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 40, 0, 32)
minusBtn.Position = UDim2.new(0, 150, 0, 48)
minusBtn.BackgroundColor3 = BUTTON_DARK
minusBtn.Text = "-"
minusBtn.Font = Enum.Font.GothamBold
minusBtn.TextSize = 20
minusBtn.TextColor3 = TEXT
minusBtn.BorderSizePixel = 0
minusBtn.Parent = frame

-- Speed label
local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 70, 0, 32)
speedLabel.Position = UDim2.new(0, 195, 0, 48)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: " .. math.floor(flySpeed)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 16
speedLabel.TextColor3 = TEXT
speedLabel.TextXAlignment = Enum.TextXAlignment.Center
speedLabel.Parent = frame

-- Plus button
local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 40, 0, 32)
plusBtn.Position = UDim2.new(0, 280, 0, 48)
plusBtn.BackgroundColor3 = BUTTON_DARK
plusBtn.Text = "+"
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 20
plusBtn.TextColor3 = TEXT
plusBtn.BorderSizePixel = 0
plusBtn.Parent = frame

-- Descend button (smaller height)
local downBtn = Instance.new("TextButton")
downBtn.Size = UDim2.new(1, -24, 0, 50)
downBtn.Position = UDim2.new(0, 12, 0, 100)
downBtn.BackgroundColor3 = ACCENT
downBtn.Text = "Hold to Descend"
downBtn.Font = Enum.Font.Gotham
downBtn.TextSize = 18
downBtn.TextColor3 = Color3.fromRGB(30, 30, 40)
downBtn.BorderSizePixel = 0
downBtn.Parent = frame

-- Instructions label
local instr = Instance.new("TextLabel")
instr.Size = UDim2.new(1, -24, 0, 24)
instr.Position = UDim2.new(0, 12, 1, -30)
instr.BackgroundTransparency = 1
instr.Text = "Use WASD/joystick to move, jump ↑, hold descend ↓, F to toggle fly."
instr.Font = Enum.Font.Gotham
instr.TextSize = 11
instr.TextColor3 = TEXT
instr.TextWrapped = true
instr.TextXAlignment = Enum.TextXAlignment.Left
instr.Parent = frame

-- UI update helpers
local function refreshSpeedUI()
    speedLabel.Text = ("Speed: %.0f"):format(flySpeed)
end

local function updateToggleText()
    if flying then
        toggleBtn.Text = "Disable Fly"
        toggleBtn.BackgroundColor3 = Color3.fromRGB(160, 130, 250)
    else
        toggleBtn.Text = "Enable Fly"
        toggleBtn.BackgroundColor3 = BUTTON
    end
end

-- Button connections
toggleBtn.MouseButton1Click:Connect(function()
    if flying then
        disableFly()
    else
        enableFly()
    end
    updateToggleText()
end)

plusBtn.MouseButton1Click:Connect(function()
    flySpeed = flySpeed + 10
    refreshSpeedUI()
end)

minusBtn.MouseButton1Click:Connect(function()
    flySpeed = math.max(1, flySpeed - 10)
    refreshSpeedUI()
end)

downBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        descending = true
    end
end)

downBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        descending = false
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    disableFly()
    screenGui:Destroy()
end)

-- F key toggle
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        if flying then
            disableFly()
        else
            enableFly()
        end
        updateToggleText()
    end
end)

-- Respawn handling
LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
    hrp = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
    if attachment then
        attachment:Destroy()
        attachment = nil
    end
    if linearVelocity then
        linearVelocity:Destroy()
        linearVelocity = nil
    end
end)

-- Init UI
refreshSpeedUI()
updateToggleText()
