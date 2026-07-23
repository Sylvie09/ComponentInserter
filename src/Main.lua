local componentInserterVersion = "1.5.0"

-- This code is an absolute mess I should make some kind of framework for plugins if I decide to make another plugin

print("Component Inserter: Starting plugin...")

local selection = game:GetService("Selection")
local httpService = game:GetService("HttpService")
local root = script.Parent
require(root.ConstructGUI)
local components = require(root.Components)
local attributeValues = require(root.AttributeValues)
local typeConversion = require(root.TypeConversion)
local apiConsumer = require(root.APIConsumer)
local pluginSettings = require(root.PluginSettings)
local googStrings = require(root.GoogStrings)

local showingSettings = false
local pendingSettings = {}

local mainFrame: Frame = root.MainFrame
local componentTemplate: Frame = mainFrame.ComponentTemplate
local componentList: ScrollingFrame = mainFrame.ComponentList
local searchHeader: Frame = mainFrame.SearchHeader
local searchBar: TextBox = searchHeader.Search
local settingsButton: TextButton = searchHeader.SettingsButton
local helpHeader: Frame = mainFrame.HelpHeader
local helpScroll: ScrollingFrame = mainFrame.HelpScroll
local settingTemplate: Frame = mainFrame.SettingTemplate

local attributeBlacklist = {
	EnemyWeaponsWave1 = true,
	EnemyWeaponsWave2 = true,
	EnemyWeaponsWave3 = true,
	EnemyWeaponsWave4 = true,
	EnemyWeaponsWave5 = true,
	EnemyWeaponsWave6 = true,
	EnemyWeaponsWave7 = true,
	EnemyWeaponsWave8 = true,
	EnemyWeaponsWave9 = true,
}

local NEW_VERSION_TEXT = "Installed Component Inserter plugin does not match version on GitHub; be sure to download the most recent version of the plugin for new fixes and additions"

