local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Midnight Hub",
   Icon = "moon", -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Midnight Hub loading",
   LoadingSubtitle = "By Yeahblxr",
   ShowText = "Midnight Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Midnight Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "https://discord.gg/Yqak7y7DYT", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Midnight Hub Key",
      Subtitle = "Key System",
      Note = "Join Discord For Key https://discord.gg/Yqak7y7DYT", -- Use this to tell the user how to get a key
      FileName = "Midnight Hub Key90", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Midnight"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    
   }
})

local Tab = Window:CreateTab("Home", "home") -- Title, Image

local Button = Tab:CreateButton({
   Name = "Discord",
   Callback = function()
      setclipboard("https://discord.gg/Yqak7y7DYT")
      Rayfield:Notify({
         Title = "Copied",
         Content = "Discord link copied to clipboard!",
         Duration = 3,
         Image = "check"
      })
   end,
})

local Button = Tab:CreateButton({
   Name = "UNC Test",
   Callback = function()
   loadstring(game:HttpGet("https://github.com/ltseverydayyou/uuuuuuu/blob/main/UNC%20test?raw=true"))()
 Rayfield:Notify({
         Title = "UNC Test",
         Content = "Type /console or press F9 to veiw results",
         Duration = 5,
         Image = "check"
      })
   end,
})

local Button = Tab:CreateButton({
   Name = "Tiktok",
   Callback = function()
      setclipboard("https://www.tiktok.com/@yeahblxr")
      Rayfield:Notify({
         Title = "Copied",
         Content = "Tiktok link copied to clipboard!",
         Duration = 3,
         Image = "check"
      })
   end,
})

local Button = Tab:CreateButton({
   Name = "Github",
   Callback = function()
      setclipboard("https://github.com/yeahblxr/-Midnight-hub/blob/main/Midnight%20Hub")
      Rayfield:Notify({
         Title = "Copied",
         Content = "Github link copied to clipboard!",
         Duration = 3,
         Image = "check"
      })
   end,
})


local Button = Tab:CreateButton({
   Name = "Copy Script",
   Callback = function()
      setclipboard("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/yeahblxr/-Midnight-hub/refs/heads/main/Midnight%20Hub\"))()")
      Rayfield:Notify({
         Title = "Copied",
         Content = "Script copied to clipboard!",
         Duration = 3,
         Image = "check"
      })
   end,
})

local Divider = Tab:CreateDivider()

local Paragraph = Tab:CreateParagraph({Title = "Midnight Hub Changelogs *8/11/25", Content = "Added egor script"})

local Paragraph = Tab:CreateParagraph({Title = "About Midnight Hub", Content = "Midnight Hub is designed for script users who want a clean, reliable, and easy to use interface without sacrificing power. Built for convenience and compatibility, it brings together a collection of useful tools in one place no bloat, no confusion. Whether you're a casual user or a serious exploiter, Midnight Hub keeps things simple"})



 local Tab = Window:CreateTab("Player", "user") -- Title, Image
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {1, 500},
   Increment = 2,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Jump Power",
   Range = {1, 1000},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

-- keep track of the connection so we can disconnect it
local infiniteJumpConnection

