local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local humanoid = character:WaitForChild("Humanoid")

-- Flight state
local flying = false
local flySpeed = 80
local attachment
local linearVelocity
local descending = false

-- Theme
local BG           = Color3.fromRGB(34, 27, 53)
local HEADER       = Color3.fromRGB(75, 59, 110)
local ACCENT       = Color3.fromRGB(145, 115, 210)
local TEXT         = Color3.fromRGB(230, 225, 245)
local BUTTON       = Color3.fromRGB(100, 80, 160)
local BUTTON_HOVER = Color3.fromRGB(125, 100, 190)
local BUTTON_ACTIVE= Color3.fromRGB(165, 135, 230)
local BUTTON_DARK  = Color3.fromRGB(55, 45, 90)

-- Enable / disable fly
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
    -- glow effect when you fly
    if not hrp:FindFirstChild("MidnightFlyGlow") then
        local adorn = Instance.new("SelectionBox")
        adorn.Name = "MidnightFlyGlow"
        adorn.Adornee = hrp.Parent:FindFirstChild("HumanoidRootPart") or hrp
        adorn.LineThickness = 0.05
        adorn.Color3 = ACCENT
        adorn.SurfaceColor3 = ACCENT
        adorn.Parent = hrp
    end
end

local function disableFly()
    if not flying then return end
    flying = false
    if linearVelocity then
        linearVelocity.Enabled = false
    end
    -- remove glow
    local glow = hrp:FindFirstChild("MidnightFlyGlow")
    if glow then glow:Destroy() end
end

-- Movement update
RunService.Heartbeat:Connect(function()
    if not flying or not linearVelocity then return end
    local moveDir = humanoid.MoveDirection or Vector3.new()
    local upward = 0
    if humanoid.Jump then upward += 1 end
    if descending then upward -= 1 end
    local direction = moveDir + Vector3.new(0, upward, 0)
    if direction.Magnitude > 0 then
        linearVelocity.VectorVelocity = direction.Unit * flySpeed
    else
        linearVelocity.VectorVelocity = Vector3.new()
    end
end)

-- GUI 
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MidnightFlyGUI"
if syn and syn.protect_gui then syn.protect_gui(screenGui) end
if pcall(function() screenGui.Parent = game:GetService("CoreGui") end) == false then
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

local function roundize(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = obj
end

-- Full frame
local fullSize = UDim2.new(0, 440, 0, 250)
local fullPos = UDim2.new(0.5, -220, 0.4, -125)
local isMinimized = false
local savedProps = {}

local frame = Instance.new("Frame")
frame.Size = fullSize
frame.Position = fullPos
frame.BackgroundColor3 = BG
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui
roundize(frame, 16)

-- Header
local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 40)
header.Position = UDim2.new(0, 0, 0, 0)
header.BackgroundColor3 = HEADER
header.Parent = frame
roundize(header, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -160, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Midnight Fly"
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.TextColor3 = TEXT
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = header

-- Close & minimize
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,32,0,32)
closeBtn.Position = UDim2.new(1, -44, 0, 4)
closeBtn.BackgroundColor3 = BUTTON_DARK
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.TextColor3 = TEXT
closeBtn.BorderSizePixel = 0
closeBtn.Parent = header
roundize(closeBtn, 6)

local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0,32,0,32)
minimizeBtn.Position = UDim2.new(1, -84, 0, 4)
minimizeBtn.BackgroundColor3 = BUTTON_DARK
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 24
minimizeBtn.TextColor3 = TEXT
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = header
roundize(minimizeBtn, 6)

local author = Instance.new("TextLabel")
author.Size = UDim2.new(0, 160, 0, 16)
author.Position = UDim2.new(0, 14, 0, 48)
author.BackgroundTransparency = 1
author.Text = "by yeahblxr"
author.Font = Enum.Font.Gotham
author.TextSize = 12
author.TextColor3 = Color3.fromRGB(200, 190, 235)
author.TextXAlignment = Enum.TextXAlignment.Left
author.Parent = frame

-- Controls
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 170, 0, 42)
toggleBtn.Position = UDim2.new(0, 16, 0, 75)
toggleBtn.BackgroundColor3 = BUTTON
toggleBtn.Text = "Enable Fly"
toggleBtn.Font = Enum.Font.GothamSemibold
toggleBtn.TextSize = 14
toggleBtn.TextColor3 = Color3.fromRGB(25,25,40)
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = frame
roundize(toggleBtn, 8)

local minusBtn = Instance.new("TextButton")
minusBtn.Size = UDim2.new(0, 44, 0, 42)
minusBtn.Position = UDim2.new(0, 200, 0, 75)
minusBtn.BackgroundColor3 = BUTTON_DARK
minusBtn.Text = "-"
minusBtn.Font = Enum.Font.GothamBold
minusBtn.TextSize = 20
minusBtn.TextColor3 = TEXT
minusBtn.BorderSizePixel = 0
minusBtn.Parent = frame
roundize(minusBtn, 6)

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0, 140, 0, 42)
speedLabel.Position = UDim2.new(0, 230, 0, 75)
speedLabel.BackgroundTransparency = 1
speedLabel.Text = "Speed: " .. math.floor(flySpeed)
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 16
speedLabel.TextColor3 = TEXT
speedLabel.TextXAlignment = Enum.TextXAlignment.Center
speedLabel.Parent = frame

