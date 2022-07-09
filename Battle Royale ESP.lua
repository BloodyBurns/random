_G.IvESP_Settings = {
    Tag = true,
    Filled = true,
    Color = Color3.new(1, 0, 0),
}

local plrs = game:GetService('Players')
local plr = game:GetService('Players').LocalPlayer
local Import = function(Humanoid, Part)
    local Overhead = game:GetObjects('rbxassetid://10116879170')[1]
    local ESP = game:GetObjects('rbxassetid://10171312876')[1] -- // Box | Health
    local HealthUI = ESP.Health
    local BoxUI = ESP.Box
    
    Overhead.Name = 'Iv ESP'
    Overhead.Enabled = _G.IvESP_Settings.Tag or false
    Overhead.Parent = Part.Parent.Head
    Overhead.TextLabel.Text = '<font color = \'rgb(0, 255, 0)\'>' .. Humanoid.Health ..'</font>'
    Overhead.TextLabel.TextSize = 25
            
    BoxUI.Parent = Part
    BoxUI.Adornee = Part
    BoxUI.Modes.Outline.Visible = true
    BoxUI.SizeOffset = Vector2.new(0, 0)
    BoxUI.Modes.Outline.ImageColor3 = _G.IvESP_Settings.Color or Color3.new(1, 1, 1)
    BoxUI.Modes.Filled.BackgroundColor3 = _G.IvESP_Settings.Color or Color3.new(1, 1, 1)
    BoxUI.Modes.Filled.BackgroundTransparency = 0.4
    BoxUI.Modes.Filled.Visible = _G.IvESP_Settings.Filled or false

    HealthUI.Parent = Part
    HealthUI.Adornee = Part
    HealthUI.Bar.Visible = true
    HealthUI.SizeOffset = Vector2.new(0, 0)
    
    Humanoid.HealthChanged:Connect(function(Health)
        HealthUI.Bar.Size = UDim2.new(0.04, 0, Health/100, 0)
        HealthUI.Bar.Position = UDim2.new(0.02, 0, 1 - Health/100, 0)

        if Health > 80 then
            Overhead.TextLabel.Text = Player.Name .. '<font color = \'rgb(0, 255, 0)\'> | ' .. math.floor(Character.Humanoid.Health) ..'</font>'	
            HealthUI.Bar.BackgroundColor3 = Color3.new(0, 1, 0)
        elseif Health > 60 then
            Overhead.TextLabel.Text = Player.Name .. '<font color = \'rgb(255, 200, 0)\'> | ' .. math.floor(Health) ..'</font>'	
            HealthUI.Bar.BackgroundColor3 = Color3.new(0.6, 1, 0)
        elseif Health > 35 then
            Overhead.TextLabel.Text = Player.Name .. '<font color = \'rgb(255, 155, 0)\'> | ' .. math.floor(Health) ..'</font>'	
            HealthUI.Bar.BackgroundColor3 = Color3.new(1, 0.5, 0)
        else
            HealthUI.Bar.BackgroundColor3 = Color3.new(1, 0, 0)
            BBU.TextLabel.Text = Player.Name .. '<font color = \'rgb(255, 0, 0)\'> | ' .. math.floor(Health) ..'</font>'	
        end
    end)
end

for _, v in next, workspace:GetDescendants() do
    if v:IsA('Humanoid') then
        Import(v, v.Parent.UpperTorso)
    end
end

workspace.DescendantAdded:Connect(function(Obj)
    if Obj:IsA('Humanoid') then
        game:GetService('RunService').RenderStepped:Wait()
        Import(Obj, Obj.Parent.UpperTorso)
    end
end)
