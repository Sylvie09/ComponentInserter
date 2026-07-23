local pluginSettings = {}

pluginSettings.CurrentSettings = {}

pluginSettings.OptionsList = {
	{
		Name = "InsertNilAttributes",
		Title = "Insert/Show attributes with nil default values",
		Default = "Insert",
		Options = {
			{Name = "Insert", Title = "Insert"},
			{Name = "NoInsert", Title = "Don't Insert"},
			{Name = "NoShow", Title = "Don't Show"},
		},
	},
	{
		Name = "UseSerializerDefaults",
		Title = "Use default attribute values included in the Serializer",
		Default = "UseSerializer",
		Options = {
			{Name = "UseSerializer", Title = "Use Serializer Defaults"},
			{Name = "UseRoblox", Title = "Use Roblox Defaults"},
		},
	},
	{
		Name = "HandleUnserialized",
		Title = "Insert/Show unserialized components and attributes",
		Default = "NoInsert",
		Options = {
			{Name = "Bypass", Title = "Bypass Validation"},
			{Name = "Insert", Title = "Insert"},
			{Name = "NoInsert", Title = "Don't Insert"},
			{Name = "NoShow", Title = "Don't Show"},
		},
	},
	{
		Name = "GoogMode",
		Title = "Goog-ify components (don't use this)",
		Default = "No",
		Options = {
			{Name = "Yes", Title = "Yes"},
			{Name = "No", Title = "No"},
		},
	},
}

function pluginSettings.GetOptionsNames()
	local returnTable = {}
	for i, v in ipairs(pluginSettings.OptionsList) do
		table.insert(returnTable, v.Name)
	end
	return returnTable
end

function pluginSettings.GetOptionInfo(optionName: string)
	if typeof(optionName) ~= "string" then
		warn("Non-string option name: " .. optionName)
	end
	
	for i, v in ipairs(pluginSettings.OptionsList) do
		if v.Name == optionName then
			return v
		end
	end
	
	warn("Tried to get info for option that does not exist: " .. optionName)
	return nil
end

return pluginSettings
