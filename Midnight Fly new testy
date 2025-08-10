local main = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local up = Instance.new("TextButton")
local upCorner = Instance.new("UICorner")
local down = Instance.new("TextButton")
local downCorner = Instance.new("UICorner")
local onof = Instance.new("TextButton")
local onofCorner = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local labelCorner = Instance.new("UICorner")
local plus = Instance.new("TextButton")
local plusCorner = Instance.new("UICorner")
local speed = Instance.new("TextLabel")
local speedCorner = Instance.new("UICorner")
local mine = Instance.new("TextButton")
local mineCorner = Instance.new("UICorner")
local closebutton = Instance.new("TextButton")
local closeCorner = Instance.new("UICorner")
local mini = Instance.new("TextButton")
local miniCorner = Instance.new("UICorner")
local miniBox = Instance.new("TextButton")
local miniBoxCorner = Instance.new("UICorner")

main.Name = "main"
main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
main.ResetOnSpawn = false

-- Main Frame with amethyst theme and transparency (reduced size)
Frame.Parent = main
Frame.BackgroundColor3 = Color3.fromRGB(40, 30, 60) -- Amethyst color
Frame.BackgroundTransparency = 0.2 -- Slight transparency
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)
Frame.Size = UDim2.new(0, 200, 0, 110) -- Reduced from 220x120

-- Rounded corners for main frame
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 12)

-- Title Label (moved up and made smaller)
TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(82, 63, 119) -- Medium orchid amethyst
TextLabel.BackgroundTransparency = 0.1
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.05, 0, 0.05, 0) -- Moved to top-left
TextLabel.Size = UDim2.new(0, 80, 0, 20) -- Made smaller
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Midnight Fly"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 12.000
TextLabel.TextWrapped = true

labelCorner.Parent = TextLabel
labelCorner.CornerRadius = UDim.new(0, 6)

-- Close Button (inside frame, top-right)
closebutton.Name = "Close"
closebutton.Parent = Frame
closebutton.BackgroundColor3 = Color3.fromRGB(141, 48, 75) -- Purple amethyst
closebutton.BackgroundTransparency = 0.1
closebutton.BorderSizePixel = 0
closebutton.Font = Enum.Font.GothamBold
closebutton.Size = UDim2.new(0, 20, 0, 20) -- Made smaller
closebutton.Text = "×"
closebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
closebutton.TextSize = 14
closebutton.Position = UDim2.new(1, -25, 0, 5) -- Inside frame

closeCorner.Parent = closebutton
closeCorner.CornerRadius = UDim.new(0, 4)

-- Minimize Button (inside frame, next to close)
mini.Name = "minimize"
mini.Parent = Frame
mini.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Light amethyst
mini.BackgroundTransparency = 0.1
mini.BorderSizePixel = 0
mini.Font = Enum.Font.GothamBold
mini.Size = UDim2.new(0, 20, 0, 20) -- Made smaller
mini.Text = "−"
mini.TextColor3 = Color3.fromRGB(255, 255, 255)
mini.TextSize = 14
mini.Position = UDim2.new(1, -50, 0, 5) -- Inside frame, next to close

miniCorner.Parent = mini
miniCorner.CornerRadius = UDim.new(0, 4)

-- UP Button (repositioned)
up.Name = "up"
up.Parent = Frame
up.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Purple amethyst
up.BackgroundTransparency = 0.1
up.BorderSizePixel = 0
up.Position = UDim2.new(0.05, 0, 0.35, 0) -- Moved down
up.Size = UDim2.new(0, 45, 0, 25) -- Made smaller
up.Font = Enum.Font.GothamBold
up.Text = "UP"
up.TextColor3 = Color3.fromRGB(255, 255, 255)
up.TextSize = 11.000

upCorner.Parent = up
upCorner.CornerRadius = UDim.new(0, 6)

