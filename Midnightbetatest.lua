loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Midnight-intro.lua"))()
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

WindUI:AddTheme({
    Name = "Midnight",

    Accent = WindUI:Gradient({                                                  
        ["0"] = { Color = Color3.fromHex("#2e004f"), Transparency = 0.2 },        
        ["100"]   = { Color = Color3.fromHex("#8d09b5"), Transparency = 0.2 },    
    }, {                                                                        
        Rotation = 45,                                                           
    }),  
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
            Image = "rbxassetid://119615372248548",
            Title = "Midnight Hub Key",
        },
        URL = "https://discord.gg/Yqak7y7DYT",
        SaveKey = true,
    },
})

Window:EditOpenButton({
    Enabled = false
})

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

Window:Tag({
    Title = "V1.3.8",
    Color = Color3.fromHex("#663399")
})


local Tab = Window:Tab({
    Title = "Home",
    Icon = "house",
    Locked = false,
})

local Dialog = Window:Dialog({
    Icon = "upload",
    Title = "Update Log",
    Content = "Spectate players, Free private server, Added settings, added themes, removed egor script. (broken)",
    Buttons = {
        {
            Title = "Continue",
            Callback = function()
                print("Continued")
            end,
        },
    },
})

local Button = Tab:Button({
    Title = "Unc Test",
    Desc = "Take the UNC test to see capabilities of your executor!",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://github.com/ltseverydayyou/uuuuuuu/blob/main/UNC%20test?raw=true"))()
            WindUI:Notify({
    Title = "UNC test results",
    Content = "Type /console in chat or press F9 to view results.",
    Duration = 5, -- 3 seconds
    Icon = "list-checks",
})
    end
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
-- helper clamp in case WindUI or environment doesn't have one
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
    Type = "Input", -- could also be "Textarea"
    Placeholder = "Enter FOV (70-120)",
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

        -- Only show notify if input was out of range and got clamped
        if newFov ~= num then
            WindUI:Notify({
                Title = "FOV Adjusted",
                Content = string.format("FOV was clamped to %d (range is 70–120).", newFov),
                Duration = 3.5,
                Icon = "alert-triangle",
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
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Edge.lua"))()
    end
})

-- Fling Player
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    if not TCharacter then
        return Message("Error Occurred", "Target has no character", 5)
    end

    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = (Accessory and Accessory:FindFirstChild("Handle")) or nil

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit then
            return Message("Error Occurred", "Targeting is sitting", 5)
        end

        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end

        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end

        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end

        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end

        workspace.FallenPartsDestroyHeight = 0/0

        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end

        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid

        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            for _, x in pairs(Character:GetChildren()) do
                if x:IsA("BasePart") then
                    x.Velocity = Vector3.new()
                    x.RotVelocity = Vector3.new()
                end
            end
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end

-- Build list of player names (excluding yourself)
local function GetPlayerNames()
    local names = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Player then
            table.insert(names, plr.Name)
        end
    end
    table.sort(names)
    table.insert(names, 1, "All")
    return names
end

-- Create the dropdown UI
local Dropdown = Tab:Dropdown({
    Title = "Select Player to Fling",
    Values = GetPlayerNames(),
    Value = "All",
    Callback = function(selectedName)
        if selectedName == "All" then
            for _, targetPlayer in ipairs(Players:GetPlayers()) do
                if targetPlayer ~= Player then
                    SkidFling(targetPlayer)
                end
            end
        else
            local targetPlayer = Players:FindFirstChild(selectedName)
            if targetPlayer then
                SkidFling(targetPlayer)
            else
                warn("Player not found: " .. tostring(selectedName))
            end
        end
    end,
})

-- Update dropdown when players join
Players.PlayerAdded:Connect(function(plr)
    if plr ~= Player then
        local currentValues = Dropdown.Values
        table.insert(currentValues, plr.Name)
        table.sort(currentValues)
        Dropdown.Values = currentValues
    end
end)

-- Update dropdown when players leave
Players.PlayerRemoving:Connect(function(plr)
    local currentValues = Dropdown.Values
    for i, name in ipairs(currentValues) do
        if name == plr.Name then
            table.remove(currentValues, i)
            break
        end
    end
    Dropdown.Values = currentValues
end)


-- Moon Gravity
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local originalJumpPower
local originalGravity = workspace.Gravity

local function toggleMoonGravity(state)
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    if state then
        originalJumpPower = humanoid.JumpPower
        workspace.Gravity = 50
    else
        workspace.Gravity = originalGravity
        humanoid.JumpPower = originalJumpPower or 50
    end
end

local Toggle = Tab:Toggle({
    Title = "Moon Gravity",
    Desc = "Lowers gravity to make it look like your on the moon",
    Icon = "moon",
    Type = "Checkbox",
    Default = false,
    Callback = function(value)
        toggleMoonGravity(value)
    end,
})


local Button = Tab:Button({
    Title = "Wallwalk Gui",
    Desc = "Lets you walk on walls (reset charater after pressed)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Wallwalk.lua"))()
    end
})


