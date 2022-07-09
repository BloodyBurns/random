local plrs = game:GetService('Players')
local plr = game:GetService('Players').LocalPlayer
local Import = function(Player, Part)
    local ESP = game:GetObjects('rbxassetid://10171312876')[1] -- // Box | Health
    local HealthUI = ESP.Health
    local BoxUI = ESP.Box
    
    BoxUI.Parent = Part
    BoxUI.Adornee = Part
    BoxUI.Modes.Outline.Visible = true
    BoxUI.SizeOffset = Vector2.new(0, 0)
    BoxUI.Modes.Outline.ImageColor3 = _G.IvESP_Settings.Color or Color3.new(1, 1, 1)
    BoxUI.Modes.Filled.BackgroundColor3 = _G.IvESP_Settings.Color or Color3.new(1, 1, 1)
    BoxUI.Modes.Filled.BackgroundTransparency = 0.5
    BoxUI.Modes.Filled.Visible = _G.IvESP_Settings.Filled or false

    HealthUI.Parent = Part
    HealthUI.Adornee = Part
    HealthUI.Bar.Visible = true
    HealthUI.SizeOffset = Vector2.new(0, 0)
    
    Player.Character.Humanoid.HealthChanged:Connect(function(Health)
        print(Health/100)
        HealthUI.Bar.Size = UDim2.new(0.04, 0, Health/100, 0)
        HealthUI.Bar.Position = UDim2.new(0.02, 0, 1 - Health/100, 0)

        if Health > 80 then
            HealthUI.Bar.BackgroundColor3 = Color3.new(0, 1, 0)
        elseif Health > 60 then
            HealthUI.Bar.BackgroundColor3 = Color3.new(0.6, 1, 0)
        elseif Health > 35 then
            HealthUI.Bar.BackgroundColor3 = Color3.new(1, 0.5, 0)
        else
            HealthUI.Bar.BackgroundColor3 = Color3.new(1, 0, 0)
        end
    end)
end

for _, v in next, plrs:GetPlayers() do
    if v ~= plr then
        if v.Character then
            Import(v, (v.Character:FindFirstChild('UpperTorso') or v.Character:FindFirstChild('Torso')), _G.IvESP_Settings.Filled, Color3.new(1, 0, 0))
        end

        v.CharacterAdded:Connect(function(Chr)
            Chr:WaitForChild('Humanoid')
            Import(v, (Chr:FindFirstChild('UpperTorso') or Chr:FindFirstChild('Torso')))
        end)
    end
end

plrs.PlayerAdded:Connect(function(Player)
    Player.CharacterAdded:Connect(function(Chr)
        Chr:WaitForChild('Humanoid')
        Import(v, (Chr:FindFirstChild('UpperTorso') or Chr:FindFirstChild('Torso')))
    end)
end)
