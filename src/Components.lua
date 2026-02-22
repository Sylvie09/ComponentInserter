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
			BotServerTag = {"string", "The bot tag that the CustomBehavior will apply to"},
			CustomBehavior = {"CustomBehavior", "The CustomBehavior to apply; for more information on CustomBehavior, consult the documentation"},
		},
	},
	AlertRaiseCondition = {
		HelpText = "Raises the alert level when a specific condition is met",
		Attributes = {
			Amount = {"number", "The amount that the alert level will raise"},
			Condition = {"Expression", "When true, this AlertRaiseCondition will activate"},
			MaxValue = {"number", "The maximum value this AlertRaiseCondition can raise the alert level to"},
			MinValue = {"number", "The minimum value this AlertRaiseCondition can raise the alert level to"},
			Reason = {"CustomString", "The notification text that will appear when this AlertRaiseCondition activates"},
		},
	},
	AutoConversationTrigger = {
		HelpText = "Makes specified bot(s) forcefully trigger a conversation with the player when they are in range and a specific condition is met",
		Attributes = {
			Active = {"Expression", "When true, specified bot(s) will attempt to trigger a conversation with the player when they are nearby"},
			BotClientTag = {"string", "The client-side bot tag to affect"},
		}
	},
	BlackoutScreen = {
		HelpText = "Fades out the player's view to a dark screen when a specified condition is true",
		Attributes = {
			Active = {"Expression", "When true, the player's screen is covered in darkness"},
			Speed = {"number", "The amount of time that it takes, in seconds, for the dark screen to fade in and out"},
		},
	},
	BodyAltTrigger = {
		HelpText = "Adds an alternate (G) interaction trigger to the dead or unconscious body/bodies of specified bot(s)",
		Attributes = {
			BotClientTag = {"string", "The client-side bot tag to apply the trigger to"},
			BotServerTag = {"string", "The server-side bot tag to apply the trigger to"},
			ClientVisible = {"Expression", "When false, the local player will not be able to see or interact with the trigger"},
			HoldTime = {"number", "The amount of time the trigger must be held, in seconds, to complete"},
			ServerEnabled = {"Expression", "When false, no player will be able to see or interact with the trigger"},
			SubtitleKey = {"CustomString", "The text to display under the title text of the trigger"},
			TitleKey = {"CustomString", "The large text to display on the trigger"},
			TriggerLocalNotification = {"CustomString", "The notification to display to the player who interacts with the trigger"},
			TriggerNotification = {"CustomString", "The notification to display to all players when the trigger is interaction with"},
			TriggerVariable = {"string", "The name of the variable to increment when the trigger is interacted with"},
		},
	},
	BotAltTrigger = {
		HelpText = "Adds an alternate (G) interaction trigger to specified bot(s)",
		Attributes = {
			AllowHostages = {"boolean", "Applies this trigger to specified bots who are hostages"},
			AllowPatroling = {"boolean", "Applies this trigger to specified bots who are not pacified (yes there is a typo in the attribute name)"},
			BotClientTag = {"string", "The client-side bot tag to apply the trigger to"},
			BotServerTag = {"string", "The server-side bot tag to apply the trigger to"},
			ClientVisible = {"Expression", "When false, the local player will not be able to see or interact with the trigger"},
			HoldTime = {"number", "The amount of time the trigger must be held, in seconds, to complete"},
			ServerEnabled = {"Expression", "When false, no player will be able to see or interact with the trigger"},
			SubtitleKey = {"CustomString", "The text to display under the title text of the trigger"},
			TitleKey = {"CustomString", "The large text to display on the trigger"},
			TriggerLocalNotification = {"CustomString", "The notification to display to the player who interacts with the trigger"},
			TriggerNotification = {"CustomString", "The notification to display to all players when the trigger is interaction with"},
			TriggerVariable = {"string", "The name of the variable to increment when the trigger is interacted with"},
		},
	},
	BotItemSpawn = {
		HelpText = "Spawns an item into the inventory of specified bot(s) when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The bot tag to affect"},
			Condition = {"Expression", "When true, activates the BotItemSpawn"},
			Item = {"string", "The item to give"},
			ItemTag = {"string", "The item tag to apply to the given item"},
		},
	},
	BotStateTracker = {
		HelpText = "Tracks the status(es) of specified bot(s)",
		Attributes = {
			BotServerTag = {"string", "The bot tag for this trigger to track"},
			DeathCountVariable = {"string", "The name of the variable whose value will be set to the amount of dead bots with the specified tag"},
			FleeCountVariable = {"string", "The name of the variable whose value will be set to the amount of fleeing bots with the specified tag"},
			HostageCountVariable = {"string", "The name of the variable whose value will be set to the amount of bots held hostage with the specified tag"},
			IncapacitationCountVariable = {"string", "The name of the variable whose value will be set to the amount of dead, hostage, and unconscious bots with the specified tag"},
			TotalCountVariable = {"string", "The name of the variable whose value will be set to the total amount of bots with the specified tag"},
		},
	},
	CombatSpawner = {
		HelpText = "Spawns enemies in combat based on various specified parameters",
		Attributes = {
			Active = {"Expression", "When true, allows this CombatSpawner to function"},
			AllowDespawn = {"boolean", "If true, allows combat enemies spawned to despawn (usually, you should keep this at true)"},
			CustomCombatData = {"string", "The name of a table in the CustomCombatData table to pull unit stats from"},
			EnemyType = {"string", "Defines the type (outfit) of enemies spawned, such as Swat, Palisade, Criminal, and HalcyonOperator"},
			EnemyWeapons = {"string", "The pool of weapons enemies can spawn with, with each weapon name being separated by a bar (|); use duplicate entries to increase the chances of specific weapons being spawned"},
			["EnemyWeaponsWave(1-9)"] = {"string", "A new attribute can be set for numbers 1 through 9; has the same formatting as EnemyWeapons, and overrides EnemyWeapons for specific waves", true},
			FlowMap = {"string", "The name of the CombatFlowMap to tie enemies to"},
			ReinforcementPool = {"string", "The name of the ReinforcementPool StateComponent to use to further define enemy spawns"},
			SpawnCap = {"Expression", "The maximum number of combat units that can be alive at the same time"},
			SpawnsBlockedVariable = {"string", "The name of the variable that will be set to true if all possible spawn locations for enemies are unable to spawn units"},
			SpawnSquads = {"boolean", "If true, enemies will spawn in squads of up to 3 units at a time"},
			SpawnTags = {"string", "Determines which combat spawners enemies will spawn at"},
			TimeBetweenSpawns = {"Expression", "The amount of time between enemy spawns, in seconds"}
		},
	},
	ConditionalStateUpdate = {
		HelpText = "Watches a specified variable for a change to a truthy value; after a change is made to the variable, another specified variable will be incremented depending on whether or not a specific condition is true",
		Attributes = {
			ActiveVariable = {"string", "The name of the variable to be incremented after the Watch variable is updated if Condition is true"},
			Condition = {"Expression", "The condition that must be true for ActiveVariable to be set once Watch is updated"},
			InactiveVariable = {"string", "The name of the variable to be incremented after the Watch variable is updated if Condition is false"},
			Watch = {"string", "The name of the variable that will be watched for updates"},
		},
	},
	ConversationGenericSocialEngineering = {
		HelpText = "Defines a Social Engineering conversation prompt for specified bot(s)",
		Attributes = {
			BotServerTag = {"string", "The bot tag to apply the conversation prompt to"},
			Dialogue = {"CustomString", "A single dialogue string for the player's operator to say"},
			Disguise = {"string", "The disguise the player must wear to use the prompt"},
			Icon = {"string", "The icon for the prompt to display; can choose from: ChatCancel, ChatGeneric, ChatOpenDoor, ChatGoBack, ChatIntimidate, ChatLocked, and ChatArrow"},
			IntimidationLevel = {"Expression", "The level of Intimidation required to use this prompt"},
			Label = {"CustomString", "The small dialogue sample to display after the prompt's Text value and perk requirements"},
			Notification = {"CustomString", "The notification text to display to the player after using the prompt"},
			NotificationDelay = {"number", "The time delay, in seconds, between using the prompt and receiving the notitification, if one is set"},
			SetVariable = {"string", "The name of the variable to increment after using this prompt"},
			SocialEngineeringLevel = {"Expression", "The level of Social Engineering required to use the prompt"},
			Text = {"CustomString", "The text to display on the prompt"},
			Visible = {"Expression", "When false, this prompt will be invisible and uninteractable to players"},
		},
	},
	ConversationResponseCustomBehavior = {
		HelpText = "Defines a Social Engineering conversation prompt for specified bot(s) that apply a CustomBehavior to the bot(s)",
		Attributes = {
			BotServerTag = {"string", "The bot tag to apply the conversation prompt to"},
			CustomBehavior = {"CustomBehavior", "The CustomBehavior to apply; for more information on CustomBehavior, consult the documentation"},
			Dialogue = {"CustomString", "A single dialogue string for the player's operator to say"},
			DisableReason = {"Expression", "An expression returning a CustomString key if the prompt should be disabled"},
			SocialEngineeringLevel = {"Expression", "The level of Social Engineering required to use the prompt"},
		}
	},
	CustomBehaviorCondition = {
		HelpText = "Applies a CustomBehavior to bots with a specified tag when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The bot tag the CustomBehavior will apply to"},
			Condition = {"Expression", "When true, applies the CustomBehavior to the specified bot(s)"},
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
			DeployTime = {"number", "The amount of ticks this hack takes to deploy; ticks go by at a rate of four per second in Stealth and one per second in Loud"},
			DescriptionKey = {"CustomString", "The text to display when the hack is hovered over in the hacking UI, formatted as \"TITLE - Short action description\""},
			Difficulty = {"number", "The level of Advanced Protocols needed to deploy the hack"},
			DisableReason = {"Expression", "An expression returning a CustomString key if the hack should be disabled; the hack will be visible but uninteractable"},
			IconId = {"string", "The asset ID of the icon to display for the hack in the hacking UI"},
			IsDeployedVariable = {"string", "The name of the variable whose value will be set to true when the hack is currently allocated"},
			NameKey = {"CustomString", "The title text of the hack shown in the allocation list, as well as, if the hack is a primary hack, the interaction prompt"},
			NodeId = {"number", "The network node ID of the device the hack can be deployed on"},
			PauseCondition = {"Expression", "When true, progress on the hack being deployed will be paused"},
			PrimaryHack = {"boolean", "If true, the hack may be deployed without a hacking tablet through directly interacting with the device the hack may be deployed on"},
			Priority = {"number", "The priority of which hack should be shown first as a primary hack interaction prompt, should multiple primary hacks be linked to the same device; a higher number means higher priority"},
			ProgressVariable = {"string", "The name of the variable whose value will be set to a decimal representing the deployment progress of the hack"},
			ScriptedBehavior = {"string", "This attribute currently has no use"},
			SubtitleKey = {"CustomString", "The text to be displayed under the title text of the interacttion prompt of the hack, if the hack is a primary hack"},
			Suspicion = {"number", "The amount of hacking risk to add for every tick the hack takes to deploy"},
			Visible = {"Expression", "When false, the hack will be invisible and uninteractable for all players"},
		},
	},
	CoverFillSpawner = {
		HelpText = "Spawns enemies in combat based on various specified parameters to fill specific cover spots",
		Attributes = {
			Active = {"Expression", "When true, allows this CombatSpawner to function"},
			ActiveVariable = {"string", "The name of the variable whose value will be set to the number of currently alive enemies spawned from this CoverFillSpawner"},
			CoverSearchLimit = {"number", "The maximum number of cells away a valid cover spot can be from the spawn point of an enemy"},
			CoverTags = {"string", "The specific CoverTag of cover spots for enemies spawned from this spawner to use"},
			CustomCombatData = {"string", "The name of a table in the CustomCombatData table to pull unit stats from"},
			EnemyType = {"string", "Defines the type (outfit) of enemies spawned, such as Swat, Palisade, Criminal, and HalcyonOperator"},
			EnemyWeapons = {"string", "The pool of weapons enemies can spawn with, with each weapon name being separated by a bar (|); use duplicate entries to increase the chances of specific weapons being spawned"},
			["EnemyWeaponsWave(1-9)"] = {"string", "A new attribute can be set for numbers 1 through 9; has the same formatting as EnemyWeapons, and overrides EnemyWeapons for specific waves", true},
			FillFrequency = {"number", "The amount of time between unit spawns, in seconds"},
			ReinforcementPool = {"string", "The name of the ReinforcementPool StateComponent to use to further define enemy spawns"},
			SpawnCap = {"Expression", "The maximum number of combat units that can be alive at the same time"},
			SpawnsBlockedVariable = {"string", "The name of the variable that will be set to true if all possible spawn locations for enemies are unable to spawn units"},
			SpawnTags = {"string", "Determines which combat spawners enemies will spawn at"},
		},
	},
	DelayedStateUpdate = {
		HelpText = "Watches a specified variable for a change in its value; after a change is made to the variable, another specified variable will be incremented after a specified amount of time has passed",
		Attributes = {
			DelayTime = {"number", "The amount of time in seconds it takes for the variable set in SetVariable to be incremented after the variable set in Watch is updated"},
			OnlyMatch = {"boolean", "If false, all updates to the Watch variable will trigger individual increments to the SetVariable variable; if true, the SetVariable variable will be incremented only after the DelayTime passes with no further updates to the Watch variable"},
			SetVariable = {"string", "The name of the variable to be incremented"},
			Watch = {"string", "The name of the variable that will be watched for updates"},
		},
	},
	FileUITrigger = {
		HelpText = "Displays a paper file with custom text on the player's screen when a specific condition is met",
		Attributes = {
			Font = {"string", "The name of the font to use for the text on the file"},
			Lines = {"string", "A list of CustomStrings to be displayed on the file in a randomized order, separated by bars (|)"},
			NoExtraPaper = {"boolean", "If true, extra papers will not be displayed behind the paper file on-screen"},
			NoFolder = {"boolean", "If true, a folder will not be displayed behind the paper file on-screen"},
			ShowTape = {"boolean", "If true, tape will be shown with the paper file on-screen"},
			TextScale = {"number", "The scale of the text to be shown on the file"},
			Trigger = {"Expression", "When true, the file will be shown on the player's screen"},
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
			Active = {"Expression", "When true, an objective marker will be placed on a specified hacking node and hack in the hacking UI"},
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
			GlobalVariable = {"boolean", "This attribute is no longer in use"},
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
			RevealAllCondition = {"Expression", "When true, the position of the correct search will be locked into place, and HiddenWallSafes will have their photos taken away"},
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
			Visible = {"Expression", "When true, this intel map node will be visible on the intel map"},
		},
	},
	IntelConnection = {
		HelpText = "Creates a link between two specified nodes on the intel map when a specific condition is met",
		Attributes = {
			Link0 = {"string", "The IntelNodeId of the first intel map node to link"},
			Link1 = {"string", "The IntelNodeId of the second intel map node to link"},
			Visible = {"Expression", "When true, this connection will be visible on the intel map"},
		},
	},
	IntelPrimaryText = {
		HelpText = "Adds a text label as a node to the intel map that is visible when a specific condition is met",
		Attributes = {
			BackgroundColor = {"string", "The color of the background of the node, represented using a hex code (no hashtag)"},
			IntelNodeId = {"string", "The unique identifier for this intel map node"},
			Text = {"CustomString", "The text to display on the node"},
			Visible = {"Expression", "When true, this intel map node will be visible on the intel map"},
		},
	},
	IntelSubText = {
		HelpText = "Adds a text label beneath an intel map node to the intel map that is visible when a specific condition is met",
		Attributes = {
			IntelNodeId = {"string", "The IntelNodeId of the intel map node to put this IntelSubText under"},
			LayoutOrder = {"Expression", "Determines display order relative to other IntelSubText nodes; the one with the lowest value will appear on top"},
			Text = {"CustomString", "The text to display on the node"},
			Uppercase = {"boolean", "If true, the text will be displayed in uppercase"},
			Visible = {"Expression", "When true, this intel map node will be visible on the intel map"},
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
			Condition = {"Expression", "When true, this ItemSwapCondition will be activated"},
			SwapItemTag = {"string", "The item tag that the new item will have"},
			SwapItemType = {"string", "The item that the new item will be"},
			TargetItemTag = {"string"," The item tag that is the target of the swap"},
		},
	},
	LerpOperation = {
		HelpText = "Performs linear interpolation between two numbers",
		Attributes = {
			AlwaysUpdate = {"boolean", "If true, the output variable will be updated whenever the input values are updated"},
			Delta = {"Expression", "The percentage of the input values to use"},
			OutputVariable = {"string", "The name of the variable whose value will be the output for the operation"},
			UpdateClock = {"Expression", "Can be used if AlwaysUpdate is false; updates the output value whenever this value is updated"},
			Value0 = {"Expression", "The first value to input for the operation"},
			Value1 = {"Expression", "The second value to input for the operation"},
		},
	},
	LocalChat = {
		HelpText = "Starts a specified dialogue when a specific condition is met",
		Attributes = {
			Active = {"Expression", "When true, the specified dialogue will play"},
			CombatOnly = {"boolean", "If true, the dialogue will only trigger during Loud"},
			DelayStart = {"number", "The amount of time that it takes, in seconds, for the dialogue to be triggered after the Active condition is met"},
			Dialogue = {"string", "The name of the dialogue table to be triggered"},
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
			Active = {"Expression", "When true, this LocationCard will activate"},
			Subtitle = {"CustomString", "The subtitle to show on the card"},
			Title = {"CustomString", "The title to show on the card"},
		},
	},
	MissionCompleteTrigger = {
		HelpText = "Ends the mission as a successful completion when a specific condition is met",
		Attributes = {
			CompleteVariable = {"string", "The name of the variable whose value will be set to true when this MissionCompleteTrigger is activated"},
			Condition = {"Expression", "When true, the mission will be completed"},
			Timeout = {"number", "The amount of time, in seconds, that Condition must be true to trigger the mission completion"},
		}
	},
	MissionFailedTrigger = {
		HelpText = "Ends the mission as a failure when a specific condition is met",
		Attributes = {
			FailedVariable = {"string", "The name of the variable whose value will be set to true when this MissionFailedTrigger is activated"},
			Condition = {"Expression", "When true, the mission will fail"},
			Timeout = {"number", "The amount of time, in seconds, that Condition must be true to trigger the failure of the mission"},
		}
	},
	MusicController = {
		HelpText = "Plays specified background music based on a priority stack",
		Attributes = {
			ActivePriority = {"Expression", "The priority value for this MusicController; the MusicController with the highest priority value will play its music"},
			MusicType = {"string", "Currently non-functional"},
			NoLoop = {"boolean", "If true, the music played by this MusicController will not loop when it is finished playing"},
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
			Condition = {"Expression", "When true, the notification is displayed to the player"},
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
			SpawningActive = {"Expression", "When true, random bots may spawn"},
			SpawnTimeMin = {"number", "The minimum amount of time, in seconds, before a new random bot is spawned"},
			SpawnTimeMax = {"number", "The maximum amount of time, in seconds, before a new random bot is spawned"},
			Title = {"CustomString", "The title of spawned bots shown in conversations and body prompts"},
			Weapon = {"string", "The weapon spawned bots have on them"},
		},
	},
	ReinforcementPool = {
		HelpText = "Further defines spawns for CombatSpawner StateComponents by supplying them with waves of units",
		Attributes = {
			ActiveVariable = {"string", "The name of the variable whose value will be set to the number of units from this pool currently fighting players"},
			PoolLimit = {"Expression", "Defined the number of units in a combat unit pool"},
			PoolName = {"string", "The name of the pool referenced by CombatSpawner StateComponents"},
			RemainingVariable = {"string", "The name of the variable whose value will be set to the number of currently active units spawned from this pool plus the number of units still available in this pool"},
			WaveResetTime = {"number", "The amount of time it takes, in seconds, for the reinforcement pool to fill back up with units after the last unit from the pool is sent out"},
			WaveResetTimeDecrease = {"number", "The amount of time the reset time for the pool decreases, in seconds, every time the pool is reset"},
			WaveResetTimeMinimum = {"number", "The minimum amount of time the pool reset time can go down to, in seconds"},
			WaveStateVariable = {"string", "Currently non-functional"},
			WaveVariable = {"string", "The name of the variable whose value is set to the current wave number the pool is on"},
		},
	},
	ScriptedBotSpawn = {
		HelpText = "Spawns a specified bot template into the mission when a specific condition is met",
		Attributes = {
			Condition = {"Expression", "When true, the specified bot template will be spawned into the mission"},
			TemplateId = {"string", "The name of the bot template within the BotTemplates folder to spawn"},
		}
	},
	ScriptedTakedown = {
		HelpText = "Knocks out or kills specified bot(s) when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The bot tag to affect"},
			Lethal = {"boolean", "If true, affected bot(s) will be killed rather than knocked unconscious"},
			Trigger = {"Expression", "When true, this ScriptedTakedown will activate"},
		},
	},
	SearchPatternCondition = {
		HelpText = "Triggers specified bots to begin roaming the nodes defined in their SearchArea attribute when a specific condition is met",
		Attributes = {
			BotServerTag = {"string", "The bot tag targeted by the SearchPatternCondition"},
			Condition = {"Expression", "When true, specified bots will begin roaming their SearchArea nodes"},
		},
	},
	SniperSpawner = {
		HelpText = "Spawns SWAT snipers at specified nodes when a specific condition is met",
		Attributes = {
			Active = {"Expression", "When true, snipers will begin spawning"},
			InitialSpawns = {"number", "The initial number of snipers to spawn as soon as they become active"},
			Nodes = {"string", "The name of the folder of nodes to spawn snipers on"},
			RespawnRate = {"number", "The time it takes, in seconds, for snipers to respawn after being killed"},
		},
	},
	StateScript = {
		HelpText = "Executes custom code within the limits of the StateScript language",
		Attributes = {
			Run = {"Expression", "When true, this StateScript will begin running, and will stop when this value is false; generally shouldn't be used alongside the TriggerEvent attribute"},
			ScriptSource = {"StateScript", "The StateScript code to run; for more information on StateScripts, read the documentation or wiki page"},
			TriggerEvent = {"Expression", "When updated with a truthy value, a new instance of the StateScript will be executed; generally shouldn't be used alongside the Run attribute"},
		},
	},
	StateUpdate = {
		HelpText = "Watches a specified variable for a change in its value; after a change is made to the variable, another specified variable will be incremented",
		Attributes = {
			SetInternal = {"string", "The name of an internal variable to be incremented"},
			SetVariable = {"string", "The name of a global variable to be incremented"},
			Watch = {"string", "The name of the variable that will be watched for updates"},
		},
	},
	TimerComponent = {
		HelpText = "Activates a custom, modifiable timer",
		Attributes = {
			Enabled = {"Expression", "When true, the timer will be activated"},
			Frequency = {"Expression", "The amount of time between timer ticks, in seconds; defaults to 1"},
			Increment = {"Expression", "The amount the timer value is incremented or decremented every timer tick"},
			Offset = {"Expression", "The amount the timer value is offset by"},
			Paused = {"Expression", "When true, the timer will stop ticking"},
			SetFormattedVariable = {"string", "The name of the variable whose value will be set to the amount of time remaining on the timer, formatted as XX:XX"},
			SetVariable = {"string", "The name of the variable that will be used to store the timer value"},
			StartValue = {"Expression", "The starting value of the timer when it is first activated"},
			TargetValue = {"Expression", "The value that the timer will stop at when it is reached"},
		},
	},
	VariableShuffle = {
		HelpText = "Given Prefix0 and Prefix1, as well as two specified sets of values Set0 and Set1, shuffles the values of each set, then pairs values of each set with their corresponding prefix to create a set of variable names and pairs values of each set with the new variables of the opposite prefix to create the values for the variables such that for every Prefix0X that has a value of Y, there is a Prefix1Y that has a value of X",
		Attributes = {
			InternalOnly = {"boolean", "If true, created variables will be stored as internals"},
			Prefix0 = {"string", "The first variable prefix to use"},
			Prefix1 = {"string", "The second variable prefix to use"},
			Seed = {"Expression", "The seed number to use for randomization"},
			Set0 = {"string", "The first set of values to use, with each value separated by a bar (|)"},
			Set1 = {"string", "The second set of values to use, with each value separated by a bar (|)"},
		},
	},
}

return components