-- Plus Button (repositioned)
plus.Name = "plus"
plus.Parent = Frame
plus.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Purple amethyst
plus.BackgroundTransparency = 0.1
plus.BorderSizePixel = 0
plus.Position = UDim2.new(0.3, 0, 0.35, 0) -- Moved down
plus.Size = UDim2.new(0, 35, 0, 25) -- Made smaller
plus.Font = Enum.Font.GothamBold
plus.Text = "+"
plus.TextColor3 = Color3.fromRGB(255, 255, 255)
plus.TextScaled = true
plus.TextSize = 12.000
plus.TextWrapped = true

plusCorner.Parent = plus
plusCorner.CornerRadius = UDim.new(0, 6)

-- Speed Display (repositioned)
speed.Name = "speed"
speed.Parent = Frame
speed.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Dark orchid amethyst
speed.BackgroundTransparency = 0.1
speed.BorderSizePixel = 0
speed.Position = UDim2.new(0.55, 0, 0.35, 0) -- Moved down
speed.Size = UDim2.new(0, 35, 0, 25) -- Made smaller
speed.Font = Enum.Font.GothamBold
speed.Text = "1"
speed.TextColor3 = Color3.fromRGB(255, 255, 255)
speed.TextScaled = true
speed.TextSize = 12.000
speed.TextWrapped = true

speedCorner.Parent = speed
speedCorner.CornerRadius = UDim.new(0, 6)

-- FLY Toggle Button (repositioned)
onof.Name = "onof"
onof.Parent = Frame
onof.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Light amethyst
onof.BackgroundTransparency = 0.1
onof.BorderSizePixel = 0
onof.Position = UDim2.new(0.75, 0, 0.35, 0) -- Moved down
onof.Size = UDim2.new(0, 40, 0, 25) -- Made smaller
onof.Font = Enum.Font.GothamBold
onof.Text = "FLY"
onof.TextColor3 = Color3.fromRGB(255, 255, 255)
onof.TextSize = 10.000

onofCorner.Parent = onof
onofCorner.CornerRadius = UDim.new(0, 6)

-- DOWN Button (repositioned)
down.Name = "down"
down.Parent = Frame
down.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Darker amethyst
down.BackgroundTransparency = 0.1
down.BorderSizePixel = 0
down.Position = UDim2.new(0.05, 0, 0.7, 0) -- Bottom row
down.Size = UDim2.new(0, 45, 0, 25) -- Made smaller
down.Font = Enum.Font.GothamBold
down.Text = "DOWN"
down.TextColor3 = Color3.fromRGB(255, 255, 255)
down.TextSize = 10.000

downCorner.Parent = down
downCorner.CornerRadius = UDim.new(0, 6)

-- Minus Button (repositioned)
mine.Name = "mine"
mine.Parent = Frame
mine.BackgroundColor3 = Color3.fromRGB(83, 64, 120) -- Darker amethyst
mine.BackgroundTransparency = 0.1
mine.BorderSizePixel = 0
mine.Position = UDim2.new(0.3, 0, 0.7, 0) -- Bottom row
mine.Size = UDim2.new(0, 35, 0, 25) -- Made smaller
mine.Font = Enum.Font.GothamBold
mine.Text = "-"
mine.TextColor3 = Color3.fromRGB(255, 255, 255)
mine.TextScaled = true
mine.TextSize = 12.000
mine.TextWrapped = true

mineCorner.Parent = mine
mineCorner.CornerRadius = UDim.new(0, 6)

-- Minimized Box (MH)
miniBox.Name = "miniBox"
miniBox.Parent = main
miniBox.BackgroundColor3 = Color3.fromRGB(102, 51, 153) -- Amethyst color
miniBox.BackgroundTransparency = 0.15
miniBox.BorderSizePixel = 0
miniBox.Font = Enum.Font.GothamBold
miniBox.Size = UDim2.new(0, 50, 0, 50)
miniBox.Text = "MH"
miniBox.TextColor3 = Color3.fromRGB(255, 255, 255)
miniBox.TextSize = 16
miniBox.Position = UDim2.new(0, 20, 0, 20) -- Top left corner
miniBox.Visible = false

miniBoxCorner.Parent = miniBox
miniBoxCorner.CornerRadius = UDim.new(0, 25) -- Makes it fully rounded

