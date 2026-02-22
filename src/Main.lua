-- This has got to be some of the messiest spaghetti code you've seen
-- But it's functional, it serves it's purpose, and that's what matters most

local selection = game:GetService("Selection")
local root = script.Parent
local components = require(root.Components)
local attributeValues = require(root.AttributeValues)
local mainFrame = root.MainFrame
local componentTemplate = mainFrame.ComponentTemplate
local componentList = mainFrame.ComponentList
local searchBar = mainFrame.Search
local helpHeader = mainFrame.HelpHeader
local helpScroll = mainFrame.HelpScroll
local apiConsumer = require(root.APIConsumer)

local apiSuccess, api = apiConsumer.TryGetAPI()

local attributesMap = if apiSuccess then api.GetAttributesMap() else nil

local toolbar = plugin:CreateToolbar("Component Inserter")
local pluginButton = toolbar:CreateButton(
	"Insert StateComponents", -- Text below button
	"Insert StateComponents into your mission from a list, and get some handy explanations for them as well", -- Hovertext
	if settings().Studio.Theme.Name == "Dark" then "rbxassetid://129832586363670" else "rbxassetid://82013389227413" -- Button icon
)

local info = DockWidgetPluginGuiInfo.new(
	Enum.InitialDockState.Float, -- Where the widget initially appears at
	false, -- If the widget will be initially enabled
	false, -- If the widget will have its size and position reset every time the plugin is activated
	375, -- Default width
	600, -- Default height
	300, -- Minimum width
	225 -- Minimum height
)

local widget = plugin:CreateDockWidgetPluginGuiAsync(
	"ComponentInserter",
	info
)

widget.Title = "Component Inserter"

script.Parent.MainFrame.Parent = widget

local function InvertColor(color: Color3)
	return Color3.new(1 - color.R, 1 - color.G, 1 - color.B)
end

local function InvertTheme()
	for i, v in ipairs(mainFrame:GetDescendants()) do
		if v:IsA("GuiObject") then
			v.BackgroundColor3 = InvertColor(v.BackgroundColor3)
			
			if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
				v.TextColor3 = InvertColor(v.TextColor3)
				v.TextStrokeColor3 = InvertColor(v.TextStrokeColor3)
			end
		end
	end
end

local function ShowMain(show: boolean)
	searchBar.Visible = show
	componentList.Visible = show
	helpHeader.Visible = not show
	helpScroll.Visible = not show
end

local function GetComponentAttributes(stateComponent: string)
	local returnTable = {}
	
	if apiSuccess and attributesMap[stateComponent] then
		for i, v in pairs(attributesMap[stateComponent]) do
			returnTable[i] = v[2]
		end
	end
	
	if components[stateComponent] then
		for i, v in pairs(components[stateComponent].Attributes) do
			if v[3] then continue end
			if returnTable[i] then continue end
			returnTable[i] = attributeValues[v[1]]
		end
	end
	
	return returnTable
end

local function InsertStateComponent(stateComponent: string)
	if not components[stateComponent] and not attributesMap[stateComponent] then
		warn("Attempted to insert StateComponent with invalid name")
		return
	end
	
	local debugMission = workspace:FindFirstChild("DebugMission")
	
	if not debugMission then
		warn("No DebugMission folder found")
		return
	end
	
	local stateComponentsFolder = debugMission:FindFirstChild("StateComponents")
	
	if not stateComponentsFolder then
		stateComponentsFolder = Instance.new("Folder")
		stateComponentsFolder.Name = "StateComponents"
		stateComponentsFolder.Parent = debugMission
		print("Couldn't find StateComponents folder in DebugMission and created a new one")
	end
	
	local newComponent = Instance.new("BoolValue")
	newComponent.Name = stateComponent
	newComponent.Parent = stateComponentsFolder
	newComponent:SetAttribute("Type", stateComponent)
	
	for attribute, value in pairs(GetComponentAttributes(stateComponent)) do
		newComponent:SetAttribute(attribute, value)
	end
	
	selection:Set({newComponent})
end

function LoadComponentHelp(stateComponent: string)
	if not components[stateComponent] then
		warn("Attempted to load help for invalid StateComponent name")
		return
	end

	helpHeader.ComponentTitle.Text = stateComponent

	local componentTable = components[stateComponent]
	local attributeTable = componentTable.Attributes

	local finalText = componentTable.HelpText

	local attributeKeys = {}
	for i, v in pairs(attributeTable) do
		table.insert(attributeKeys, i)
	end

	table.sort(attributeKeys, function(v1: string, v2: string)
		local val1 = v1:lower()
		local val2 = v2:lower()

		for i = 1, math.min(val1:len(), val2:len()) do
			if val1:byte(i, i) < val2:byte(i, i) then
				return true
			elseif val1:byte(i, i) > val2:byte(i, i) then
				return false
			end
		end
		
		return val1:len() < val2:len()
	end)

	for i, v in ipairs(attributeKeys) do
		finalText ..= "\n\n<b>" .. v .. " [" .. attributeTable[v][1] .. "]:</b> " .. attributeTable[v][2]
	end

	helpScroll.TextLabel.Text = finalText
	
	helpScroll.CanvasPosition = Vector2.zero

	ShowMain(false)
end

local function PopulateComponentList()
	local newComponentFrame
	componentList.CanvasSize = UDim2.new(0, 0, 0, 0)

	for i, v in pairs(components) do
		newComponentFrame = componentTemplate:Clone()

		newComponentFrame.Name = i
		newComponentFrame.ComponentName.Text = i
		newComponentFrame.Visible = true

		newComponentFrame.Parent = componentList
		
		newComponentFrame.ComponentName.Activated:Connect(function()
			InsertStateComponent(i)
		end)
		
		newComponentFrame.HelpButton.Activated:Connect(function()
			LoadComponentHelp(i)
		end)

		componentList.CanvasSize += UDim2.new(0, 0, 0, 37)
	end
end

local function ClearComponentList()
	for i, v in ipairs(componentList:GetChildren()) do
		if v:IsA("Frame") then v:Destroy() end
	end
end

PopulateComponentList()

searchBar.Changed:Connect(function(property: string)
	if property ~= "Text" then return end
	
	componentList.CanvasPosition = Vector2.zero
	
	for i, v in ipairs(componentList:GetChildren()) do
		if not v:IsA("Frame") then continue end
		
		if searchBar.Text == "" then v.Visible = true continue end
		
		if v.Name:lower():find(searchBar.Text:lower()) then
			v.Visible = true
		else
			v.Visible = false
		end
	end
end)

helpHeader.BackButton.Activated:Connect(function()
	ShowMain(true)
end)

pluginButton.Click:Connect(function()
	widget.Enabled = not widget.Enabled
end)

if settings().Studio.Theme.Name == "Light" then
	InvertTheme()
end

settings().Studio.ThemeChanged:Connect(function()
	InvertTheme()
end)
