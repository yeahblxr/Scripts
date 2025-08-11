local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


local Window = WindUI:CreateWindow({
    Title = "Midnight Hub",
    Icon = "moon",
    Author = "Yeahblxr",
    Folder = "Midnight Hub",
    Size = UDim2.fromOffset(580, 360),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    Background = "", -- rbxassetid or video 
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
    KeySystem = { -- <- ↓ !!!!! remove this all, if you dont need the key system
        Key = { "1234" },
        Note = "Key is 1234",
        Thumbnail = {
            Image = "rbxassetid://117617062603739",
            Title = "Midnight Hub Key",
        },
        URL = "https://github.com/Footagesus/WindUI",
        SaveKey = true,
        -- API = {} ← Services
    },
})

local Tab = Window:Tab({
    Title = "Emi A Fag",
    Icon = "home",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Dih",
    Desc = "Gives Dih",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt'))()
    end
})

-- Get all available themes
local themes = WindUI:GetThemes()

-- Print themes to console
print("Available WindUI Themes:")
for name, _ in pairs(themes) do
    print(name)
end

-- Create a dropdown to choose a theme
local Tab = Window:CreateTab("Themes")
local Dropdown = Tab:CreateDropdown({
    Name = "Select Theme",
    Options = {}, -- will be filled below
    CurrentOption = "Dark",
    Callback = function(selected)
        WindUI:ChangeTheme(selected)
        print("Theme changed to:", selected)
    end
})

-- Add all themes to dropdown options
for name, _ in pairs(themes) do
    table.insert(Dropdown.Options, name)

WindUI:Notify({
    Title = "Loaded!",
    Content = "Loaded Midnight Hub",
    Duration = 3, -- 3 seconds
    Icon = "check",
})
