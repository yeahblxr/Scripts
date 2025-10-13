-- hi
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

WindUI:AddTheme({
    Name = "Midnight",
    Accent = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#2e004f"), Transparency = 0.2 },
        ["100"] = { Color = Color3.fromHex("#8d09b5"), Transparency = 0.2 },
    }, { Rotation = 45 }),
    Accent = "#a855f7",
    Dialog = "#2E004F",
    Outline = "#6b21a8",
    Text = "#f3e8ff",
    Placeholder = "#d8b4fe",
    Background = "#2e004f",
    Button = "#9333ea",
    Icon = "#e9d5ff",
})

local Window = WindUI:CreateWindow({
    Title = "Midnight - Survive Lebron 2",
    Icon = "moon",
    Author = "Yeahblxr",
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house",
    Locked = false,
})

-- Collect all lever names dynamically
local leverNames = {}
for _, v in pairs(workspace:GetDescendants()) do
    if v:IsA("Model") and v.Name:match("^Lever_%d+$") then
        table.insert(leverNames, v.Name)
    end
end

-- Sort lever names numerically
table.sort(leverNames, function(a, b)
    return tonumber(a:match("%d+")) < tonumber(b:match("%d+"))
end)

-- Function to get model's center CFrame safely
local function getModelCFrame(model)
    if not model:IsA("Model") then return end
    local primary = model.PrimaryPart
    if not primary then
        -- If no PrimaryPart, calculate an approximate CFrame from its parts
        local parts = model:GetDescendants()
        for _, p in ipairs(parts) do
            if p:IsA("BasePart") then
                return p.CFrame
            end
        end
    else
        return primary.CFrame
    end
end

-- Create dropdown for teleporting to levers
local Dropdown = Tab:Dropdown({
    Title = "Teleport to Lever",
    Values = #leverNames > 0 and leverNames or {"No levers found"},
    Value = leverNames[1] or "None",
    Callback = function(selected)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then
            warn("No HumanoidRootPart found!")
            return
        end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v.Name == selected then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.SeatPart then
                    humanoid.Sit = false
                    task.wait(0.1)
                end

                local targetCFrame = getModelCFrame(v)
                if targetCFrame then
                    root.CFrame = targetCFrame + Vector3.new(0, 3, 0) -- teleport slightly above lever
                    print("Teleported to " .. selected)
                else
                    warn("Failed to find a CFrame for " .. selected)
                end
                return
            end
        end

        warn("Could not find model: " .. selected)
    end
})