local toolbar = plugin:CreateToolbar("Component Inserter")
local pluginButton = toolbar:CreateButton(
	"Insert StateComponents", -- Text below button
	"Insert StateComponents into your mission from a list, and get some handy explanations for them as well", -- Hovertext
	if settings().Studio.Theme.Name == "Dark" then "rbxassetid://99754481925613" else "rbxassetid://135383589626064" -- Button icon
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

local api = apiConsumer.WaitForAPI(10)
local apiSuccess = api ~= nil

if not apiSuccess then
	warn("Component Inserter: Could not get Serializer API")
else
	print("Component Inserter: Successfully got Serializer API")
end

local attributesMap = if apiSuccess then api.GetAttributesMap() else {}

local function CheckForUpdate()
	local success, returnData = pcall(function()
		return httpService:GetAsync("https://raw.githubusercontent.com/Sylvie09/ComponentInserter/refs/heads/main/src/Main.lua")
	end)
	
	if not success then
		warn("Component Inserter: Failed to check GitHub plugin version; error: " .. returnData)
		return
	end
	
	if (not string.find(returnData, "componentInserterVersion")) or string.find(returnData, 'componentInserterVersion = "' .. componentInserterVersion .. '"') then
		print("Component Inserter: Installed plugin is up to date")
		return
	end
	
	warn("Component Inserter: " .. NEW_VERSION_TEXT)
end

coroutine.resume(coroutine.create(CheckForUpdate))

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
	searchHeader.Visible = show
	componentList.Visible = show
	helpHeader.Visible = not show
	helpScroll.Visible = not show
end

local function GetComponentAttributes(stateComponent: string)
	local returnTable = {}

	if apiSuccess and attributesMap[stateComponent] then
		local currentValue
		for i, v in pairs(attributesMap[stateComponent]) do
			if attributeBlacklist[i] then continue end
			
			currentValue = attributeValues[typeConversion[v[1]]]
			
			if pluginSettings.CurrentSettings.UseSerializerDefaults == "UseSerializer" and v[2] ~= nil then
				if (typeConversion[v[1]] == "Expression -> number") or (typeConversion[v[1]] == "Expression" and typeof(v[2]) == "number") then
						currentValue = tostring(v[2])
				else
					currentValue = v[2]
				end
			end
			
			returnTable[i] = {
				Name = i,
				Value = currentValue,
				Type = typeConversion[v[1]],
				Info = nil,
				NoInsert = false,
				IgnoreUnserialized = false,
			}
		end
	end
	
	if components[stateComponent] then
		local previousValue
		for i, v in pairs(components[stateComponent].Attributes) do
			if returnTable[i] and (returnTable[i].Value ~= nil) then
				previousValue = returnTable[i].Value
			else
				previousValue = nil
			end
			returnTable[i] = {
				Name = i,
				Value = previousValue or attributeValues[v[1]],
				Type = v[1],
				Info = v[2],
				NoInsert = v[3],
				IgnoreUnserialized = v[4],
			}
		end
	end

	return returnTable
end

local function InsertStateComponent(stateComponent: string)
	if not components[stateComponent] and not attributesMap[stateComponent] then
		warn("Component Inserter: Attempted to insert StateComponent with invalid name; if you see this warning, please contact the plugin creator")
		return
	end

	local debugMission = workspace:FindFirstChild("DebugMission")

	if not debugMission then
		warn("Component Inserter: Could not insert, no DebugMission folder found")
		return
	end

	local stateComponentsFolder = debugMission:FindFirstChild("StateComponents")

	if not stateComponentsFolder then
		stateComponentsFolder = Instance.new("Folder")
		stateComponentsFolder.Name = "StateComponents"
		stateComponentsFolder.Parent = debugMission
		print("Component Inserter: Couldn't find StateComponents folder in DebugMission and created a new one")
	end

	local newComponent = Instance.new("BoolValue")
	newComponent.Name = stateComponent
	if pluginSettings.CurrentSettings.GoogMode == "Yes" then
		newComponent.Name = googStrings.GetString("Component")
	end
	newComponent:SetAttribute("Type", stateComponent)
	
	local newParent = stateComponentsFolder
	local stateComponentsPreProcess = debugMission:FindFirstChild("StateComponentsPreProcess")
	local stateComponentTemplates = debugMission:FindFirstChild("StateComponentTemplates")
	local currentSelection = selection:Get()
	
	if #currentSelection == 1 and (currentSelection[1]:IsDescendantOf(stateComponentsFolder) or currentSelection[1] == stateComponentsPreProcess or currentSelection[1] == stateComponentTemplates or (stateComponentsPreProcess and currentSelection[1]:IsDescendantOf(stateComponentsPreProcess)) or (stateComponentTemplates and currentSelection[1]:IsDescendantOf(stateComponentTemplates))) then
		if currentSelection[1]:IsA("Folder") then
			newParent = currentSelection[1]
		else
			newParent = currentSelection[1].Parent
		end
	end
	
	newComponent.Parent = newParent
	
	local attributeTable = GetComponentAttributes(stateComponent)
	local currentAttributeUnserialized
	local anyAttributeUnserialized = false

	for attribute, properties in pairs(GetComponentAttributes(stateComponent)) do
		if properties.NoInsert then continue end
		currentAttributeUnserialized = apiSuccess and ((not attributesMap[stateComponent]) or ((not attributesMap[stateComponent][attribute]) and (not attributeTable[attribute]["IgnoreUnserialized"])))
		if (pluginSettings.CurrentSettings.HandleUnserialized == "NoInsert" or pluginSettings.CurrentSettings.HandleUnserialized == "NoShow") and currentAttributeUnserialized then continue end
		if (pluginSettings.CurrentSettings.InsertNilAttributes == "NoInsert" or pluginSettings.CurrentSettings.InsertNilAttributes == "NoShow") and (currentAttributeUnserialized or (apiSuccess and attributesMap[stateComponent][attribute][2] == nil)) then continue end
		anyAttributeUnserialized = anyAttributeUnserialized or currentAttributeUnserialized
		newComponent:SetAttribute(attribute, properties.Value)
	end
	
	if pluginSettings.CurrentSettings.HandleUnserialized == "Bypass" and anyAttributeUnserialized then
		newComponent:SetAttribute("IKnowWhatImDoingDoNotValidate", true)
	end

	selection:Set({newComponent})
end

function LoadComponentHelp(stateComponent: string)
	if not components[stateComponent] then
		warn("Component Inserter: Attempted to load help for an unknown StateComponent")
		return
	end

	helpHeader.ComponentTitle.Text = stateComponent
	if pluginSettings.CurrentSettings.GoogMode == "Yes" then
		helpHeader.ComponentTitle.Text = googStrings.GetString("Component")
	end

	local componentTable = components[stateComponent]
	local attributeTable = GetComponentAttributes(stateComponent)

	local finalText = componentTable.HelpText
	if pluginSettings.CurrentSettings.GoogMode == "Yes" then
		finalText = googStrings.GetString("ComponentDesc")
	end
	
	if apiSuccess and not attributesMap[stateComponent] then
		finalText ..= '\n\n<b><font color="#FF7800">This component is not supported by the currently installed serializer and will not be properly exported with the mission. Make sure your serializer is the most recent version</font></b>'
	end

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
	
	local attributeType
	local attributeInfo
	local attributeName
	local unserializedAttribute = false
	local currentAttributeUnserialized = false
	
	for i, v in ipairs(attributeKeys) do
		currentAttributeUnserialized = apiSuccess and ((not attributesMap[stateComponent]) or (not attributesMap[stateComponent][v])) and not attributeTable[v]["IgnoreUnserialized"]
		
		if pluginSettings.CurrentSettings.HandleUnserialized == "NoShow" and currentAttributeUnserialized then continue end
		
		if apiSuccess and pluginSettings.CurrentSettings.InsertNilAttributes == "NoShow" and attributesMap[stateComponent][v][2] == nil then continue end
		
		unserializedAttribute = unserializedAttribute or currentAttributeUnserialized
		
		attributeType = attributeTable[v]["Type"] or "Unknown"
		attributeInfo = attributeTable[v]["Info"] or "This attribute is unknown to the currently installed version of Component Inserter"
		if pluginSettings.CurrentSettings.GoogMode == "Yes" then
			attributeType = googStrings.GetString("Type")
			attributeInfo = googStrings.GetString("AttributeDesc")
		end
		
		attributeName = if pluginSettings.CurrentSettings.GoogMode == "Yes" then googStrings.GetString("Attribute") else v
		
		if currentAttributeUnserialized then
			finalText ..= '\n\n<b><font color="#FF7800">' .. attributeName .. '*</font> [' .. attributeType .. ']:</b> ' .. attributeInfo
		else
			finalText ..= "\n\n<b>" .. attributeName .. " [" .. attributeType .. "]:</b> " .. attributeInfo
		end
	end
	
	if unserializedAttribute then
		finalText ..= '\n\n<b><font color="#FF7800">*Some attributes of this component are not supported by the currently installed serializer' .. ((pluginSettings.CurrentSettings.HandleUnserialized == "NoInsert" and ' and will not be inserted') or (pluginSettings.CurrentSettings.HandleUnserialized ~= "Bypass" and ' and will not be properly exported with the mission') or ('')) .. '. Make sure your serializer is the most recent version</font></b>'
	end

	helpScroll.TextLabel.Text = finalText

	helpScroll.CanvasPosition = Vector2.zero

	ShowMain(false)
end

local function PopulateComponentList()
	local newComponentFrame
	componentList.CanvasSize = UDim2.new(0, 0, 0, 0)
	componentList.CanvasPosition = Vector2.zero

	for i, v in pairs(components) do
		if apiSuccess and attributesMap[i] == nil and pluginSettings.CurrentSettings.HandleUnserialized == "NoShow" then continue end
		
		newComponentFrame = componentTemplate:Clone()
		
		local displayName = i
		if pluginSettings.CurrentSettings.GoogMode == "Yes" then
			displayName = googStrings.GetString("Component")
		end
		
		newComponentFrame.Name = i
		if attributesMap[i] or not apiSuccess then
			newComponentFrame.ComponentName.Text = displayName
		else
			newComponentFrame.ComponentName.Text = '<font color="#FF7800">' .. displayName .. '</font>'
		end
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
	
	searchBar.Text = ""
end

local function ClearComponentList()
	for i, v in ipairs(componentList:GetChildren()) do
		if v:IsA("Frame") then v:Destroy() end
	end
end

function UpdateCurrentSettings()
	local internalSetting
	for i, v in ipairs(pluginSettings.GetOptionsNames()) do
		pluginSettings.CurrentSettings[v] = plugin:GetSetting(v) or pluginSettings.GetOptionInfo(v).Default
	end
end

function UpdateInternalSettings()
	for i, v in pairs(pluginSettings.CurrentSettings) do
		plugin:SetSetting(i, v)
	end
end

local function ShowSettings(show: boolean)
	helpHeader.Visible = show
	searchHeader.Visible = not show
	showingSettings = show

	ClearComponentList()
	
	componentList.UIListLayout.Padding = UDim.new(0, (show and 5) or 2)
	componentList.UIListLayout.SortOrder = (show and Enum.SortOrder.LayoutOrder) or Enum.SortOrder.Name
	
	if not show then
		for i, v in pairs(pendingSettings) do
			pluginSettings.CurrentSettings[i] = v
		end
		UpdateInternalSettings()
		PopulateComponentList()
		return
	end
	
	helpHeader.ComponentTitle.Text = "Settings"
	
	for i, v in pairs(pluginSettings.CurrentSettings) do
		pendingSettings[i] = v
	end
	
	componentList.CanvasSize = UDim2.new(0, 0, 0, 0)
	componentList.CanvasPosition = Vector2.zero
	
	for settingNum, setting in ipairs(pluginSettings.OptionsList) do
		local newSetting: Frame = settingTemplate:Clone()
		newSetting.Parent = componentList
		newSetting.Name = setting.Name
		newSetting.LayoutOrder = settingNum
		
		newSetting.SettingName.Text = setting.Title
		
		local buttonFrame: Frame = newSetting.ButtonFrame
		local buttonTemplate: TextButton = buttonFrame.SettingButton
		for optionNum, option in ipairs(setting.Options) do
			local newButton: TextButton = buttonTemplate:Clone()
			newButton.Parent = buttonFrame
			newButton.Name = option.Name
			newButton.Text = option.Title
			newButton.Size = UDim2.new(1 / #setting.Options, 0, 1, 0)
			newButton.Interactable = pendingSettings[setting.Name] ~= option.Name
			newButton.AutoButtonColor = pendingSettings[setting.Name] ~= option.Name
			newButton.BackgroundTransparency = pendingSettings[setting.Name] ~= option.Name and 0.65 or 0.9
			
			newButton.Activated:Connect(function()
				buttonFrame[pendingSettings[setting.Name]].BackgroundTransparency = 0.65
				buttonFrame[pendingSettings[setting.Name]].Interactable = true
				buttonFrame[pendingSettings[setting.Name]].AutoButtonColor = true
				
				newButton.BackgroundTransparency = 0.9
				newButton.Interactable = false
				newButton.AutoButtonColor = false
				
				pendingSettings[setting.Name] = newButton.Name
			end)
			
			newButton.Visible = true
		end
		
		newSetting.Visible = true
		
		componentList.CanvasSize += UDim2.new(0, 0, 0, 115)
	end
end

UpdateCurrentSettings()

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
	if not showingSettings then
		ShowMain(true)
	else
		ShowSettings(false)
	end
end)

settingsButton.Activated:Connect(function()
	ShowSettings(true)
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
