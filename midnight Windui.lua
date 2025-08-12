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

Window:Tag({
    Title = "v0.1",
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




WindUI:Notify({
    Title = "Loaded!",
    Content = "Loaded Midnight Hub",
    Duration = 3,
    Icon = "check",
})
