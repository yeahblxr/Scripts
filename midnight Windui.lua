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
    Title = "Beta 0.3",
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

local Paragraph = Tab:Paragraph({
    Title = "About Midnight Hub",
    Desc = "Midnight Hub is designed for script users who want a clean, reliable, and easy-to-use interface without sacrificing power. Built for convenience and compatibility, it brings together a collection of useful tools in one place, no bloat, no confusion. Whether you're a casual user or a serious exploiter, Midnight Hub keeps things simple.",
    Color = "White",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "bird",
            Title = "Button",
            Callback = function() print("1 Button") end,
        }
    }
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





WindUI:Notify({
    Title = "Loaded!",
    Content = "Loaded Midnight Hub",
    Duration = 3,
    Icon = "check",
})
