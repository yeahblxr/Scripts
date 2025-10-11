local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer


local collecting = false
local TELEPORT_DELAY = 1
local TARGET_GOLD = "PickupGoldPrompt"
local END_POSITION = Vector3.new(-46, 11, 21641)


local function getHRP()
	local char = player.Character or player.CharacterAdded:Wait()
	return char:WaitForChild("HumanoidRootPart")
end

local function getLootCrates()
	local folder = workspace:FindFirstChild("LootCrates")
	if not folder then return {} end
	local crates = {}
	for _, model in ipairs(folder:GetChildren()) do
		if model:IsA("Model") and model.Name == "LootCrate" then
			table.insert(crates, model)
		end
	end
	table.sort(crates, function(a, b)
		if a.PrimaryPart and b.PrimaryPart then
			return (getHRP().Position - a.PrimaryPart.Position).Magnitude < (getHRP().Position - b.PrimaryPart.Position).Magnitude
		end
		return false
	end)
	return crates
end

local function startCollecting()
	collecting = true
	while collecting do
		local crates = getLootCrates()
		if #crates == 0 then
			task.wait(1)
		end
		for _, crate in ipairs(crates) do
			if not collecting then break end
			if crate.PrimaryPart then
				getHRP().CFrame = crate.PrimaryPart.CFrame + Vector3.new(0, 5, 0)
				task.wait(TELEPORT_DELAY)
			end
		end
	end
end

local function stopCollecting()
	collecting = false
end

local function collectGold()
	if not fireproximityprompt then return end
	for _, descendant in ipairs(workspace:GetDescendants()) do
		if descendant:IsA("ProximityPrompt") then
			local parentName = descendant.Parent and descendant.Parent.Name
			if descendant.Name == TARGET_GOLD or parentName == TARGET_GOLD then
				pcall(fireproximityprompt, descendant)
			end
		end
	end
end

local function teleportToEnd()
	local hrp = getHRP()
	hrp.CFrame = CFrame.new(END_POSITION)
end


local playerGui = player:WaitForChild("PlayerGui")
local gui = Instance.new("ScreenGui")
gui.Name = "MidnightHub"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui


local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 350, 0, 260)
mainFrame.Position = UDim2.new(0.5, -175, 0.5, -130)
mainFrame.BackgroundColor3 = Color3.fromHex("#2e004f") 
mainFrame.BackgroundTransparency = 0 
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromHex("#6b21a8")
mainFrame.Parent = gui
mainFrame.Active = true

local mainCorner = Instance.new("UICorner", mainFrame)
mainCorner.CornerRadius = UDim.new(0, 12)


local uiGradient = Instance.new("UIGradient", mainFrame)
uiGradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromHex("#2e004f")),
	ColorSequenceKeypoint.new(1, Color3.fromHex("#8d09b5")),
})
uiGradient.Rotation = 45

uiGradient.Transparency = NumberSequence.new({
	NumberSequenceKeypoint.new(0, 0.2),
	NumberSequenceKeypoint.new(1, 0.2),
})


local titleBar = Instance.new("Frame", mainFrame)
titleBar.Size = UDim2.new(1, 0, 0, 36)
titleBar.Position = UDim2.new(0, 0, 0, 0)
titleBar.BackgroundTransparency = 0.2
titleBar.BackgroundColor3 = Color3.fromHex("#6b21a8")
titleBar.BorderSizePixel = 0

local title = Instance.new("TextLabel", titleBar)
title.Size = UDim2.new(1, -90, 1, 0)
title.Position = UDim2.new(0, 12, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Midnight Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextColor3 = Color3.fromHex("#f3e8ff")
title.TextXAlignment = Enum.TextXAlignment.Left


local minimizeBtn = Instance.new("TextButton", titleBar)
minimizeBtn.Size = UDim2.new(0, 30, 0, 30)
minimizeBtn.Position = UDim2.new(1, -72, 0, 3)
minimizeBtn.Text = "-"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextSize = 18
minimizeBtn.BackgroundColor3 = Color3.fromHex("#9333ea")
minimizeBtn.BackgroundTransparency = 0.2
minimizeBtn.TextColor3 = Color3.fromHex("#f3e8ff")
minimizeBtn.BorderSizePixel = 0
Instance.new("UICorner", minimizeBtn).CornerRadius = UDim.new(0, 6)

local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -36, 0, 3)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.BackgroundColor3 = Color3.fromHex("#a855f7")
closeBtn.BackgroundTransparency = 0.2
closeBtn.TextColor3 = Color3.fromHex("#f3e8ff")
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 6)


