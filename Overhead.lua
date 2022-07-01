local Create = function(Player, Text)
	local Overhead = Instance.new("BillboardGui")
	Overhead.Name = "Tag"
	Overhead.AlwaysOnTop = true
	Overhead.MaxDistance = 100
	Overhead.Size = UDim2.new(0, 100, 0, 200)
	Overhead.StudsOffset = Vector3.new(0, 1.7, 0)

	local Tag = Instance.new("TextLabel", Overhead)
	Tag.Name = "TagText"
	Tag.Text = Text
	Tag.TextSize = 15
	Tag.BackgroundTransparency = 1
	Tag.Size = UDim2.new(1, 0, 0, 150)
	Tag.TextColor3 = Color3.fromRGB(255, 0, 0)
	Tag.Font = Enum.Font.SourceSansSemibold
	Overhead.Parent = Player.Character:WaitForChild('Head')
	Overhead.Adornee = Player.Character.Head
end

return Create
