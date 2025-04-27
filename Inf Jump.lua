local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

local Humanoid = Character:WaitForChild("Humanoid")

local function autoJump()
    if Humanoid.Jump then
        Humanoid:ChangeState("Jumping")
    end
end

game:GetService("RunService").Heartbeat:Connect(autoJump)

print("Infinite Auto-Jump Script loaded!")
