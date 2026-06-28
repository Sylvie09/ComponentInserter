local template = {
	Component = {
		HelpText = "Text",
		Attributes = {

		},
	},
}

local components = {
	AlarmedBehaviorOverride = {
		HelpText = "Overrides the behavior of specified bots with a given CustomBehavior when they enter combat",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag that the CustomBehavior will apply to"},
			CustomBehavior = {"CustomBehavior", "The CustomBehavior to apply; for more information on CustomBehavior, consult the documentation"},
		},
	},
	AlertLowerCondition = {
		HelpText = "Lowers the alert level when a specific condition is met",
		Attributes = {
			AlertLevel = {"Expression -> number", "The amount to lower the alert level by (1 is equivalent to one full level, such as Alert -> Normal)"},
			Condition = {"Expression -> boolean", "When true, this AlertLowerCondition will activate"},
		},
	},
	AlertRaiseCondition = {
		HelpText = "Raises the alert level when a specific condition is met",
		Attributes = {
			Amount = {"number", "The amount that the alert level will raise (1 is equivalent to one full level, such as Calm -> Normal)"},
			Condition = {"Expression -> boolean", "When true, this AlertRaiseCondition will activate"},
			MaxValue = {"number", "The maximum value this AlertRaiseCondition can raise the alert level to"},
			MinValue = {"number", "The minimum value this AlertRaiseCondition can raise the alert level to"},
			Reason = {"CustomString", "The notification text that will appear when this AlertRaiseCondition activates"},
		},
	},
	AutoConversationTrigger = {
		HelpText = "Makes specified bot(s) forcefully trigger a conversation with the player when they are in range and a specific condition is met",
		Attributes = {
			Active = {"Expression -> boolean", "When true, specified bot(s) will attempt to trigger a conversation with the player when they are nearby"},
			BotClientTag = {"string", "The client-side bot tag to affect"},
		}
	},
	BlackoutScreen = {
		HelpText = "Fades out the player's view to a dark screen when a specified condition is true",
		Attributes = {
			Active = {"Expression -> boolean", "When true, the player's screen is covered in darkness"},
			Speed = {"number", "The amount of time that it takes, in seconds, for the dark screen to fade in and out"},
		},
	},
	BodyAltTrigger = {
		HelpText = "Adds an alternate (G) interaction trigger to the dead or unconscious body/bodies of specified bot(s)",
		Attributes = {
			BotClientTag = {"string", "The client-side bot tag to apply the trigger to"},
			BotServerTag = {"string", "The server-side bot tag to apply the trigger to"},
			ClientVisible = {"Expression -> boolean", "When false, the local player will not be able to see or interact with the trigger"},
			HoldTime = {"number", "The amount of time the trigger must be held, in seconds, to complete"},
			ServerEnabled = {"Expression -> boolean", "When false, no player will be able to see or interact with the trigger"},
			SubtitleKey = {"CustomString", "The text to display under the title text of the trigger"},
			TitleKey = {"CustomString", "The large text to display on the trigger"},
			TriggerNotification = {"CustomString", "The notification to display to all players when the trigger is interaction with"},
			TriggerVariable = {"string", "The name of the variable to increment when the trigger is interacted with"},
		},
	},
	BotAltTrigger = {
		HelpText = "Adds an alternate (G) interaction trigger to specified conscious bot(s)",
		Attributes = {
			AllowHostages = {"boolean", "Applies this trigger to specified bots who are hostages"},
			AllowPatroling = {"boolean", "Applies this trigger to specified bots who are not pacified (yes there is a typo in the attribute name)"},
			BotClientTag = {"string", "The client-side bot tag to apply the trigger to"},
			BotServerTag = {"string", "The server-side bot tag to apply the trigger to"},
			ClientEnabled = {"Expression -> boolean", "When false, the client will not be able to interact with the trigger even if it is visible"},
			ClientVisible = {"Expression -> boolean", "When false, the local player will not be able to see or interact with the trigger"},
			DisabledSubtitleKey = {"CustomString", "The text to display under the title text of the trigger when the trigger is disabled"},
			DisabledTitleKey = {"CustomString", "The large text to display on the trigger when the trigger is disabled"},
			HoldTime = {"number", "The amount of time the trigger must be held, in seconds, to complete"},
			ServerEnabled = {"Expression -> boolean", "When false, no player will be able to see or interact with the trigger"},
			SubtitleKey = {"CustomString", "The text to display under the title text of the trigger"},
			TitleKey = {"CustomString", "The large text to display on the trigger"},
			TriggerClientVariable = {"string", "The name of the client-side variable to increment when the trigger is interacted with"},
			TriggerLocalNotification = {"CustomString", "The notification to display to the player who interacts with the trigger"},
			TriggerNotification = {"CustomString", "The notification to display to all players when the trigger is interaction with"},
			TriggerVariable = {"string", "The name of the global variable to increment when the trigger is interacted with"},
		},
	},
	BotItemSpawn = {
		HelpText = "Spawns an item into the inventory of specified bot(s) when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag to affect"},
			Condition = {"Expression -> boolean", "When true, activates the BotItemSpawn"},
			Item = {"string", "The item to give"},
			ItemTag = {"string", "The item tag to apply to the given item"},
		},
	},
	BotStateTracker = {
		HelpText = "Tracks the status(es) of specified bot(s)",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag for this trigger to track"},
			ClientKillCountVariable = {"string", "The name of the client-side variable whose value will be set to the amount of bots killed by the client"},
			DeathCountVariable = {"string", "The name of the variable whose value will be set to the amount of dead bots with the specified tag"},
			FleeCountVariable = {"string", "The name of the variable whose value will be set to the amount of bots with the specified tag who have successfully fled and escaped"},
			HostageCountVariable = {"string", "The name of the variable whose value will be set to the amount of bots held hostage with the specified tag"},
			IncapacitationCountVariable = {"string", "The name of the variable whose value will be set to the amount of dead, hostage, and unconscious bots with the specified tag"},
			TotalCountVariable = {"string", "The name of the variable whose value will be set to the total amount of bots with the specified tag"},
		},
	},
	CombatSpawner = {
		HelpText = "Spawns enemies in combat based on various specified parameters",
		Attributes = {
			Active = {"Expression -> boolean", "When true, allows this CombatSpawner to function"},
			AllowDespawn = {"boolean", "If true, allows combat enemies spawned to despawn (usually, you should keep this at true)"},
			CurrentWave = {"Expression", "Unknown (if you can figure it out, contact the plugin maker to let them know!)", true},
			CustomCombatData = {"string", "The name of a table in the CustomCombatData table to pull unit information from"},
			CustomPantsId = {"string", "The template ID of custom pants to give to the spawned units"},
			CustomShirtId = {"string", "The template ID of a custom shirt to give to the spawned units"},
			EnemyType = {"string", "Defines the type (outfit and base stats) of enemies spawned, such as Swat, Palisade, Criminal, and HalcyonOperator"},
			EnemyWeapons = {"string", "The pool of weapons enemies can spawn with, with each weapon name being separated by a bar (|); use duplicate entries to increase the chances of specific weapons being spawned"},
			["EnemyWeaponsWave(1-9)"] = {"string", "A new attribute can be set for numbers 1 through 9; has the same formatting as EnemyWeapons, and overrides EnemyWeapons for specific waves", true},
			FallbackCondition = {"Expression -> boolean", "When true, units spawned by this CombatSpawner will retreat to a CombatRetreatPoint prop and despawn"},
			FlowMap = {"string", "The name of the CombatFlowMap to tie enemies to"},
			ReinforcementPool = {"string", "The name of the ReinforcementPool StateComponent to use to pull enemy spawns from"},
			SpawnCap = {"Expression -> number", "The maximum number of combat units that can be alive at the same time"},
			SpawnsBlockedVariable = {"string", "The name of the variable that will be set to true if all possible spawn locations for enemies are unable to spawn units"},
			SpawnSquads = {"boolean", "If true, enemies will spawn in squads of up to 3 units at a time"},
			SpawnTags = {"string", "Determines which combat spawners enemies will spawn at"},
			TimeBetweenSpawns = {"Expression -> number", "The amount of time between enemy spawns, in seconds"}
		},
	},
	ConditionalBotTag = {
		HelpText = "Applies a specific tag to bots with a specified bot tag upon a specific condition being met",
		Attributes = {
			ApplyTag = {"string", "The tag to add to the bot"},
			Condition = {"Expression -> boolean", "When true, applies the ApplyTag to bots with the ReferenceTag"},
			ReferenceTag = {"string", "The tag of the bot to apply the new tag to"},
		},
	},
	ConditionalStateUpdate = {
		HelpText = "Watches a specified variable for a change to a truthy value; after a change is made to the variable, another specified variable will be incremented depending on whether or not a specific condition is true",
		Attributes = {
			ActiveVariable = {"string", "The name of the variable to be incremented after the Watch variable is updated if Condition is true"},
			Condition = {"Expression -> boolean", "The condition that must be true for ActiveVariable to be set once Watch is updated"},
			InactiveVariable = {"string", "The name of the variable to be incremented after the Watch variable is updated if Condition is false"},
			Watch = {"string", "The name of the variable that will be watched for updates"},
		},
	},
	ConversationGenericSocialEngineering = {
		HelpText = "Defines a conversation prompt for specified bot(s) or a specified dialogue tree",
		Attributes = {
			AdvancedProtocolLevel = {"Expression -> number", "The level of Advanced Protocols required to use this prompt"},
			AwarenessLevel = {"Expression -> number", "The level of Awareness required to use this prompt"},
			BotServerTag = {"string", "The server-side bot tag to apply the conversation prompt to"},
			ClientNotification = {"CustomString", "The notification to display to the client when this prompt is used"},
			Dialogue = {"CustomString", "A single string for the player's operative to say when this prompt is used"},
			DialogueTree = {"string", "The dialogue tree this prompt belongs to, if any"},
			DisableReason = {"Expression -> CustomString", "An expression returning a CustomString key if this prompt should be disabled"},
			Disguise = {"string", "The disguise the player must wear to use the prompt"},
			HostageOnly = {"boolean", "If true, this prompt will only be available on hostages"},
			Icon = {"string", "(No longer in use) The icon for the prompt to display; can choose from: ChatCancel, ChatGeneric, ChatOpenDoor, ChatGoBack, ChatIntimidate, ChatLocked, and ChatArrow"},
			IncrementClientVariable = {"string", "The name of the local variable to increment after using this prompt"},
			IntimidationLevel = {"number", "The level of Intimidation required to use this prompt"},
			Label = {"CustomString", "The small dialogue sample to display after the prompt's Text value and perk requirements"},
			NextDialogueTree = {"string", "The dialogue tree that will open after this prompt is used, if any"},
			Notification = {"CustomString", "The notification text to display to players after using the prompt"},
			NotificationDelay = {"number", "The time delay, in seconds, between using the prompt and receiving the notitification, if one is set"},
			Priority = {"Expression -> string", "Unknown (if you can figure it out, contact the plugin maker to let them know!)", true},
			ResolveTime = {"number", "The amount of time in seconds it takes to use this prompt"},
			SetVariable = {"string", "The name of the variable to increment after using this prompt"},
			SetVariableOnce = {"string", "The name of a variable to increment after using this prompt for the first time"},
			SocialEngineeringLevel = {"Expression -> number", "The level of Social Engineering required to use the prompt"},
			Text = {"CustomString", "The text to display on the prompt"},
			Visible = {"Expression", "When false, this prompt will be invisible and uninteractable to players"},
		},
	},
	ConversationResponseCustomBehavior = {
		HelpText = "Defines a Social Engineering conversation prompt for specified bot(s) that apply a CustomBehavior to the bot(s)",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag to apply the conversation prompt to"},
			CustomBehavior = {"CustomBehavior", "The CustomBehavior to apply; for more information on CustomBehavior, consult the documentation"},
			Dialogue = {"CustomString", "A single dialogue string for the player's operator to say after the conversation prompt is used"},
			DisableReason = {"Expression -> CustomString", "An expression returning a CustomString key if the prompt should be disabled"},
			SocialEngineeringLevel = {"Expression", "The level of Social Engineering required to use the prompt"},
		}
	},
	CoverFillSpawner = {
		HelpText = "Spawns enemies in combat based on various specified parameters to fill specific cover spots",
		Attributes = {
			Active = {"Expression -> boolean", "When true, allows this CombatSpawner to function"},
			ActiveVariable = {"string", "The name of the variable whose value will be set to the number of currently alive enemies spawned from this CoverFillSpawner"},
			CoverSearchLimit = {"number", "The maximum number of cells away a valid cover spot can be from the spawn point of an enemy"},
			CoverTags = {"string", "The specific CoverTag of cover spots for enemies spawned from this spawner to use"},
			CurrentWave = {"Expression", "Unknown (if you can figure it out, contact the plugin maker to let them know!)", true},
			CustomCombatData = {"string", "The name of a table in the CustomCombatData table to pull unit information from"},
			CustomPantsId = {"string", "The template ID of custom pants to give to the spawned units"},
			CustomShirtId = {"string", "The template ID of a custom shirt to give to the spawned units"},
			EnemyType = {"string", "Defines the type (outfit) of enemies spawned, such as Swat, Palisade, Criminal, and HalcyonOperator"},
			EnemyWeapons = {"string", "The pool of weapons enemies can spawn with, with each weapon name being separated by a bar (|); use duplicate entries to increase the chances of specific weapons being spawned"},
			["EnemyWeaponsWave(1-9)"] = {"string", "A new attribute can be set for numbers 1 through 9; has the same formatting as EnemyWeapons, and overrides EnemyWeapons for specific waves", true},
			FillFrequency = {"number", "The amount of time between unit spawns, in seconds"},
			FocusPoint = {"Vector3", "Unknown (if you can figure it out, contact the plugin maker to let them know!)", true},
			ReinforcementPool = {"string", "The name of the ReinforcementPool StateComponent to use to pull enemy spawns from"},
			ServerTag = {"string", "The tag to apply to units spawned by this CoverFillSpawner"},
			ShuffleCover = {"boolean", "Unknown (if you can figure it out, contact the plugin maker to let them know!)", true},
			SpawnCap = {"Expression -> number", "The maximum number of combat units that can be alive at the same time"},
			SpawnsBlockedVariable = {"string", "The name of the variable that will be set to true if all possible spawn locations for enemies are unable to spawn units"},
			SpawnTags = {"string", "Determines which combat spawners enemies will spawn at"},
		},
	},
	CredentialUnlock = {
		HelpText = "Unlocks a specified keycard credential when a specific condition is met",
		Attributes = {
			Condition = {"Expression -> boolean", "When true, the keycard credential set in Credential will be unlocked"},
			Credential = {"string", "The keycard credential to unlock"},
		},
	},
	CustomBehaviorCondition = {
		HelpText = "Applies a CustomBehavior to bots with a specified tag when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag the CustomBehavior will apply to"},
			Condition = {"Expression -> boolean", "When true, applies the CustomBehavior to the specified bot(s)"},
			CustomBehavior = {"CustomBehavior", "The CustomBehavior to apply; for more information on CustomBehavior, consult the documentation"},
			LoopApply = {"boolean", "If true, the CustomBehavior will continue to apply even if the bot is interrupted"},
			Priority = {"string", "Can be set to Custom1, Custom2, Custom3, Custom4, or Custom5; a higher number means a higher priority for the CustomBehavior applied, and values of Custom3 or above will prevent the player from initiating conversation with the bot(s)"},
		},
	},
	CustomHack = {
		HelpText = "Creates a hack that can be deployed on a specified network node",
		Attributes = {
			BlockDeallocation = {"boolean", "If true, the hack cannot be cancelled once started or deployed"},
			DeployCost = {"number", "The base amount of network resources that this hack takes to deploy"},
			DeployedOnceVariable = {"string", "The name of the variable that will be incremented once this hack is first deployed, and will not change if the hack is deallocated or redeployed"},
			DeployedVariable = {"string", "The name of the variable that will be incremented when the hack is deployed"},
			DeployTime = {"Expression -> number", "The amount of ticks this hack takes to deploy; ticks go by at a rate of four per second in Stealth and one per second in Loud"},
			DescriptionKey = {"CustomString", "The text to display when the hack is hovered over in the hacking UI, formatted as \"TITLE - Short Action Description\""},
			Difficulty = {"Expression -> number", "The level of Advanced Protocols needed to deploy the hack"},
			DisableReason = {"Expression -> CustomString", "An expression returning a CustomString key if the hack should be disabled; the hack will be visible but uninteractable"},
			IconId = {"string", "The asset ID of the icon to display for the hack in the hacking UI"},
			IsDeployedVariable = {"string", "The name of the variable whose value will be set to true when the hack is currently allocated"},
			NameKey = {"CustomString", "The title text of the hack shown in the allocation list, as well as, if the hack is a primary hack, the interaction prompt"},
			NodeId = {"number", "The network node ID of the device the hack can be deployed on"},
			PauseCondition = {"Expression -> boolean", "When true, progress on the hack being deployed will be paused"},
			PrimaryHack = {"boolean", "If true, the hack may be deployed without a hacking tablet through directly interacting with the device the hack may be deployed on"},
			Priority = {"number", "The priority of which hack should be shown first as a primary hack interaction prompt, should multiple primary hacks be linked to the same device; a higher number means higher priority, and if two primary hacks on the same device have the same priority, the player may choose which one to deploy through an action wheel"},
			ProgressVariable = {"string", "The name of the variable whose value will be set to a decimal representing the deployment progress of the hack; does not get set to 0 if the hack is deallocated"},
			ScriptedBehavior = {"string", "This attribute currently has no use"},
			SubtitleKey = {"CustomString", "The text to be displayed under the title text of the interacttion prompt of the hack, if the hack is a primary hack"},
			Suspicion = {"number", "The amount of hacking risk to add for every tick the hack takes to deploy"},
			Visible = {"Expression -> boolean", "When false, the hack will be invisible and uninteractable for all players"},
		},
	},
	DelayedStateUpdate = {
		HelpText = "Watches a specified variable for a change in its value; after a change is made to the variable, another specified variable will be copy the variable's value after a specified amount of time has passed",
		Attributes = {
			DelayTime = {"number", "The amount of time in seconds it takes for the variable set in SetVariable to be incremented after the variable set in Watch is updated"},
			OnlyMatch = {"boolean", "If false, all updates to the Watch variable will trigger individual updates to the SetVariable variable; if true, the SetVariable variable will be updated only after the DelayTime passes with no further updates to the Watch variable"},
			SetVariable = {"string", "The name of the variable to be changed"},
			Watch = {"string", "The name of the variable that will be watched for updates and copied over to the SetVariable"},
		},
	},
	FileUITrigger = {
		HelpText = "Displays a paper file with custom text on the player's screen when a specific condition is met",
		Attributes = {
			Font = {"string", "The name of the font to use for the text on the file"},
			Lines = {"string", "A list of CustomStrings to be displayed on the file in a randomized order, separated by bars (|)"},
			NoExtraPaper = {"boolean", "If true, extra papers will not be displayed behind the paper file on-screen"},
			NoFolder = {"boolean", "If true, a folder will not be displayed behind the paper file on-screen"},
			ShowTape = {"boolean", "If true, a strip of tape will be shown with the paper file on-screen"},
			TextScale = {"number", "The scale of the text to be shown on the file"},
			Trigger = {"Expression -> boolean", "When true, the file will be shown on the player's screen"},
		},
	},
	HackableDoor = {
		HelpText = "Adds an informational node to the hacking map attached to a specified node showing that a door may be hacked open through the attached node",
		Attributes = {
			NetworkId = {"number", "The network node ID of this node"},
			NetworkLink = {"number", "The network node ID of the device to connect this node to"},
		},
	},
	HackableElevator = {
		HelpText = "Adds an informational node to the hacking map attached to a specified node showing that an elevator may be called through a hack on the attached node",
		Attributes = {
			NetworkId = {"number", "The network node ID of this node"},
			NetworkLink = {"number", "The network node ID of the device to connect this node to"},
		},
	},
	HackingNodeHighlight = {
		HelpText = "Applies an objective marker to a specified hacking node (and optionally a specified hack) in the hacking UI when a specific condition is met",
		Attributes = {
			Active = {"Expression -> boolean", "When true, an objective marker will be placed on a specified hacking node and hack in the hacking UI"},
			HackDesc = {"CustomString", "The DescriptionKey of the hack that will be marked"},
			IncludeTraversal = {"boolean", "If true, the Traversal hack on the target node will also have an objective marker"},
			NodeId = {"number", "The network node ID of the device to apply the marker to in the hacking UI"},
			ObjectiveType = {"number", "The type of objective marker to place; 1 for Main, 2 for Stealth, 3 for Combat, 4 for Intel (large), 5+ for Intel (small)"},
		}
	},
	HackingNodeStatus = {
		HelpText = "Reports on the status of a specified network node",
		Attributes = {
			CompromisedVariable = {"string", "The name of the variable whose value will be set to true when the specified node is compromised"},
			DisabledVariable = {"string", "The name of the variable whose value will be set to true when the specified node is disabled"},
			NetworkId = {"number", "The network node ID of the device to check the status of"},
		},
	},
	HiddenShuffle = {
		HelpText = "Creates a biased shuffle for randomized FreeTrigger and HiddenWallSafe props",
		Attributes = {
			BackCount = {"number", "The amount of padding at the end of the player's search; the player will always succeed in their search before they reach this many searches before the end"},
			ClientFailCountVariable = {"string", "The name of the local variable whose value will be set to the amount of times the local player has had a failed check in this shuffle"},
			FailCountVariable = {"string", "The name of the variable whose value will be set to the amount of times all players have had a failed check in this shuffle"},
			FrontCount = {"number", "The amount of padding at the start of the player's search; the player will only succeed in their search after they've already searched this many times"},
			HiddenShuffleId = {"string", "The ID to pair with a set randomized FreeTriggers or HiddenWallSafes"},
			RevealAllCondition = {"Expression -> boolean", "When true, the position of the correct search will be locked into place, and HiddenWallSafes will have their photos taken away"},
			RevealCount = {"number", "The amount of searches that count as successful included in the shuffle"},
			RevealCountVariable = {"string", "The name of the variable whose value will be set to the amount of times all players have had a successful check in this shuffle"},
			Seed = {"number", "The seed number used for shuffling"},
		},
	},
	IntelCharacterPortrait = {
		HelpText = "Adds an image of a specified bot as a node to the intel map that is visible when a specific condition is met",
		Attributes = {
			BackgroundColor = {"string", "The color of the background of the portrait, represented using a hex code (no hashtag)"},
			ClientTag = {"string", "The client-side tag of the bot to create a render of; portrait instead shows the text \"UNKNOWN APPEARANCE\" if no tag is provided"},
			HiddenColor = {"string", "The color of the background of the portrait when no ClientTag is set, represented using a hex code (no hashtag)"},
			IntelNodeId = {"string", "The unique identifier for this intel map node"},
			Visible = {"Expression -> boolean", "When true, this intel map node will be visible on the intel map"},
		},
	},
	IntelConnection = {
		HelpText = "Creates a link between two specified nodes on the intel map when a specific condition is met",
		Attributes = {
			Link0 = {"string", "The IntelNodeId of the first intel map node to link"},
			Link1 = {"string", "The IntelNodeId of the second intel map node to link"},
			Visible = {"Expression -> boolean", "When true, this connection will be visible on the intel map"},
		},
	},
	IntelPrimaryText = {
		HelpText = "Adds a text label as a node to the intel map that is visible when a specific condition is met",
		Attributes = {
			BackgroundColor = {"Color", "The color of the background of the node; can be represented using a hex code (no hashtag) or a Color3"},
			IntelNodeId = {"string", "The unique identifier for this intel map node"},
			Text = {"CustomString", "The text to display on the node"},
			Visible = {"Expression -> boolean", "When true, this intel map node will be visible on the intel map"},
		},
	},
	IntelSubText = {
		HelpText = "Adds a text label beneath an intel map node to the intel map that is visible when a specific condition is met",
		Attributes = {
			IntelNodeId = {"string", "The IntelNodeId of the intel map node to put this IntelSubText under"},
			LayoutOrder = {"Expression -> number", "Determines display order relative to other IntelSubText nodes; the one with the lowest value will appear on top"},
			Text = {"CustomString", "The text to display on the node"},
			Uppercase = {"boolean", "If true, the text will be displayed in uppercase"},
			Visible = {"Expression -> boolean", "When true, this intel map node will be visible on the intel map"},
		},
	},
	ItemStateTracker = {
		HelpText = "Tracks the status(es) of item(s) with a specified tag",
		Attributes = {
			BotHeldCountVariable = {"string", "The name of the variable whose value will be set to the amount of items with the specified tag carried by bots"},
			ClientHeldCountVariable = {"string", "The name of the local variable whose value will be set to the amount of items with the specified tag carried by the local player"},
			GroundCountVariable = {"string", "The name of the variable whose value will be set to the amount of items with the specified tag that are loose throughout the mission"},
			ItemTag = {"string", "The item tag to track"},
			TotalHeldCountVariable = {"string", "The name of the variable whose value will be set to the amount of items with the specified tag that are being carried by players"},
		},
	},
	ItemSwapCondition = {
		HelpText = "Swaps out item(s) with a specified tag out for a different item when a specific condition is met",
		Attributes = {
			Condition = {"Expression -> boolean", "When true, this ItemSwapCondition will be activated"},
			SwapItemTag = {"string", "The item tag that the new item will have"},
			SwapItemType = {"string", "The item that the new item will be"},
			TargetItemTag = {"string"," The item tag that is the target of the swap"},
		},
	},
	LerpOperation = {
		HelpText = "Performs linear interpolation between two numbers",
		Attributes = {
			AlwaysUpdate = {"boolean", "If true, the output variable will be updated whenever the input values are updated"},
			Delta = {"Expression -> number", "The percentage of the input values to use"},
			OutputVariable = {"string", "The name of the variable whose value will be the output for the operation"},
			UpdateClock = {"Expression -> number", "Can be used if AlwaysUpdate is false; updates the output value whenever this value is updated"},
			Value0 = {"Expression -> number", "The first value to input for the operation"},
			Value1 = {"Expression -> number", "The second value to input for the operation"},
		},
	},
	LocalChat = {
		HelpText = "Starts a specified dialogue for the client when a specific condition is met",
		Attributes = {
			Active = {"Expression -> boolean", "When true, the specified dialogue will play"},
			CombatOnly = {"boolean", "If true, the dialogue will only trigger during Loud"},
			DelayStart = {"number", "The amount of time that it takes, in seconds, for the dialogue to be triggered after the Active condition is met"},
			Dialogue = {"string", "The name of the dialogue table to be triggered"},
			Replicate = {"boolean", "If true, this dialogue will display to all players, using the codename of the player who triggered it as the operative speaker name"},
			StealthOnly = {"boolean", "If true, the dialogue will only trigger during Stealth"},
			TriggerOnce = {"boolean", "If true, the dialogue will only be triggered once"},
		},
	},
	LocalWeaponTracker = {
		HelpText = "Tracks the status of the local player's equipped weapon",
		Attributes = {
			HoldingWeaponVariable = {"string", "The name of the local variable whose value will be set to true when the local player is holding a weapon"},
			LoadedAmmoVariable = {"string", "The name of the local variable whose value will be set to the amount of ammo the local player has loaded in their weapon"},
			TotalAmmoVariable = {"string", "The name of the local variable whose value will be set to the total amount of ammo the local player has for their weapon"},
		}
	},
	LocationCard = {
		HelpText = "Shows a card with a title and subtitle on-screen when a specific condition is met",
		Attributes = {
			Active = {"Expression -> boolean", "When true, this LocationCard will activate"},
			Subtitle = {"CustomString", "The subtitle to show on the card"},
			Title = {"CustomString", "The title to show on the card"},
		},
	},
	MissionCompletionTrigger = {
		HelpText = "Ends the mission as a successful completion when a specific condition is met",
		Attributes = {
			CompleteVariable = {"string", "The name of the variable whose value will be set to true when this MissionCompleteTrigger is activated"},
			Condition = {"Expression -> boolean", "When true, the mission will be completed"},
			Timeout = {"number", "The amount of time, in seconds, that Condition must be true to trigger the mission completion"},
		}
	},
	MissionFailedTrigger = {
		HelpText = "Ends the mission as a failure when a specific condition is met",
		Attributes = {
			FailedVariable = {"string", "The name of the variable whose value will be set to true when this MissionFailedTrigger is activated"},
			Condition = {"Expression -> boolean", "When true, the mission will fail"},
			Timeout = {"number", "The amount of time, in seconds, that Condition must be true to trigger the failure of the mission"},
		}
	},
	MusicController = {
		HelpText = "Plays specified background music based on a priority stack",
		Attributes = {
			ActivePriority = {"Expression -> number", "The priority value for this MusicController; the MusicController with the highest priority value will play its music"},
			MusicType = {"string", "Currently non-functional"},
			NoLoop = {"boolean", "If true, the music played by this MusicController will not loop when it is finished playing"},
			PersistOnReload = {"boolean", "If true, the music played by this MusicController will not restart after the mission is restarted"},
			TrackId = {"string", "The asset ID of the audio to be played as background music by this MusicController"},
			Volume = {"number", "The volume of the music played by this MusicController, as a decimal between zero and one"},
		},
	},
	NetworkRouter = {
		HelpText = "Adds an informational node to the hacking map attached to a specified node showing that off-site camera monitoring starts at the attached node",
		Attributes = {
			NetworkId = {"number", "The network node ID of this node"},
			NetworkLink = {"number", "The network node ID of the device to connect this node to"},
		},
	},
	Notification = {
		HelpText = "Notifies the player with specified text at the top of their screen when a specific condition is met",
		Attributes = {
			Condition = {"Expression -> boolean", "When true, the notification is displayed to the player"},
			Notification = {"CustomString", "The text of the notification to be displayed"},
		},
	},
	RandomBotSpawner = {
		HelpText = "Spawns random bots at RandomBotSpawnLocation props when a specific condition is met",
		Attributes = {
			Behavior = {"string", "The behavior used by spawned bots; can be PatrolWalk, WorkWithBreaks, Bodyguard, or PassingCivilian"},
			CivilianHighlight = {"boolean", "If true, spawned bots will be highlighted white when marked"},
			Class = {"string", "The class of spawned bots determining what areas they may enforce trespassing in"},
			DetectionSpeed = {"number", "The multiplier for how fast spawned bots will detect players they can detect"},
			EnforceClass = {"string", "The name of the EnforceClass table used by spawned bots"},
			HostageDifficulty = {"number", "The level of Intimidation required to take spawned bots hostage"},
			Nodes = {"string", "The name of the nodes folder spawned bots use if the PatrolWalk, WorkWithBreaks, or Bodyguard behaviors are used"},
			NodesBreak = {"string", "The name of the nodes folder used when spawned bots go on break if the WorkWithBreaks behavior is used"},
			ObjectiveHighlight = {"boolean", "If true, spawned bots will be highlighted purple when marked"},
			Outfit = {"string", "The preset outfit used by spawned bots (use CivilianOutfit for random civilian outfits)"},
			Profile = {"string", "The profile spawned bots use to determine certain behaviors"},
			SpawningActive = {"Expression -> boolean", "When true, random bots may spawn"},
			SpawnTimeMin = {"number", "The minimum amount of time, in seconds, before a new random bot is spawned"},
			SpawnTimeMax = {"number", "The maximum amount of time, in seconds, before a new random bot is spawned"},
			Title = {"CustomString", "The title of spawned bots shown in conversations and body prompts"},
			Weapon = {"string", "The weapon spawned bots have on them"},
		},
	},
	ReinforcementPool = {
		HelpText = "Defines and supplies enemy wave amounts for CombatSpawner and CoverFillSpawner StateComponents",
		Attributes = {
			ActiveVariable = {"string", "The name of the variable whose value will be set to the number of units from this pool currently fighting players"},
			PoolLimit = {"Expression -> number", "Defines the number of units in a combat unit pool"},
			PoolName = {"string", "The name of the pool referenced by CombatSpawner StateComponents"},
			RemainingVariable = {"string", "The name of the variable whose value will be set to the number of currently active units spawned from this pool plus the number of units still available in this pool"},
			WaveResetMaxTime = {"Expression -> number", "To be used with WaveResetThreshold; the maximum amount of time in seconds before the enemy wave resets regardless of how many enemies are still remaining"},
			WaveResetThreshold = {"number", "If set, the maximum number of units from this pool that can be alive before the pool's wave reset timer starts"},
			WaveResetTime = {"Expression -> number", "The amount of time it takes, in seconds, for the reinforcement pool to fill back up with units after the last unit from the pool is sent out"},
			WaveResetTimeDecrease = {"number", "The amount of time the reset time for the pool decreases, in seconds, every time the pool is reset"},
			WaveResetTimeMinimum = {"number", "The minimum amount of time the pool reset time can go down to, in seconds"},
			WaveStateVariable = {"string", "Currently non-functional"},
			WaveVariable = {"string", "The name of the variable whose value is set to the current wave number the pool is on"},
		},
	},
	ScriptedBotSpawn = {
		HelpText = "Spawns a specified bot template into the mission when a specific condition is met",
		Attributes = {
			Condition = {"Expression -> boolean", "When true, the specified bot template will be spawned into the mission"},
			TemplateId = {"string", "The name of the bot template within the BotTemplates folder to spawn"},
		}
	},
	ScriptedTakedown = {
		HelpText = "Knocks out or kills specified bot(s) when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag to affect"},
			Lethal = {"boolean", "If true, affected bot(s) will be killed rather than knocked unconscious"},
			Trigger = {"Expression -> boolean", "When true, this ScriptedTakedown will activate"},
		},
	},
	SearchPatternCondition = {
		HelpText = "Triggers specified bots to begin roaming the nodes defined in their SearchArea attribute when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The server-side bot tag targeted by the SearchPatternCondition"},
			Condition = {"Expression -> boolean", "When true, specified bots will begin roaming their SearchArea nodes"},
			Pace = {"number", "The speed at which searching bots will move; 1 is normal, 2 is super fast walking, 3 is running, 4 is fast walking, and anything else is a complete stop"},
			UseWeapon = {"boolean", "If true, searching bots will hold their weapon out while walking and become immune to intimidation"},
		},
	},
	SniperSpawner = {
		HelpText = "Spawns SWAT snipers at specified nodes when a specific condition is met",
		Attributes = {
			Active = {"Expression -> boolean", "When true, snipers will begin spawning"},
			InitialSpawns = {"number", "The initial number of snipers to spawn as soon as they become active"},
			Nodes = {"string", "The name of the folder of nodes to spawn snipers on"},
			RespawnRate = {"number", "The time it takes, in seconds, for snipers to respawn after being killed"},
		},
	},
	StandardRadioAlertReduction = {
		HelpText = "Adds alert reduction prompts to the RadioCall dialogue tree, the dialogue tree accessed by using a radio item",
		Attributes = {
			AlertReductionDifficulty = {"Expression -> number", "The level of Social Engineering required to reduce the alert level by 1"},
			AlertReductionDisabled = {"Expression -> bool", "When true, reducing the alert level using the radio is disabled"},
			AlertResetDifficulty = {"Expression -> number", "The level of Social Engineering required to completely reset the alert level to Calm (overrides alert reduction prompt if the alert reset requirement is met)"},
		},
	},
	StateLock = {
		HelpText = "Upon a specified expression's value being set to a truthy value for the first time, sets another variable's value to that value",
		Attributes = {
			SetInternal = {"string", "The internal variable to set to Watch's value upon Watch being set to a truthy value"},
			SetVariable = {"string", "The global variable to set to Watch's value upon Watch being set to a truthy value"},
			Watch = {"Expression", "The expression to watch for change and copy the value of"},
		},
	},
	StateScript = {
		HelpText = "Executes custom code within the limits of the StateScript language",
		Attributes = {
			Run = {"Expression -> boolean", "When true, this StateScript will begin running, and will stop when this value is false; generally shouldn't be used alongside the TriggerEvent attribute"},
			ScriptSource = {"StateScript", "The StateScript code to run; for more information on StateScripts, read the documentation or wiki page"},
			TriggerEvent = {"Expression -> boolean", "When updated with a non-zero value, a new instance of the StateScript will be executed; generally shouldn't be used alongside the Run attribute"},
		},
	},
	StateUpdate = {
		HelpText = "Watches a specified variable for a change in its value; after a change is made to the variable, another specified variable will be set to the variable's value",
		Attributes = {
			SetInternal = {"string", "The name of an internal variable to be changed"},
			SetVariable = {"string", "The name of a global variable to be changed"},
			Watch = {"string", "The name of the variable that will be watched for updates and copied over to specified variables"},
		},
	},
	TimerComponent = {
		HelpText = "Activates a custom, modifiable timer",
		Attributes = {
			Enabled = {"Expression -> boolean", "When true, the timer will be activated"},
			Frequency = {"Expression -> number", "The amount of time between timer ticks, in seconds; defaults to 1"},
			Increment = {"Expression -> number", "The amount the timer value is incremented or decremented every timer tick"},
			Offset = {"Expression -> number", "The amount the timer value is offset by"},
			Paused = {"Expression -> boolean", "When true, the timer will stop ticking"},
			SetFormattedVariable = {"string", "The name of the variable whose value will be set to the amount of time remaining on the timer, formatted as XX:XX"},
			SetVariable = {"string", "The name of the variable that will be used to store the timer value"},
			StartValue = {"Expression -> number", "The starting value of the timer when it is first activated"},
			TargetValue = {"Expression -> number", "The value that the timer will stop at when it is reached"},
		},
	},
	VariableShuffle = {
		HelpText = "Given Prefix0 and Prefix1, as well as two specified sets of values Set0 and Set1, shuffles the values of each set, then pairs values of each set with their corresponding prefix to create a set of variable names and pairs values of each set with the new variables of the opposite prefix to create the values for the variables such that for every Prefix0X that has a value of Y, there is a Prefix1Y that has a value of X",
		Attributes = {
			InternalOnly = {"boolean", "If true, created variables will be stored as internals"},
			Prefix0 = {"string", "The first variable prefix to use"},
			Prefix1 = {"string", "The second variable prefix to use"},
			Seed = {"Expression -> number", "The seed number to use for randomization"},
			Set0 = {"string", "The first set of values to use, with each value separated by a bar (|)"},
			Set1 = {"string", "The second set of values to use, with each value separated by a bar (|)"},
		},
	},
}

return components
