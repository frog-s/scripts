print('load [1]')

local VirtualUser = game:GetService('VirtualUser')

game:GetService('Players').LocalPlayer.Idled:Connect(function()
VirtualUser:CaptureController()
VirtualUser:ClickButton2(Vector2.new())
print('IM NOT AFK')
end)

local function TweenToCoin(Coin)
  pcall(function()
  game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = Coin.CFrame}):Play()
  end)
end

_G.Searching = false
_G.IsActiveTeleport = false
_G.YeThatExists = false

local function FakeHumanoid()
 if game.Players.LocalPlayer.Character then
     if not game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then return end
 local Hum = game.Players.LocalPlayer.Character.Humanoid:Clone()
 game.Players.LocalPlayer.Character.Humanoid:Destroy()
 Hum.Parent = game.Players.LocalPlayer.Character
 end
end

local function IsAlive()
  local Value = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):WaitForChild("CashBag").Visible

  if Value then return true else if not Value then return false end end

end

local function CheckAmount()
  local Value = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):WaitForChild("CashBag")
  local WValu = Value:WaitForChild("CoinIcon"):WaitForChild("Coins")
  
  return WValu.Text
end

local function LobbyCheck()
  local Value = game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MainGUI"):WaitForChild("Game"):WaitForChild("Waiting").Visible
  
  if Value then return true else if not Value then return false end end

end

local function Start()
FakeHumanoid()

_G.Searching = true

local I, E = pcall(function()
for I, V in pairs(workspace:GetDescendants()) do
  if V:IsA("Model") then
    if V:FindFirstChild("CoinContainer") then
     for Index, Coin in pairs(V.CoinContainer:GetDescendants()) do
        if Coin.Name == "Coin_Server" then
          if Coin:FindFirstChild("Coin") then
            TweenToCoin(Coin)
            wait(3)
          end
        end
      end
    end
  end
end
end)

if I then 
  _G.Searching = false
if not I then
  _G.Searching = false
  end
end

end

loadstring(game:HttpGet('https://raw.githubusercontent.com/frog-s/scripts/main/!'))()

print('load [2]')

while wait(2) do
 if not IsAlive() then 
     warn('waiting for the game to start.') 
 end
 if tonumber(CheckAmount()) == 50 or _G.YeThatExists and not IsAlive() then
    game:GetService("TeleportService"):Teleport(game.PlaceId)
 end
 if not _G.Searching and IsAlive() then
    warn(tonumber(CheckAmount()))
    warn('in-game, looking!')
    Start()
 end
end
