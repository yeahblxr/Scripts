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
    Title = "Beta 0.9.6.3",
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
    Content = "New UI, Egor Script, you can now select who you want to fling",
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
    Title = "Egor",
    Desc = "Makes you run like Egor",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DROID-cell-sys/ANTI-UTTP-SCRIPTT/refs/heads/main/EGOR%20SCRIPT%20BY%20ANTI-UTTP"))()
    end
})

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
    Title = "Set fps cap",
    Desc = "Lets you cange the fps cap of Roblox.",
    Value = "60",
    InputIcon = "square-pen",
    Type = "Input", -- or "Textarea"
    Placeholder = "Enter fps cap",
    Callback = function(text) 
        setfpscap(text)
            WindUI:Notify({
    Title = "Fps cap changed",
    Content = "Fps cap has been set!",
    Duration = 3, -- 3 seconds
    Icon = "pencil-line",
})
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

local Paragraph = Tab:Paragraph({
    Title = "Server Job ID",
    Desc = "Unique ID for this server instance",
    Content = jobId,
    Color = "Black",         -- or any color you like
    Image = "",             -- optional
    ImageSize = 0,
    Thumbnail = "",         -- optional
    ThumbnailSize = 0,
    Locked = false,
    Buttons = {
        {
            Icon = "clipboard",
            Title = "Copy",
            Callback = function()         if setclipboard then
            setclipboard(jobId)
        end end,
        }
    }
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
