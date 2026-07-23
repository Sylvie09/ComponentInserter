local googStrings = {}

function googStrings.GetString(stringType: "Component"|"Attribute"|"Type"|"ComponentDesc"|"AttributeDesc"): string
	return googStrings.stringTable[stringType][math.random(1, #googStrings.stringTable[stringType])]
end

googStrings.stringTable = {
	Component = {"Goog"},
	Attribute = {"Goog", "GoogGoog", "GoogAttribute", "GoogValue"},
	Type = {"Goog", "Goog", "GoogGoog"},
	ComponentDesc = {
		"Googs the Goog when the Goog is Goog",
		"Sets the Goog to the Goog if Goog is Goog",
		"Creates a Goog Goog that Googs the Goog",
	},
	AttributeDesc = {
		"The Goog to Goog when Goog is Goog",
		"The Goog of the Goog to Goog",
		"When Goog, Goog will Goog in the Goog; used for Goog",
	},
}

return googStrings
