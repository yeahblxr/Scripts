
local RS = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local SG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
SG.Name = "MidnightHub"
SG.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", SG)
mainFrame.Size = UDim2.new(0, 200, 0, 150) -- Reduced from 250 to 150
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -75) -- Adjusted position
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BackgroundTransparency = 0.2

local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
titleBar.BorderSizePixel = 0
titleBar.BackgroundTransparency = 0.2

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -60, 1, 0)
title.Text = "Midnight Hub"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 14

local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -60, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(83, 64, 120)
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.BackgroundTransparency = 0.2

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.BackgroundColor3 = Color3.fromRGB(141, 48, 75)
closeBtn.BorderSizePixel = 0
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BackgroundTransparency = 0.2

-- Minimized frame (clickable button)
local minimizedFrame = Instance.new("TextButton", SG)
minimizedFrame.Size = UDim2.new(0, 50, 0, 50)
minimizedFrame.Position = UDim2.new(0.5, -25, 0.5, -25)
minimizedFrame.BackgroundColor3 = Color3.fromRGB(40, 30, 60)
minimizedFrame.BorderSizePixel = 0
minimizedFrame.Active = true
minimizedFrame.Draggable = true
minimizedFrame.Visible = false
minimizedFrame.BackgroundTransparency = 0.2
minimizedFrame.Text = "MH"
minimizedFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizedFrame.Font = Enum.Font.GothamBold
minimizedFrame.TextSize = 16

local isMinimized = false

minimizeBtn.MouseButton1Click:Connect(function()
    isMinimized = true
    mainFrame.Visible = false
    minimizedFrame.Visible = true
end)

minimizedFrame.MouseButton1Click:Connect(function()
    isMinimized = false
    mainFrame.Visible = true
    minimizedFrame.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    SG:Destroy()
end)

local content = Instance.new("Frame", mainFrame)
content.Size = UDim2.new(1, -20, 1, -40)
content.Position = UDim2.new(0, 10, 0, 35)
content.BackgroundTransparency = 1

local function createToggle(name, yPos)
    local frame = Instance.new("Frame", content)
    frame.Size = UDim2.new(1, 0, 0, 35) -- Reduced from 40 to 35
    frame.Position = UDim2.new(0, 0, 0, yPos)
    frame.BackgroundTransparency = 1
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0.6, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.Text = name
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    
    local button = Instance.new("TextButton", frame)
    button.Size = UDim2.new(0, 60, 0, 25)
    button.Position = UDim2.new(0.65, 0, 0.5, -12.5)
    button.Text = "OFF"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(83, 64, 120)
    button.BorderSizePixel = 0
    button.Font = Enum.Font.Gotham
    button.BackgroundTransparency = 0.2
    
    return button
end

local killBtn = createToggle("Kill Aura", 0)
local healBtn = createToggle("Auto Heal", 35) -- Adjusted spacing

local killing, healing = false, false

killBtn.MouseButton1Click:Connect(function()
    killing = not killing
    killBtn.Text = killing and "ON" or "OFF"
    killBtn.BackgroundColor3 = killing and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(83, 64, 120)
end)

healBtn.MouseButton1Click:Connect(function()
    healing = not healing
    healBtn.Text = healing and "ON" or "OFF"
    healBtn.BackgroundColor3 = healing and Color3.fromRGB(50, 200, 50) or Color3.fromRGB(83, 64, 120)
end)

-- Kill loop
task.spawn(function()
    while task.wait(0.2) do
        if killing then
            local enemies = {}
            for _, e in ipairs(workspace.Enemies:GetChildren()) do
                if e:FindFirstChild("Humanoid") and e.Humanoid.Health > 0 then
                    table.insert(enemies, e)
                end
            end
            if #enemies > 0 then
                RS.OnServerEvents.CombatServer:FireServer(enemies, "SwordSlam", {riposte = false})
            end
        end
    end
end)

-- Heal loop
task.spawn(function()
    while task.wait(0.2) do
        if healing then
            RS.OnServerEvents.PlrDamaged:FireServer(-100)
        end
    end
end)

-- Status label
local statusLabel = Instance.new("TextLabel", content)
statusLabel.Size = UDim2.new(1, 0, 0, 25) -- Reduced from 30 to 25
statusLabel.Position = UDim2.new(0, 0, 1, -25) -- Adjusted position
statusLabel.Text = "Status: Active"
statusLabel.TextColor3 = Color3.fromRGB(150, 255, 150)
statusLabel.BackgroundTransparency = 1
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextSize = 12

-- Corner rounding function
local function applyCornerRadius(frame, radius)
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, radius)
    return corner
end

-- Apply rounded corners to UI elements
applyCornerRadius(mainFrame, 8)
applyCornerRadius(titleBar, 8)
applyCornerRadius(closeBtn, 8)
applyCornerRadius(minimizeBtn, 8)
applyCornerRadius(minimizedFrame, 25) -- More rounded for the small square
applyCornerRadius(killBtn, 4)
applyCornerRadius(healBtn, 4)

-- Add a subtle shadow effect
local shadow = Instance.new("ImageLabel", mainFrame)
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.Size = UDim2.new(1, 10, 1, 10)
shadow.Position = UDim2.new(0, -5, 0, -5)
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1