-- Spectate Player script start
-- Get all player names except yourself
Tab:Divider()

local function getPlayerNames()
    local playerNames = {}
    local localPlayer = game.Players.LocalPlayer
    
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    
    -- Return at least one value to prevent empty dropdown
    if #playerNames == 0 then
        return {"No Players Available"}
    end
    
    return playerNames
end

-- Variables to track spectating state
local isSpectating = false
local spectateConnection = nil
local originalCFrame = nil
local currentSpectateTarget = nil

-- Function to start spectating a player
local function spectatePlayer(playerName)
    if playerName == "No Players Available" then
        print("No players available to spectate")
        return
    end
    
    local targetPlayer = game.Players:FindFirstChild(playerName)
    local localPlayer = game.Players.LocalPlayer
    
    if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        -- Stop current spectating if active
        if isSpectating then
            stopSpectating()
        end
        
        -- Store original camera position
        if not originalCFrame then
            originalCFrame = workspace.CurrentCamera.CFrame
        end
        
        -- Set camera to follow target player
        workspace.CurrentCamera.CameraSubject = targetPlayer.Character.Humanoid
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        
        currentSpectateTarget = targetPlayer
        isSpectating = true
        
        print("Now spectating: " .. playerName)
    else
        print("Could not find player or player's character: " .. playerName)
    end
end

-- Function to stop spectating
local function stopSpectating()
    local localPlayer = game.Players.LocalPlayer
    
    if isSpectating then
        -- Reset camera to local player
        if localPlayer.Character and localPlayer.Character:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.CameraSubject = localPlayer.Character.Humanoid
        end
        
        -- Restore original camera position if available
        if originalCFrame then
            workspace.CurrentCamera.CFrame = originalCFrame
            originalCFrame = nil
        end
        
        workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
        
        isSpectating = false
        currentSpectateTarget = nil
        
        print("Stopped spectating")
    end
end

-- Create dropdown for player selection
local playerNames = getPlayerNames()
local defaultValue = playerNames[1]

local SpectateDropdown = Tab:Dropdown({
    Title = "Spectate Player",
    Values = playerNames,
    Value = defaultValue,
    Callback = function(option) 
        print("Player selected: " .. option)
        spectatePlayer(option)
    end
})

-- Create button to stop spectating
local StopSpectateButton = Tab:Button({
    Title = "Stop Spectating",
    Desc = "Return camera to your character",
    Locked = false,
    Callback = function()
        stopSpectating()
    end
})

-- Function to update dropdown with new player list
local function updatePlayerDropdown()
    local newPlayerNames = getPlayerNames()
    
    -- Update the dropdown values using WindUI's SetValues method
    SpectateDropdown:SetValues(newPlayerNames)
    
    -- If currently spectating someone who left, stop spectating
    if isSpectating and currentSpectateTarget then
        local targetStillExists = false
        for _, name in pairs(newPlayerNames) do
            if name == currentSpectateTarget.Name then
                targetStillExists = true
                break
            end
        end
        
        if not targetStillExists then
            print("Spectate target left the game, stopping spectate")
            stopSpectating()
        end
    end
    
    print("Updated player list")
end

-- Connect to player events to update the dropdown
game.Players.PlayerAdded:Connect(function(player)
    wait(1) -- Small delay to ensure player is fully loaded
    updatePlayerDropdown()
end)

game.Players.PlayerRemoving:Connect(function(player)
    updatePlayerDropdown()
end)

-- Optional: Add a refresh button to manually update the player list
local RefreshButton = Tab:Button({
    Title = "Refresh Player List",
    Desc = "Update the spectate dropdown with current players",
    Locked = false,
    Callback = function()
        updatePlayerDropdown()
    end
})

Tab:Divider()


local Tab = Window:Tab({
    Title = "Advantage",
    Icon = "swords",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Esp",
    Desc = "Lets you see other players through walls",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
    end
})