speeds = 1

local speaker = game:GetService("Players").LocalPlayer

local chr = game.Players.LocalPlayer.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

nowe = false


Frame.Active = true -- main = gui
Frame.Draggable = true

-- [Rest of your original functionality code remains exactly the same from here...]

onof.MouseButton1Down:connect(function()

	if nowe == true then
		nowe = false

		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true



		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




	if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then



		local plr = game.Players.LocalPlayer
		local torso = plr.Character.Torso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", torso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = torso.CFrame
		local bv = Instance.new("BodyVelocity", torso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			game:GetService("RunService").RenderStepped:Wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end
			--	game.Players.LocalPlayer.Character.Animate.Disabled = true
			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false




	else
		local plr = game.Players.LocalPlayer
		local UpperTorso = plr.Character.UpperTorso
		local flying = true
		local deb = true
		local ctrl = {f = 0, b = 0, l = 0, r = 0}
		local lastctrl = {f = 0, b = 0, l = 0, r = 0}
		local maxspeed = 50
		local speed = 0


		local bg = Instance.new("BodyGyro", UpperTorso)
		bg.P = 9e4
		bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		bg.cframe = UpperTorso.CFrame
		local bv = Instance.new("BodyVelocity", UpperTorso)
		bv.velocity = Vector3.new(0,0.1,0)
		bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
		if nowe == true then
			plr.Character.Humanoid.PlatformStand = true
		end
		while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
			wait()

			if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
				speed = speed+.5+(speed/maxspeed)
				if speed > maxspeed then
					speed = maxspeed
				end
			elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
				speed = speed-1
				if speed < 0 then
					speed = 0
				end
			end
			if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
				lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}
			elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
				bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed
			else
				bv.velocity = Vector3.new(0,0,0)
			end

			bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)
		end
		ctrl = {f = 0, b = 0, l = 0, r = 0}
		lastctrl = {f = 0, b = 0, l = 0, r = 0}
		speed = 0
		bg:Destroy()
		bv:Destroy()
		plr.Character.Humanoid.PlatformStand = false
		game.Players.LocalPlayer.Character.Animate.Disabled = false
		tpwalking = false



	end





end)

local tis

up.MouseButton1Down:connect(function()
	tis = up.MouseEnter:connect(function()
		while tis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)
		end
	end)
end)

up.MouseLeave:connect(function()
	if tis then
		tis:Disconnect()
		tis = nil
	end
end)

local dis

down.MouseButton1Down:connect(function()
	dis = down.MouseEnter:connect(function()
		while dis do
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)
		end
	end)
end)

down.MouseLeave:connect(function()
	if dis then
		dis:Disconnect()
		dis = nil
	end
end)


game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false

end)


plus.MouseButton1Down:connect(function()
	speeds = speeds + 1
	speed.Text = speeds
	if nowe == true then


		tpwalking = false
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
	end
end)
mine.MouseButton1Down:connect(function()
	if speeds == 1 then
		speed.Text = 'cannot be less than 1'
		wait(1)
		speed.Text = speeds
	else
		speeds = speeds - 1
		speed.Text = speeds
		if nowe == true then
			tpwalking = false
			for i = 1, speeds do
				spawn(function()

					local hb = game:GetService("RunService").Heartbeat	


					tpwalking = true
					local chr = game.Players.LocalPlayer.Character
					local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
					while tpwalking and hb:Wait() and chr and hum and hum.Parent do
						if hum.MoveDirection.Magnitude > 0 then
							chr:TranslateBy(hum.MoveDirection)
						end
					end

				end)
			end
		end
	end
end)

closebutton.MouseButton1Click:Connect(function()
	main:Destroy()
end)

-- Updated minimize function to show MH box
mini.MouseButton1Click:Connect(function()
	Frame.Visible = false
	miniBox.Visible = true
end)

-- Click MH box to restore
miniBox.MouseButton1Click:Connect(function()
	Frame.Visible = true
	miniBox.Visible = false
end)
