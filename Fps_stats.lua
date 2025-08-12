local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MidnightFPSPing"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Colors from Midnight scheme
local Accent = Color3.fromHex("#a855f7")
local Dialog = Color3.fromHex("#2E004F")
local Outline = Color3.fromHex("#6b21a8")
local TextColor = Color3.fromHex("#f3e8ff")
local ButtonColor = Color3.fromHex("#9333ea")

-- Main frame (rounded rectangle)
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 180, 0, 50)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Dialog
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0, 0)
frame.Parent = gui

-- UIStroke for outline
local outline = Instance.new("UIStroke")
outline.Color = Outline
outline.Thickness = 2
outline.Parent = frame

-- UICorner for rounded edges
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

-- Close button (X)
local closeBtn = Instance.new("TextButton")
closeBtn.Name = "CloseButton"
closeBtn.Text = "X"
closeBtn.TextColor3 = TextColor
closeBtn.BackgroundColor3 = ButtonColor
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 10)
closeBtn.AnchorPoint = Vector2.new(1, 0)
closeBtn.AutoButtonColor = true
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 22
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- FPS TextLabel
local fpsLabel = Instance.new("TextLabel")
fpsLabel.Name = "FPSLabel"
fpsLabel.Size = UDim2.new(0, 100, 0, 20)
fpsLabel.Position = UDim2.new(0, 10, 0, 10)
fpsLabel.BackgroundTransparency = 1
fpsLabel.TextColor3 = TextColor
fpsLabel.Font = Enum.Font.SourceSansSemibold
fpsLabel.TextSize = 16
fpsLabel.TextXAlignment = Enum.TextXAlignment.Left
fpsLabel.Text = "FPS: ..."
fpsLabel.Parent = frame

-- Ping TextLabel
local pingLabel = Instance.new("TextLabel")
pingLabel.Name = "PingLabel"
pingLabel.Size = UDim2.new(0, 100, 0, 20)
pingLabel.Position = UDim2.new(0, 10, 0, 28)
pingLabel.BackgroundTransparency = 1
pingLabel.TextColor3 = TextColor
pingLabel.Font = Enum.Font.SourceSansSemibold
pingLabel.TextSize = 16
pingLabel.TextXAlignment = Enum.TextXAlignment.Left
pingLabel.Text = "Ping: ..."
pingLabel.Parent = frame

-- Drag logic
local dragging, dragInput, dragStart, startPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(
            startPos.X.Scale,
            math.clamp(startPos.X.Offset + delta.X, 0, workspace.CurrentCamera.ViewportSize.X - frame.AbsoluteSize.X),
            startPos.Y.Scale,
            math.clamp(startPos.Y.Offset + delta.Y, 0, workspace.CurrentCamera.ViewportSize.Y - frame.AbsoluteSize.Y)
        )
    end
end)

-- FPS calculation
local lastTime = tick()
local frameCount = 0
local fps = 0

RunService.RenderStepped:Connect(function()
    frameCount += 1
    local now = tick()
    if now - lastTime >= 1 then
        fps = frameCount / (now - lastTime)
        fpsLabel.Text = string.format("FPS: %d", math.floor(fps))
        frameCount = 0
        lastTime = now
    end

    -- Update ping (in ms)
    local ping = player:GetNetworkPing() * 1000
    pingLabel.Text = string.format("Ping: %d ms", math.floor(ping))
end)
