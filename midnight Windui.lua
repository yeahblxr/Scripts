-- Load WindUI properly
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/Library.lua"))()

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
        Key = { "1234" },
        Note = "Key is 1234",
        Thumbnail = {
            Image = "rbxassetid://117617062603739",
            Title = "Midnight Hub Key",
        },
        URL = "https://github.com/Footagesus/WindUI",
        SaveKey = true,
    },
})

-- Main tab
local MainTab = Window:Tab({
    Title = "Emi A Fag",
    Icon = "home",
    Locked = false,
})

local Button = MainTab:Button({
    Title = "Dih",
    Desc = "Gives Dih",
    Locked = false,
    Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt'))()
    end
})

-- Get all available themes
local themes = WindUI:GetThemes()

-- Print themes
print("Available WindUI Themes:")
for name, _ in pairs(themes) do
    print(name)
end

-- Themes tab
local ThemesTab = Window:CreateTab("Themes")
local Dropdown = ThemesTab:CreateDropdown({
    Name = "Select Theme",
    Options = {},
    CurrentOption = "Dark",
    Callback = function(selected)
        WindUI:ChangeTheme(selected)
        print("Theme changed to:", selected)
    end
})

-- Fill dropdown with theme names
for name, _ in pairs(themes) do
    table.insert(Dropdown.Options, name)
end
Dropdown:Refresh(Dropdown.Options, true)

-- Notify
WindUI:Notify({
    Title = "Loaded!",
    Content = "Loaded Midnight Hub",
    Duration = 3,
    Icon = "check",
})
