local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Midnight Hub",
   Icon = 117617062603739, 
   LoadingTitle = "Midnight Hub loading",
   LoadingSubtitle = "By Yeahblxr",
   ShowText = "Rayfield", 
   Theme = "Default", 

   ToggleUIKeybind = "K", 

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, 
      FileName = "Midnight Hub"
   },

   Discord = {
      Enabled = false, 
      Invite = "https://discord.gg/Yqak7y7DYT", 
      RememberJoins = true 
   },

   KeySystem = true, 
   KeySettings = {
      Title = "Midnight Hub Key",
      Subtitle = "Key System",
      Note = "Join Discord For Key https://discord.gg/Yqak7y7DYT", 
      FileName = "Midnight Hub Key90", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"Midnight"} 
    
   }
})
 local Tab = Window:CreateTab("Player", 4483362458) -- Title, Image
local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {16, 250},
   Increment = 2,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", 
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
   Flag = "Slider2", 
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local Slider = Tab:CreateSlider({
   Name = "hitbox",
   Range = {1, 50},
   Increment = 1,
   Suffix = "hitbox size",
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

 local Toggle = Tab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(InfiniteJumpEnabled)
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end,
 })

  local Tab = Window:CreateTab("Fun Scripts", 4483362458) 

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
   Name = "Grab Knife V4",
   Callback = function()
 loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753"))()
   end,
})

 local Tab = Window:CreateTab("Advantage Scripts", 4483362458) 

local Button = Tab:CreateButton({
   Name = "Player Esp",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Fling All (Needs Player Colisions)",
   Callback = function()
  loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
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
   Name = "Hitbox Expander",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Hitbox%20Expander.lua"))()
   end,
})

local Tab = Window:CreateTab("Misc", 4483362458)
local Button = Tab:CreateButton({
   Name = "Keyboard",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Infinte Yeild",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
})




  Rayfield:LoadConfiguration()