local plusBtn = Instance.new("TextButton")
plusBtn.Size = UDim2.new(0, 44, 0, 42)
plusBtn.Position = UDim2.new(1, -80, 0, 75)
plusBtn.BackgroundColor3 = BUTTON_DARK
plusBtn.Text = "+"
plusBtn.Font = Enum.Font.GothamBold
plusBtn.TextSize = 20
plusBtn.TextColor3 = TEXT
plusBtn.BorderSizePixel = 0
plusBtn.Parent = frame
roundize(plusBtn, 6)

-- Descend button
local downBtn = Instance.new("TextButton")
downBtn.Size = UDim2.new(1, -32, 0, 70)
downBtn.Position = UDim2.new(0, 16, 0, 130)
downBtn.BackgroundColor3 = ACCENT
downBtn.Text = "Hold to Descend"
downBtn.Font = Enum.Font.Gotham
downBtn.TextSize = 16
downBtn.TextColor3 = Color3.fromRGB(30, 30, 40)
downBtn.BorderSizePixel = 0
downBtn.Parent = frame
roundize(downBtn, 8)

-- Instructions
local instr = Instance.new("TextLabel")
instr.Size = UDim2.new(1, -32, 0, 24)
instr.Position = UDim2.new(0, 16, 1, -30)
instr.BackgroundTransparency = 1
instr.Text = "Use joystick/WASD to move, jump ↑, hold descend ↓, F to toggle."
instr.Font = Enum.Font.Gotham
instr.TextSize = 11
instr.TextColor3 = TEXT
instr.TextWrapped = true
instr.TextXAlignment = Enum.TextXAlignment.Left
instr.Parent = frame

-- Minimized gui
local mini = Instance.new("TextButton")
mini.Size = UDim2.new(0, 60, 0, 28)
mini.BackgroundColor3 = HEADER
mini.Text = "MH"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 14
mini.TextColor3 = TEXT
mini.BorderSizePixel = 0
mini.Visible = false
mini.Parent = screenGui
roundize(mini, 12)

-- Tooltip for mini
local tooltip = Instance.new("TextLabel")
tooltip.Size = UDim2.new(0, 100, 0, 24)
tooltip.AnchorPoint = Vector2.new(0, 1)
tooltip.Position = UDim2.new(0, 0, 0, -4)
tooltip.BackgroundColor3 = Color3.fromRGB(20, 15, 40)
tooltip.TextColor3 = TEXT
tooltip.Font = Enum.Font.Gotham
tooltip.TextSize = 12
tooltip.Text = "Midnight Fly"
tooltip.Visible = false
tooltip.Parent = mini
roundize(tooltip, 6)

-- UI helpers
local function refreshSpeedUI()
    speedLabel.Text = ("Speed: %.0f"):format(flySpeed)
end

local function updateToggleText()
    if flying then
        toggleBtn.Text = "Disable Fly"
        toggleBtn.BackgroundColor3 = BUTTON_ACTIVE
    else
        toggleBtn.Text = "Enable Fly"
        toggleBtn.BackgroundColor3 = BUTTON
    end
end

-- Hover effects
local function addHover(btn, base)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = BUTTON_HOVER
    end)
    btn.MouseLeave:Connect(function()
        if btn == toggleBtn then
            updateToggleText()
        else
            btn.BackgroundColor3 = base
        end
    end)
end

addHover(toggleBtn, BUTTON)
addHover(minusBtn, BUTTON_DARK)
addHover(plusBtn, BUTTON_DARK)
addHover(closeBtn, BUTTON_DARK)
addHover(minimizeBtn, BUTTON_DARK)
addHover(downBtn, ACCENT)
addHover(mini, HEADER)

-- Connections
toggleBtn.MouseButton1Click:Connect(function()
    if flying then disableFly() else enableFly() end
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

-- Minimize / restore
minimizeBtn.MouseButton1Click:Connect(function()
    if not isMinimized then
        isMinimized = true
        savedProps.Size = frame.Size
        savedProps.Position = frame.Position
        frame.Visible = false
        mini.Position = UDim2.new(0, frame.AbsolutePosition.X, 0, frame.AbsolutePosition.Y)
        mini.Visible = true
    else
        isMinimized = false
        frame.Size = savedProps.Size
        frame.Position = savedProps.Position
        frame.Visible = true
        mini.Visible = false
    end
end)

mini.MouseButton1Click:Connect(function()
    if isMinimized then
        isMinimized = false
        frame.Size = savedProps.Size
        frame.Position = savedProps.Position
        frame.Visible = true
        mini.Visible = false
    end
end)

mini.MouseEnter:Connect(function()
    tooltip.Visible = true
end)
mini.MouseLeave:Connect(function()
    tooltip.Visible = false
end)

-- Keyboard toggle
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F then
        if flying then disableFly() else enableFly() end
        updateToggleText()
    end
end)

-- Respawn handling
LocalPlayer.CharacterAdded:Connect(function(char)
    character = char
    hrp = character:WaitForChild("HumanoidRootPart")
    humanoid = character:WaitForChild("Humanoid")
    if attachment then attachment:Destroy(); attachment = nil end
    if linearVelocity then linearVelocity:Destroy(); linearVelocity = nil end
end)

-- Init display
refreshSpeedUI()
updateToggleText()
