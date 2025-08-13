-- Make sure the button is created after the Window is fully initialized
local gui = Instance.new("ScreenGui")
gui.Name = "StrikeXMenuGUI"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

local button = Instance.new("ImageButton")
button.Size = UDim2.new(0, 60, 0, 60)
button.Position = UDim2.new(0, 70, 0, 70)
button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
button.Image = "rbxassetid://119615372248548"
button.Name = "StrikeXToggle"
button.AutoButtonColor = true
button.Parent = gui

local corner = Instance.new("UICorner", button)
corner.CornerRadius = UDim.new(0, 12)

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(20, 0, 54)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = button

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(150, 0, 0))
}
gradient.Rotation = 45
gradient.Parent = stroke

-- Dragging setup
local dragging, dragInput, dragStart, startPos
button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = button.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

button.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        button.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
    end
end)

-- Make sure the window is ready before toggling
local opened = true
button.MouseButton1Click:Connect(function()
    opened = not opened
    if opened then
        if typeof(Window.Open) == "function" then
            Window:Open()
        end
    else
        if typeof(Window.Close) == "function" then
            Window:Close()
        end
    end
end)

-- Cleanup if WindUI window is destroyed
Window:OnDestroy(function()
    gui:Destroy()
end)
