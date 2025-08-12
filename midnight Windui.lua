local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

WindUI:AddTheme({
    Name = "Midnight",
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
    Title = "Midnight Hub",
    Icon = "moon",
    Author = "Yeahblxr",
    Folder = "Midnight Hub",
    Size = UDim2.fromOffset(580, 360),
    Transparent = true,
    Theme = "Midnight",
    Resizable = true,
    SideBarWidth = 200,
    Background = "",
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
    KeySystem = {
        Key = { "Midnight" },
        Note = "If you remember the old script key, it's the same. (Join Discord for the key) ",
        Thumbnail = {
            Image = "rbxassetid://117617062603739",
            Title = "Midnight Hub Key",
        },
        URL = "https://discord.gg/Yqak7y7DYT",
        SaveKey = true,
    },
})

Window:Tag({
    Title = "Beta 0.9.3.0",
    Color = Color3.fromHex("#663399")
})

Window:EditOpenButton({
    Title = "Midnight Hub",
    Icon = "moon",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("523F77"), 
        Color3.fromHex("663399")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

local Tab = Window:Tab({
    Title = "Home",
    Icon = "house",
    Locked = false,
})

local Dialog = Window:Dialog({
    Icon = "upload",
    Title = "Update Log",
    Content = "New UI",
    Buttons = {
        {
            Title = "Confirm",
            Callback = function()
                print("Confirmed!")
            end,
        },
        {
            Title = "Cancel",
            Callback = function()
                print("Cancelled!")
            end,
        },
    },
})

local Button = Tab:Button({
    Title = "Discord",
    Desc = "Copy Discord Server Link",
    Locked = false,
    Callback = function()
         setclipboard("https://discord.gg/Yqak7y7DYT")
            WindUI:Notify({
    Title = "Copied!",
    Content = "Discord link copied to clipboard",
    Duration = 2, -- 3 seconds
    Icon = "check",
})
    end
})

local Button = Tab:Button({
    Title = "Tiktok",
    Desc = "Copy Tiktok profile Link",
    Locked = false,
    Callback = function()
         setclipboard("https://www.tiktok.com/@yeahblxr")
            WindUI:Notify({
    Title = "Copied!",
    Content = "Tiktok link copied to clipboard",
    Duration = 2, -- 3 seconds
    Icon = "check",
})
    end
})

local Button = Tab:Button({
    Title = "Github",
    Desc = "Copy Github Link",
    Locked = false,
    Callback = function()
         setclipboard("https://github.com/yeahblxr/-Midnight-hub/blob/main/Midnight%20Hub")
            WindUI:Notify({
    Title = "Copied!",
    Content = "Github link copied to clipboard",
    Duration = 2, -- 3 seconds
    Icon = "check",
})
    end
})


local Tab = Window:Tab({
    Title = "Player",
    Icon = "user",
    Locked = false,
})

local Slider = Tab:Slider({
    Title = "Walkspeed",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 2,
    
    Value = {
        Min = 1,
        Max = 500,
        Default = 16,
    },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

local Slider = Tab:Slider({
    Title = "Jumppower",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 10,
    
    Value = {
        Min = 1,
        Max = 1000,
        Default = 50,
    },
    Callback = function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
    end
})
-- Inf Jump start
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- keep track of the connection so we can disconnect it
local infiniteJumpConnection

local Toggle = Tab:Toggle({
    Title = "Infinite Jump",
    Desc = "Allows you jump in the air",
    Icon = "infinity",
    Type = "Checkbox",
    Default = false,
    Callback = function(enabled) 
        if enabled then
            -- if already connected, avoid double-connecting
            if infiniteJumpConnection then return end

            infiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
                local character = localPlayer.Character
                if not character then return end
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.Health > 0 then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        else
            -- disable: disconnect the listener
            if infiniteJumpConnection then
                infiniteJumpConnection:Disconnect()
                infiniteJumpConnection = nil
            end
        end
    end,
})

-- Respawn at Death area script start
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local deathPosition = nil
local characterAddedConnection = nil
local deathConnections = {} -- track humanoid.Died connections per character

local function onCharacterDied(character)
    if not character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        deathPosition = hrp.Position
    end
end

local function cleanupCharacterConnections(character)
    if deathConnections[character] then
        deathConnections[character]:Disconnect()
        deathConnections[character] = nil
    end
end

local function onCharacterAdded(character)
    -- ensure previous connections for this character are cleaned (safety)
    cleanupCharacterConnections(character)

    local humanoid = character:WaitForChild("Humanoid")
    -- connect death listener and store it
    deathConnections[character] = humanoid.Died:Connect(function()
        onCharacterDied(character)
    end)

    -- if we have a stored deathPosition (and toggle is still on), teleport
    if deathPosition then
        local hrp = character:WaitForChild("HumanoidRootPart")
        if hrp then
            -- small upward offset so they don't get stuck
            hrp.CFrame = CFrame.new(deathPosition + Vector3.new(0, 5, 0))
        end
    end

    -- clean up when character is removed/replaced
    character.AncestryChanged:Connect(function(_, parent)
        if not parent then
            cleanupCharacterConnections(character)
        end
    end)
end

-- Toggle
local Toggle = Tab:Toggle({
    Title = "Respawn At death point",
    Desc = "Respawns you at the area where you died",
    Icon = "rotate-ccw",
    Type = "Checkbox",
    Default = false,
    Callback = function(enabled) 
        if enabled then
            -- start tracking
            deathPosition = nil -- reset any old death position
            characterAddedConnection = player.CharacterAdded:Connect(onCharacterAdded)
            if player.Character then
                onCharacterAdded(player.Character)
            end
        else
            -- stop tracking and clear state
            if characterAddedConnection then
                characterAddedConnection:Disconnect()
                characterAddedConnection = nil
            end
            deathPosition = nil
            -- clean up any existing per-character death listeners
            for character, conn in pairs(deathConnections) do
                if conn then
                    conn:Disconnect()
                end
                deathConnections[character] = nil
            end
        end
    end,
})

-- Fov Changer script start
-- helper clamp in case Rayfield or environment doesn't have one
local function clamp(val, min, max)
    if val < min then return min end
    if val > max then return max end
    return val
end

-- initialize with current FOV (clamped to allowed range)
local initialFov = clamp(tonumber(workspace.CurrentCamera.FieldOfView) or 70, 70, 120)

local Input = Tab:Input({
    Title = "Fov Changer",
    Desc = "Change your fov (70-120)",
    Value = tostring(initialFov),
    InputIcon = "file-json",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter Fov (70-120)",
    Callback = function(Text) 
        local num = tonumber(Text)
        if not num then
            WindUI:Notify({
                Title = "Invalid Value",
                Content = "Please enter a number between 70 and 120.",
                Duration = 2,
                Icon = "ban"
            })
            return
        end

        local newFov = clamp(num, 70, 120)
        workspace.CurrentCamera.FieldOfView = newFov

        -- if the user entered out-of-range, you can reflect the clamped value back
        if newFov ~= num then
            -- optional: update the input display if API supports it
            -- e.g., if there's a SetValue method: Input:SetValue(tostring(newFov))
            WindUI:Notify({
                Title = "FOV Adjusted",
                Content = string.format("FOV was clamped to %d (range is 70–120).", newFov),
                Duration = 3.5,
                Icon = "ban",
            })
        else
            WindUI:Notify({
                Title = "FOV Changed",
                Content = string.format("FOV has been changed to %d", newFov),
                Duration = 3.5,
                Icon = "check"
            })
        end
    end,
})

local Tab = Window:Tab({
    Title = "Fun Scripts",
    Icon = "joystick",
    Locked = false,
})

local Button = Tab:Button({
    Title = "No Fe Snake",
    Desc = "Gives you like a snake thing",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt'))()
    end
})

local Button = Tab:Button({
    Title = "Fake Lag",
    Desc = "Makes you look laggy",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/FAKELAG/refs/heads/main/Fakelag"))()
    end
})

local Button = Tab:Button({
    Title = "Jerk",
    Desc = "Gives goon item (FE)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/FAKELAG/refs/heads/main/Fakelag"))()
    end
})

local Button = Tab:Button({
    Title = "Fling All",
    Desc = "(Needs Player Colisions)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/FAKELAG/refs/heads/main/Fakelag"))()
    end
})


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local humanoid = nil

