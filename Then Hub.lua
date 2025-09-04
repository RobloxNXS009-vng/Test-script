-- Mini Hub Script Demo by ChatGPT
-- Bạn có thể sửa code lại để luyện tập

-- Dịch vụ cần dùng
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Tạo GUI
local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "MiniHub"

local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0, 20, 0, 200)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local UICorner = Instance.new("UICorner", Frame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Nút Teleport
local TPButton = Instance.new("TextButton", Frame)
TPButton.Size = UDim2.new(0.8, 0, 0.3, 0)
TPButton.Position = UDim2.new(0.1, 0, 0.1, 0)
TPButton.Text = "Teleport Middle Town"
TPButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TPButton.TextColor3 = Color3.new(1,1,1)

-- Nút Speed
local SpeedButton = Instance.new("TextButton", Frame)
SpeedButton.Size = UDim2.new(0.8, 0, 0.3, 0)
SpeedButton.Position = UDim2.new(0.1, 0, 0.5, 0)
SpeedButton.Text = "Speed x2"
SpeedButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
SpeedButton.TextColor3 = Color3.new(1,1,1)

-- Teleport function
local function teleportTo(position)
    local tween = TweenService:Create(HumanoidRootPart, TweenInfo.new(2), {CFrame = CFrame.new(position)})
    tween:Play()
end

TPButton.MouseButton1Click:Connect(function()
    -- Vị trí Middle Town (ví dụ, bạn có thể đổi tọa độ)
    teleportTo(Vector3.new(-260, 7, 5200))
end)

-- Speed function
local SpeedEnabled = false
SpeedButton.MouseButton1Click:Connect(function()
    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        if not SpeedEnabled then
            humanoid.WalkSpeed = 32 -- gấp đôi mặc định (16)
            SpeedEnabled = true
            SpeedButton.Text = "Speed Normal"
        else
            humanoid.WalkSpeed = 16 -- mặc định
            SpeedEnabled = false
            SpeedButton.Text = "Speed x2"
        end
    end
end)
