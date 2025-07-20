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

local Tab = Window:CreateTab("Home", 4483362458)

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
   Name = "sUNC Test",
   Callback = function()
  loadstring(game:HttpGet("https://gitlab.com/sens3/nebunu/-/raw/main/HummingBird8's_sUNC_yes_i_moved_to_gitlab_because_my_github_acc_got_brickedd/sUNCm0m3n7.lua"))()
 Rayfield:Notify({
         Title = "sUNC Test",
         Content = "Type /console or press F9 to veiw results",
         Duration = 5,
         Image = "check"
      })
   end,
})

local Divider = Tab:CreateDivider()

local Paragraph = Tab:CreateParagraph({Title = "About Midnight Hub", Content = "Midnight Hub is designed for script users who want a clean, reliable, and easy to use interface without sacrificing power. Built for convenience and compatibility, it brings together a collection of useful tools in one place no bloat, no confusion. Whether you're a casual user or a serious exploiter, Midnight Hub keeps things simple"})



 local Tab = Window:CreateTab("Player", "user") -- Title, Image
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 250},
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
   Range = {50, 500},
   Increment = 10,
   Suffix = "JumpPower",
   CurrentValue = 50,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

 local Toggle = Tab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(InfiniteJumpEnabled)
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end,
 })

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local deathPosition = nil
local characterAddedConnection = nil

local function onCharacterDied()
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        deathPosition = character.HumanoidRootPart.Position
    end
end

local function onCharacterAdded(character)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.Died:Connect(onCharacterDied)

    if deathPosition then
        local hrp = character:WaitForChild("HumanoidRootPart")
        hrp.CFrame = CFrame.new(deathPosition + Vector3.new(0, 5, 0))
    end
end

-- Your toggle
local Toggle = Tab:CreateToggle({
    Name = "Respawn Where You Die",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        -- Toggle ON
        if Value then
            characterAddedConnection = player.CharacterAdded:Connect(onCharacterAdded)
            if player.Character then
                onCharacterAdded(player.Character)
            end
        -- Toggle OFF
        else
            if characterAddedConnection then
                characterAddedConnection:Disconnect()
                characterAddedConnection = nil
            end
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
 loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Fly%20script"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Noclip",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Noclip.lua"))()
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
   Range = {1, 50},
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

local Tab = Window:CreateTab("Server", "server") -- Title, Image

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

Rayfield:Notify({
   Title = "Loaded",
   Content = "Midnight Hub has been loaded successfully!",
   Duration = 4,
   Image = "user-check",
})