local Button = Tab:Button({
    Title = "Fly Gui",
    Desc = "Custom-made fly GUI to match the theme of Midnight Hub (inspired by fly GUI V3)",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/-Midnight-hub/refs/heads/main/Midnighthub_Fly.lua"))()
    end
})

local floatName = nil -- or set to a string to exclude that part, e.g. "FloatPart"

local Toggle = Tab:Toggle({
    Title = "Noclip",
    Desc = "Toggle for noclip (after disable jump to fully diable noclip)",
    Icon = "brick-wall",
    Type = "Checkbox",
    Default = false,
    Callback = function(Value) 
        -- persistent connection for this toggle
        if not _G._noclipConnection then _G._noclipConnection = nil end

        local function enableNoclip()
            -- disconnect existing if any
            if _G._noclipConnection then
                _G._noclipConnection:Disconnect()
                _G._noclipConnection = nil
            end

            _G._noclipConnection = game:GetService("RunService").Stepped:Connect(function()
                local player = game.Players.LocalPlayer
                if not player then return end
                local character = player.Character
                if not character then return end

                for _, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") and v.CanCollide then
                        if not floatName or v.Name ~= floatName then
                            v.CanCollide = false
                        end
                    end
                end
            end)
        end

        local function disableNoclip()
            if _G._noclipConnection then
                _G._noclipConnection:Disconnect()
                _G._noclipConnection = nil
            end
        end

        if Value then
            enableNoclip()
        else
            disableNoclip()
        end
    end,
})

local Button = Tab:Button({
    Title = "Aimbot",
    Desc = "Enables an Aimbot Gui",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cat558-uz/Aina-Aimbot-UNIVERSAL/refs/heads/main/obfuscated_script-1752536242297.lua.txt"))()
    end
})