local originalJumpPower
local originalGravity = workspace.Gravity

-- Function to enable or disable moon gravity
local function toggleMoonGravity(state)
    local character = player.Character or player.CharacterAdded:Wait()
    humanoid = character:WaitForChild("Humanoid")

    if state then
        -- Save original jump power
        originalJumpPower = humanoid.JumpPower

        -- Apply moon gravity
        workspace.Gravity = 50 -- Default is 196.2; 50 is like low gravity
    else
        -- Reset to default
        workspace.Gravity = originalGravity
        humanoid.JumpPower = originalJumpPower or 50
    end
end

-- Rayfield Toggle
local Toggle = Tab:Toggle({
    Title = "Moon Gravity",
    Desc = "Lowers gravity to make it look like your on the moon",
    Icon = "moon",
    Type = "Checkbox",
    Default = false,
    Callback = function(value) 
        toggleMoonGravity(Value)
    end,
})


local Button = Tab:Button({
    Title = "Egor",
    Desc = "Makes you run like Egor",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/FAKELAG/refs/heads/main/Fakelag"))()
    end
})



-- Ensure character/player is loaded (if this runs very early)
if not player then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    player = Players.LocalPlayer
end

local nameToShow = player.DisplayName
-- Optional: if you want the actual username instead of/displayName fallback:
-- local nameToShow = player.DisplayName ~= "" and player.DisplayName or player.Name

WindUI:Notify({
    Title = "Midnight Hub Loaded",
    Content = ("Greetings, %s!"):format(nameToShow),
    Duration = 3,
    Icon = "user-check",
})