local content = Instance.new("Frame", mainFrame)
content.Size = UDim2.new(1, -40, 1, -70)
content.Position = UDim2.new(0, 20, 0, 44)
content.BackgroundTransparency = 1

local function createButton(text, yPos)
	local btn = Instance.new("TextButton", content)
	btn.Size = UDim2.new(1, 0, 0, 48)
	btn.Position = UDim2.new(0, 0, 0, yPos)
	btn.BackgroundColor3 = Color3.fromHex("#9333ea")
	btn.BackgroundTransparency = 0.2
	btn.TextColor3 = Color3.fromHex("#f3e8ff")
	btn.Font = Enum.Font.GothamBold
	btn.TextSize = 16
	btn.Text = text
	btn.BorderSizePixel = 0
	Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
	return btn
end


local lootBtn = createButton("Get LootCrate: OFF", 0)
local goldBtn = createButton("Get All Gold", 64)
local tpBtn = createButton("Tp to End", 128)


local miniBtn = Instance.new("TextButton", gui)
miniBtn.Size = UDim2.new(0, 76, 0, 40)
miniBtn.Position = UDim2.new(0, 20, 1, -80)
miniBtn.AnchorPoint = Vector2.new(0, 0)
miniBtn.BackgroundColor3 = Color3.fromHex("#9333ea")
miniBtn.BackgroundTransparency = 0.2
miniBtn.Text = "MH"
miniBtn.TextColor3 = Color3.fromHex("#f3e8ff")
miniBtn.Font = Enum.Font.GothamBold
miniBtn.TextSize = 18
miniBtn.BorderSizePixel = 0
Instance.new("UICorner", miniBtn).CornerRadius = UDim.new(0, 10)
miniBtn.Visible = false


local ACCENT = Color3.fromHex("#a855f7")
local BUTTON_BASE = Color3.fromHex("#9333ea")
local TEXT_COLOR = Color3.fromHex("#f3e8ff")


local dragging, dragInput, dragStart, startPos
mainFrame.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true
		dragStart = input.Position
		startPos = mainFrame.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragging = false
			end
		end)
	end
end)
mainFrame.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement then
		dragInput = input
	end
end)
UIS.InputChanged:Connect(function(input)
	if dragging and input == dragInput then
		local delta = input.Position - dragStart
		mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)


lootBtn.MouseButton1Click:Connect(function()
	if collecting then
		stopCollecting()
		lootBtn.Text = "Get LootCrate: OFF"
		lootBtn.BackgroundColor3 = BUTTON_BASE
	else
		lootBtn.Text = "Get LootCrate: ON"
		lootBtn.BackgroundColor3 = ACCENT
		task.spawn(startCollecting)
	end
end)

goldBtn.MouseButton1Click:Connect(function()
	collectGold()
	
	goldBtn.BackgroundTransparency = 0
	task.delay(0.08, function() if goldBtn and goldBtn.Parent then goldBtn.BackgroundTransparency = 0.2 end end)
end)

tpBtn.MouseButton1Click:Connect(function()
	teleportToEnd()
	
	tpBtn.BackgroundTransparency = 0
	task.delay(0.08, function() if tpBtn and tpBtn.Parent then tpBtn.BackgroundTransparency = 0.2 end end)
end)


minimizeBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = false
	miniBtn.Visible = true
end)

miniBtn.MouseButton1Click:Connect(function()
	mainFrame.Visible = true
	miniBtn.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
	gui:Destroy()
end)