local Slider = Tab:Slider({
    Title = "Hitbox Size",
    
    -- To make float number supported, 
    -- make the Step a float number.
    -- example: Step = 0.1
    Step = 1,
    
    Value = {
        Min = 1,
        Max = 250,
        Default = 1,
    },
    Callback = function(Value)
        _G.HeadSize = Value
_G.Disabled = true
 

--Don't Touch
game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
--TRANSPARENCY of the HITBOX
v.Character.HumanoidRootPart.Transparency = 0.5
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function setInvisibility(state)
    local char = player.Character or player.CharacterAdded:Wait()

    for _, part in ipairs(char:GetDescendants()) do
        if part:IsA("BasePart") then
            part.Transparency = state and 1 or 0
            part.CanCollide = not state
        elseif part:IsA("Decal") then
            part.Transparency = state and 1 or 0
        end
    end

    -- Hide or show name tag (optional)
    local head = char:FindFirstChild("Head")
    if head then
        local nameTag = head:FindFirstChildWhichIsA("BillboardGui")
        if nameTag then
            nameTag.Enabled = not state
        end
    end
end

local Button = Tab:Button({
    Title = "Invisibility",
    Desc = "Adds a button on screen to toggle invisibility",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
    end
})
-- tp to players script
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Debounce to prevent rapid teleports
local teleporting = false

-- Get all other player names for the dropdown
local function getOtherPlayerNames()
    local names = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

-- Teleport function: move LocalPlayer near target player
local function teleportToPlayer(targetName)
    if teleporting then return end
    teleporting = true

    local target = Players:FindFirstChild(targetName)
    if not target then
        warn("[Teleport] Target not found:", targetName)
        teleporting = false
        return
    end

    local targetChar = target.Character or target.CharacterAdded:Wait()
    local targetHRP = targetChar:WaitForChild("HumanoidRootPart", 5)
    if not targetHRP then
        warn("[Teleport] Target HumanoidRootPart missing")
        teleporting = false
        return
    end

    local myChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local myHRP = myChar:WaitForChild("HumanoidRootPart", 5)
    if not myHRP then
        warn("[Teleport] My HumanoidRootPart missing")
        teleporting = false
        return
    end

    -- Teleport above the target player to avoid collisions
    myHRP.CFrame = targetHRP.CFrame + Vector3.new(0, 5, 0)
    print("[Teleport] Teleported to:", targetName)

    task.delay(0.5, function()
        teleporting = false
    end)
end

-- Create the dropdown in your Tab (assumes you already have a Tab variable)
local Dropdown = Tab:Dropdown({
    Title = "Teleport to Player",
    Values = getOtherPlayerNames(),
    Value = "",  -- default no selection
    Callback = function(selection)
        if selection and selection ~= "" then
            teleportToPlayer(selection)
        end
    end,
})

-- Refresh dropdown values when players join or leave
local function refreshDropdown()
    local names = getOtherPlayerNames()
    if Dropdown.Refresh then
        Dropdown:Refresh(names)
    else
        -- If no Refresh method, you could recreate dropdown here if needed
    end
end

Players.PlayerAdded:Connect(refreshDropdown)
Players.PlayerRemoving:Connect(refreshDropdown)


local Tab = Window:Tab({
    Title = "Client",
    Icon = "usb",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Fullbright",
    Desc = "Lets you see in the dark.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Fullbright.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Remove fog",
    Desc = "Removes the fog.",
    Locked = false,
    Callback = function()
         local function removeFog()
    local lighting = game:GetService("Lighting")
    lighting.FogEnd = 1e10
    lighting.FogStart = 1e10
    lighting.FogColor = Color3.new(1, 1, 1) -- Optional: Set to desired color
end



removeFog()

game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(removeFog)
game:GetService("Lighting"):GetPropertyChangedSignal("FogStart"):Connect(removeFog)
game:GetService("Lighting"):GetPropertyChangedSignal("FogColor"):Connect(removeFog)

game:GetService("Lighting").Changed:Connect(removeFog)
    end
})

local Input = Tab:Input({
    Title = "Set FPS Cap",
    Desc = "Lets you change the FPS cap of Roblox.",
    Value = "60",
    InputIcon = "square-pen",
    Type = "Input",
    Placeholder = "Enter FPS cap",
    Callback = function(text) 
        local num = tonumber(text)
        if num then
            setfpscap(num)
        else
            WindUI:Notify({
                Title = "Invalid Value",
                Content = "Please enter a valid number for the FPS cap.",
                Duration = 2,
                Icon = "ban"
            })
        end
    end
})

local Button = Tab:Button({
    Title = "Fps Booster",
    Desc = "Removes things to boost performance.",
    Locked = false,
    Callback = function()
  _G.Settings = {
    Players = {
        ["Ignore Me"] = true, -- Ignore your Character
        ["Ignore Others"] = true -- Ignore other Characters
    },
    Meshes = {
        Destroy = false, -- Destroy Meshes
        LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
    },
    Images = {
        Invisible = true, -- Invisible Images
        LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
        Destroy = false, -- Destroy Images
    },
    Other = {
        ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
        ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
        ["No Explosions"] = true, -- Makes Explosion's invisible
        ["No Clothes"] = true, -- Removes Clothing from the game
        ["Low Water Graphics"] = true, -- Removes Water Quality
        ["No Shadows"] = true, -- Remove Shadows
        ["Low Rendering"] = true, -- Lower Rendering
        ["Low Quality Parts"] = true -- Lower quality parts
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
   end,
})

local Tab = Window:Tab({
    Title = "Server",
    Icon = "server",
    Locked = false,
})

local jobId = game.JobId or "Unknown"

local Button = Tab:Button({
    Title = "Copy Server Job ID",
    Desc = "Copies the current server Job ID to your clipboard",
    Locked = false,
    Callback = function()
        if setclipboard then
            setclipboard(jobId)
            WindUI:Notify({
    Title = "Copied",
    Content = "Jobid Copied to Clipboard",
    Duration = 3, -- 3 seconds
    Icon = "clipboard-check",
})
        else
                        WindUI:Notify({
    Title = "Failed",
    Content = "Copy Failed",
    Duration = 3, -- 3 seconds
    Icon = "clipboard-x",
})
        end
    end
})

local Input = Tab:Input({
    Title = "Join Server",
    Desc = "Join a server with a jobID",
    Value = "",                      -- start empty so it doesn't try to teleport automatically
    InputIcon = "id-card",
    Type = "Input", -- or "Textarea"
    Placeholder = "JobId",
    Callback = function(Text) 
        local JobIdTextBoxValue = Text  -- Use actual user input
        
        local placeId = game.PlaceId
        
        -- Only teleport if input is not empty and not default placeholder text
        if JobIdTextBoxValue ~= "" and JobIdTextBoxValue:lower() ~= "jobid" then
            local success, errorMessage = pcall(function()
                game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, JobIdTextBoxValue, game.Players.LocalPlayer)
            end)
            if not success then
                warn("Teleport failed: " .. tostring(errorMessage))
            end
        else
            print("No valid JobId entered, teleport cancelled.")
        end
    end
})

local Button = Tab:Button({
    Title = "Rejoin",
    Desc = "Rejoin same server",
    Locked = false,
    Callback = function()
        local ts = game:GetService("TeleportService")



local p = game:GetService("Players").LocalPlayer







ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
    end
})

local Button = Tab:Button({
    Title = "Server hop",
    Desc = "Changes your server",
    Locked = false,
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local Servers = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
local Server, Next = nil, nil
local function ListServers(cursor)
    local Raw = game:HttpGet(Servers .. ((cursor and "&cursor=" .. cursor) or ""))
    return HttpService:JSONDecode(Raw)
end

repeat
    local Servers = ListServers(Next)
    Server = Servers.data[math.random(1, (#Servers.data / 3))]
    Next = Servers.nextPageCursor
until Server

if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
    TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, game.Players.LocalPlayer)
end
    end
})

local Button = Tab:Button({
    Title = "Free private server",
    Desc = "Makes a server that only you are in",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Free%20Private%20Server.lua"))()
    end
})


local Tab = Window:Tab({
    Title = "Misc",
    Icon = "dices",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Keyboard",
    Desc = "Launches delta keyboard for the mobile players",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
    end
})

local Button = Tab:Button({
    Title = "Short proximity prompt",
    Desc = "removes the hold duration for proximity prompts so you can spam it",
    Locked = false,
    Callback = function()
        local function SetupProximityPrompt(prompt)
    prompt.HoldDuration = 0
end

workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ProximityPrompt") then
        SetupProximityPrompt(descendant)
    end
end)

for _, prompt in ipairs(workspace:GetDescendants()) do
    if prompt:IsA("ProximityPrompt") then
        SetupProximityPrompt(prompt)
    end
end
    end
})

local Button = Tab:Button({
    Title = "Shiftlock",
    Desc = "Gives a shiftlock button",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie",true))()
    end
})

local Button = Tab:Button({
    Title = "Performance Stats",
    Desc = "Displays ping and fps in top left corner",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Fps_stats.lua"))()
    end
})

local Button = Tab:Button({
    Title = "Infinite Yield",
    Desc = "Loads Ininite Yeild",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

Window:Divider()

local Tab = Window:Tab({
    Title = "Settings",
    Icon = "cog", -- optional
    Locked = false,
})

-- Theme configuration
local themes = {
    ["Midnight"] = {
        type = "default"
    },
    ["Chroma Glow"] = {
        type = "image",
        asset = "rbxassetid://73929911208713"
    },
    ["Crimson Moon"] = {
        type = "gradient",
        colors = {
            ColorSequenceKeypoint.new(0, Color3.fromHex("#670000")),
            ColorSequenceKeypoint.new(1, Color3.fromHex("#000000"))
        },
        rotation = 45
    }
}

-- Function to apply theme
local function applyTheme(themeName)
    local theme = themes[themeName]
    
    if not theme then
        print("Theme not found: " .. themeName)
        return
    end
    
    if theme.type == "default" then
        -- Reset to default Midnight theme
        Window:SetTheme("Midnight")
        print("Applied theme: " .. themeName)
        
    elseif theme.type == "image" then
        -- Apply image background
        Window:SetBackground({
            Type = "Image",
            Image = theme.asset
        })
        print("Applied theme: " .. themeName)
        
    elseif theme.type == "gradient" then
        -- Apply gradient background
        Window:SetBackground({
            Type = "Gradient",
            Colors = ColorSequence.new(theme.colors),
            Rotation = theme.rotation
        })
        
        -- Update UI element colors to match the dark red theme
        Window:SetAccentColor(Color3.fromHex("#670000"))
        
        print("Applied theme: " .. themeName)
    end
end

-- Create theme dropdown
local ThemeDropdown = Tab:Dropdown({
    Title = "UI Theme",
    Values = {"Midnight", "Chroma Glow", "Crimson Moon"},
    Value = "Midnight",
    Callback = function(option) 
        print("Theme selected: " .. option)
        applyTheme(option)
    end
})

-- Optional: Add a reset theme button
local ResetThemeButton = Tab:Button({
    Title = "Reset to Default",
    Desc = "Reset UI theme to Midnight",
    Locked = false,
    Callback = function()
        applyTheme("Midnight")
        ThemeDropdown:SetValue("Midnight")
    end
})




loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Notifications.lua"))()