local Toggle = Tab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJumpToggle",
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
local Toggle = Tab:CreateToggle({
    Name = "Respawn Where You Die",
    CurrentValue = false,
    Flag = "RespawnWhereYouDie",
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


local Button = Tab:CreateButton({
   Name = "Reset Character",
   Callback = function()
        local character = player.Character
        if character then
            character:BreakJoints() -- This will reset the character
        end
   end,
})

-- helper clamp in case Rayfield or environment doesn't have one
local function clamp(val, min, max)
    if val < min then return min end
    if val > max then return max end
    return val
end

-- initialize with current FOV (clamped to allowed range)
local initialFov = clamp(tonumber(workspace.CurrentCamera.FieldOfView) or 70, 70, 120)

local Input = Tab:CreateInput({
    Name = "FOV Input",
    CurrentValue = tostring(initialFov),
    PlaceholderText = "Enter FOV (70–120)",
    RemoveTextAfterFocusLost = false,
    Flag = "FovInput",
    Callback = function(Text)
        local num = tonumber(Text)
        if not num then
            Rayfield:Notify({
                Title = "Invalid Value",
                Content = "Please enter a number between 70 and 120.",
                Duration = 3.5,
                Image = "ban"
            })
            return
        end

        local newFov = clamp(num, 70, 120)
        workspace.CurrentCamera.FieldOfView = newFov

        -- if the user entered out-of-range, you can reflect the clamped value back
        if newFov ~= num then
            -- optional: update the input display if API supports it
            -- e.g., if there's a SetValue method: Input:SetValue(tostring(newFov))
            Rayfield:Notify({
                Title = "FOV Adjusted",
                Content = string.format("FOV was clamped to %d (range is 70–120).", newFov),
                Duration = 3.5,
                Image = "ban",
            })
        else
            Rayfield:Notify({
                Title = "FOV Changed",
                Content = string.format("FOV has been changed to %d", newFov),
                Duration = 3.5,
                Image = "check"
            })
        end
    end,
})



local Tab = Window:CreateTab("Fun Scripts", "joystick") -- Title, Image

local Button = Tab:CreateButton({
   Name = "Dih Script",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Fake Lag",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Biem6ondo/FAKELAG/refs/heads/main/Fakelag"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Jerk Script",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Edge.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Fling All (Needs Player Colisions)",
   Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
   end,
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
local Toggle = Tab:CreateToggle({
    Name = "Moon Gravity",
    CurrentValue = false,
    Flag = "ToggleMoonGravity",
    Callback = function(Value)
        toggleMoonGravity(Value)
    end,
})

local Button = Tab:CreateButton({
   Name = "Egor Script",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/DROID-cell-sys/ANTI-UTTP-SCRIPTT/refs/heads/main/EGOR%20SCRIPT%20BY%20ANTI-UTTP"))()
   end,
})

local Tab = Window:CreateTab("Advantage Scripts", "swords") -- Title, Image

local Button = Tab:CreateButton({
   Name = "Player Esp",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Fly Gui",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/-Midnight-hub/refs/heads/main/Midnighthub_Fly.lua"))()
   end,
})

local floatName = nil -- or set to a string to exclude that part, e.g. "FloatPart"

local Toggle = Tab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "Toggle5",
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


local Button = Tab:CreateButton({
   Name = "AimBot",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Cat558-uz/Aina-Aimbot-UNIVERSAL/refs/heads/main/obfuscated_script-1752536242297.lua.txt"))()
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Hitbox",
   Range = {1, 250},
   Increment = 1,
   Suffix = "Hitbox size",
   CurrentValue = 1,
   Flag = "Slider3", 
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

local Button = Tab:CreateButton({
   Name = "Invisibility",
   Callback = function()
 loadstring(game:HttpGet('https://pastebin.com/raw/3Rnd9rHf'))()
   end,
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Debounce
local teleporting = false

-- Utility: get all other player names
local function getOtherPlayerNames()
    local names = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

-- Teleport function: moves you near the target player
local function teleportToPlayer(targetName)
    if teleporting then return end
    teleporting = true

    local target = Players:FindFirstChild(targetName)
    if not target then
        warn("[Teleport] Target not found:", targetName)
        teleporting = false
        return
    end

    -- Wait for characters and parts to exist
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

    -- Teleport slightly above to reduce getting stuck; uses CFrame as recommended. :contentReference[oaicite:0]{index=0} :contentReference[oaicite:1]{index=1}
    myHRP.CFrame = targetHRP.CFrame + Vector3.new(0, 5, 0)
    print("[Teleport] Done to:", targetName)

    task.delay(0.5, function()
        teleporting = false
    end)
end

-- Rayfield dropdown setup (assumes you have already initialized Rayfield and have a Tab)
local Dropdown = Tab:CreateDropdown({
    Name = "Teleport to Player",
    Options = getOtherPlayerNames(),
    CurrentOption = {""},
    MultipleOptions = false,
    Flag = "TeleportDropdown",
    Callback = function(selection)
        if selection and selection[1] and selection[1] ~= "" then
            print("Dropdown selected:", selection[1])  -- debug to ensure callback fires
            teleportToPlayer(selection[1])
        end
    end,
})

-- Helper to refresh dropdown when player list changes
local function refreshDropdown()
    local names = getOtherPlayerNames()
    -- Rayfield dropdowns typically support something like :Refresh or recreating; if no API exists, recreate:
    -- If Refresh method exists:
    if Dropdown.Refresh then
        Dropdown:Refresh(names)
    else
        -- fallback: destroy and recreate (simplified)
        -- Note: adapt this depending on how your Rayfield version wants dynamic updates
        -- For example, you might store the previous selection and rebuild the dropdown
    end
end

Players.PlayerAdded:Connect(function()
    refreshDropdown()
end)
Players.PlayerRemoving:Connect(function()
    refreshDropdown()
end)


local Tab = Window:CreateTab("Client", "usb") -- Title, Image

local Button = Tab:CreateButton({
   Name = "Full Bright",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Fullbright.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "No Fog",
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
   end,
})

local Input = Tab:CreateInput({
   Name = "Set Fps Cap",
   CurrentValue = "60",
   PlaceholderText = "Fps Cap",
   RemoveTextAfterFocusLost = false,
   Flag = "Input2",
   Callback = function(Text)
 setfpscap(Text)
  Rayfield:Notify({
   Title = "Fps Cap Set",
   Content = "Fps Cap has been set",
   Duration = 2,
   Image = "check"
})
   end,
})

local Button = Tab:CreateButton({
   Name = "FPS Booster",
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

local Tab = Window:CreateTab("Server", "server") -- Title, Image

-- Get the server JobId (a unique GUID for this server instance)
local jobId = game.JobId or "Unknown"

-- Create the label (you can replace the icon ID and color as desired)
local Label = Tab:CreateLabel(("Server Job ID: %s"):format(jobId), "server", Color3.fromRGB(46, 30, 59), false)

-- Optional: if you want a separate button to copy it to clipboard (using Roblox's SetClipboard, works in Studio/Client)
local CopyButton = Tab:CreateButton({
    Name = "Copy JobId",
    Callback = function()
        if setclipboard then
            setclipboard(jobId)
        end
        -- You could also notify the user if you're using your notification system:
         Rayfield:Notify({ Title = "Copied", Content = "JobId copied to clipboard.", Duration = 2, Image = "check" })
    end,
})


local Input = Tab:CreateInput({
   Name = "Jobid Joiner",
   CurrentValue = "",
   PlaceholderText = "JobId",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
   local JobIdTextBoxValue = " Text " -- Store the textbox value i guess CHANGE THIS that is just an example
local placeId = game.PlaceId -- Get the current place ID of the game 
 

local jobId = JobIdTextBoxValue
if jobId ~= "" then
    local success, errorMessage = pcall(function()
        game:GetService("TeleportService"):TeleportToPlaceInstance(placeId, jobId, game.Players.LocalPlayer) -- teleports i hope nothing goes wrong
    end)
end
   end,
})


local Button = Tab:CreateButton({
   Name = "Rejoin Server",
   Callback = function() 
local ts = game:GetService("TeleportService")



local p = game:GetService("Players").LocalPlayer







ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
   end,
})

local Button = Tab:CreateButton({
   Name = "Server Hop",
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
   end,
})


local Tab = Window:CreateTab("Misc", "dices") -- Title, Image

local Button = Tab:CreateButton({
   Name = "Keyboard",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Short Proximity Prompt",
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
   end,
})

local Button = Tab:CreateButton({
   Name = "Fps Stats",
   Callback = function()
 loadstring(game:HttpGet("https://programcom.vercel.app/Syn/Loaded.luac"))("sOVLptbyAfNPa0F7FrjD")
   end,
})

local Button = Tab:CreateButton({
   Name = "ShiftLock",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/MiniNoobie/ShiftLockx/main/Shiftlock-MiniNoobie",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinte Yeild",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})

local Divider = Tab:CreateDivider()

local Button = Tab:CreateButton({
   Name = "Destroy Gui",
   Callback = function()
 Rayfield:Destroy()
   end,
})

local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- Ensure character/player is loaded (if this runs very early)
if not player then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    player = Players.LocalPlayer
end

local nameToShow = player.DisplayName
-- Optional: if you want the actual username instead of/displayName fallback:
-- local nameToShow = player.DisplayName ~= "" and player.DisplayName or player.Name

Rayfield:Notify({
    Title = "Midnight Hub Loaded",
    Content = ("Greetings, %s!"):format(nameToShow),
    Duration = 4,
    Image = "user-check",
})
