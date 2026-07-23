--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 22 | Scripts: 0 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.ScreenGui.MainFrame
G2L["2"] = Instance.new("Frame", script.Parent);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["2"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Name"] = [[MainFrame]];
G2L["2"]["BackgroundTransparency"] = 0.9;


-- StarterGui.ScreenGui.MainFrame.Title
G2L["3"] = Instance.new("TextLabel", G2L["2"]);
G2L["3"]["TextWrapped"] = true;
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["TextSize"] = 14;
G2L["3"]["TextScaled"] = true;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Size"] = UDim2.new(1, 0, 0, 25);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Component Inserter]];
G2L["3"]["LayoutOrder"] = 1;
G2L["3"]["Name"] = [[Title]];


-- StarterGui.ScreenGui.MainFrame.UIListLayout
G2L["4"] = Instance.new("UIListLayout", G2L["2"]);
G2L["4"]["Padding"] = UDim.new(0, 5);
G2L["4"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ScreenGui.MainFrame.ComponentList
G2L["5"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["5"]["Active"] = true;
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["Name"] = [[ComponentList]];
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["Size"] = UDim2.new(1, 0, 1, -70);
G2L["5"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Position"] = UDim2.new(0.08564, 0, 0.07949, 0);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["ScrollBarThickness"] = 10;
G2L["5"]["LayoutOrder"] = 3;
G2L["5"]["BackgroundTransparency"] = 0.98;


-- StarterGui.ScreenGui.MainFrame.ComponentList.UIListLayout
G2L["6"] = Instance.new("UIListLayout", G2L["5"]);
G2L["6"]["Padding"] = UDim.new(0, 2);


-- StarterGui.ScreenGui.MainFrame.ComponentTemplate
G2L["7"] = Instance.new("Frame", G2L["2"]);
G2L["7"]["Visible"] = false;
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(34, 36, 42);
G2L["7"]["Size"] = UDim2.new(1, -10, 0, 35);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Name"] = [[ComponentTemplate]];


-- StarterGui.ScreenGui.MainFrame.ComponentTemplate.ComponentName
G2L["8"] = Instance.new("TextButton", G2L["7"]);
G2L["8"]["TextWrapped"] = true;
G2L["8"]["RichText"] = true;
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["TextSize"] = 14;
G2L["8"]["TextScaled"] = true;
G2L["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(130, 130, 130);
G2L["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["8"]["BackgroundTransparency"] = 0.65;
G2L["8"]["Size"] = UDim2.new(1, -35, 0, 35);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Name"] = [[ComponentName]];


-- StarterGui.ScreenGui.MainFrame.ComponentTemplate.HelpButton
G2L["9"] = Instance.new("TextButton", G2L["7"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["TextStrokeTransparency"] = 0;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 14;
G2L["9"]["TextScaled"] = true;
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(162, 110, 231);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["BackgroundTransparency"] = 0.65;
G2L["9"]["Size"] = UDim2.new(0, 35, 1, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[?]];
G2L["9"]["Name"] = [[HelpButton]];
G2L["9"]["Position"] = UDim2.new(1, -35, 0, 0);


-- StarterGui.ScreenGui.MainFrame.HelpHeader
G2L["a"] = Instance.new("Frame", G2L["2"]);
G2L["a"]["Visible"] = false;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["Size"] = UDim2.new(1, 0, 0, 35);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Name"] = [[HelpHeader]];
G2L["a"]["LayoutOrder"] = 2;
G2L["a"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.MainFrame.HelpHeader.ComponentTitle
G2L["b"] = Instance.new("TextLabel", G2L["a"]);
G2L["b"]["TextWrapped"] = true;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["TextSize"] = 14;
G2L["b"]["TextScaled"] = true;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33);
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["Size"] = UDim2.new(1, -70, 1, 0);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[Component]];
G2L["b"]["LayoutOrder"] = 1;
G2L["b"]["Name"] = [[ComponentTitle]];
G2L["b"]["Position"] = UDim2.new(0, 35, 0, 0);


-- StarterGui.ScreenGui.MainFrame.HelpHeader.BackButton
G2L["c"] = Instance.new("TextButton", G2L["a"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["TextStrokeTransparency"] = 0;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextScaled"] = true;
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(130, 130, 130);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["BackgroundTransparency"] = 0.65;
G2L["c"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[X]];
G2L["c"]["Name"] = [[BackButton]];


-- StarterGui.ScreenGui.MainFrame.HelpScroll
G2L["d"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["d"]["Visible"] = false;
G2L["d"]["Active"] = true;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["CanvasSize"] = UDim2.new(0, 0, 0, 1600);
G2L["d"]["Name"] = [[HelpScroll]];
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["Size"] = UDim2.new(1, 0, 1, -70);
G2L["d"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Position"] = UDim2.new(0.08564, 0, 0.07949, 0);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["ScrollBarThickness"] = 10;
G2L["d"]["LayoutOrder"] = 3;
G2L["d"]["BackgroundTransparency"] = 0.98;


-- StarterGui.ScreenGui.MainFrame.HelpScroll.TextLabel
G2L["e"] = Instance.new("TextLabel", G2L["d"]);
G2L["e"]["TextWrapped"] = true;
G2L["e"]["TextStrokeTransparency"] = 0.5;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["TextSize"] = 18;
G2L["e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["e"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["RichText"] = true;
G2L["e"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["e"]["Size"] = UDim2.new(1, -20, 1, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);


-- StarterGui.ScreenGui.MainFrame.SearchHeader
G2L["f"] = Instance.new("Frame", G2L["2"]);
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Size"] = UDim2.new(1, 0, 0, 35);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Name"] = [[SearchHeader]];
G2L["f"]["LayoutOrder"] = 2;
G2L["f"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.MainFrame.SearchHeader.SettingsButton
G2L["10"] = Instance.new("TextButton", G2L["f"]);
G2L["10"]["TextWrapped"] = true;
G2L["10"]["TextStrokeTransparency"] = 0;
G2L["10"]["BorderSizePixel"] = 0;
G2L["10"]["TextSize"] = 14;
G2L["10"]["TextScaled"] = true;
G2L["10"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["10"]["BackgroundColor3"] = Color3.fromRGB(130, 130, 130);
G2L["10"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["10"]["BackgroundTransparency"] = 0.65;
G2L["10"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["10"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["10"]["Text"] = [[+]];
G2L["10"]["Name"] = [[SettingsButton]];


-- StarterGui.ScreenGui.MainFrame.SearchHeader.Search
G2L["11"] = Instance.new("TextBox", G2L["f"]);
G2L["11"]["Name"] = [[Search]];
G2L["11"]["BorderSizePixel"] = 0;
G2L["11"]["TextWrapped"] = true;
G2L["11"]["TextSize"] = 14;
G2L["11"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["11"]["TextScaled"] = true;
G2L["11"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33);
G2L["11"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["11"]["PlaceholderText"] = [[Search...]];
G2L["11"]["Size"] = UDim2.new(1, -70, 1, 0);
G2L["11"]["Position"] = UDim2.new(0, 35, 0, 0);
G2L["11"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["11"]["Text"] = [[]];
G2L["11"]["LayoutOrder"] = 2;


-- StarterGui.ScreenGui.MainFrame.SettingTemplate
G2L["12"] = Instance.new("Frame", G2L["2"]);
G2L["12"]["Visible"] = false;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(34, 36, 42);
G2L["12"]["Size"] = UDim2.new(1, -10, 0, 110);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["12"]["Name"] = [[SettingTemplate]];


-- StarterGui.ScreenGui.MainFrame.SettingTemplate.SettingName
G2L["13"] = Instance.new("TextButton", G2L["12"]);
G2L["13"]["TextWrapped"] = true;
G2L["13"]["Interactable"] = false;
G2L["13"]["RichText"] = true;
G2L["13"]["BorderSizePixel"] = 0;
G2L["13"]["TextSize"] = 20;
G2L["13"]["AutoButtonColor"] = false;
G2L["13"]["TextScaled"] = true;
G2L["13"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["13"]["BackgroundColor3"] = Color3.fromRGB(130, 130, 130);
G2L["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["13"]["BackgroundTransparency"] = 0.65;
G2L["13"]["Size"] = UDim2.new(1, 0, 0, 55);
G2L["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["13"]["Text"] = [[Setting]];
G2L["13"]["Name"] = [[SettingName]];


-- StarterGui.ScreenGui.MainFrame.SettingTemplate.ButtonFrame
G2L["14"] = Instance.new("Frame", G2L["12"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(34, 36, 42);
G2L["14"]["Size"] = UDim2.new(1, 0, 0, 55);
G2L["14"]["Position"] = UDim2.new(0, 0, 0, 55);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Name"] = [[ButtonFrame]];


-- StarterGui.ScreenGui.MainFrame.SettingTemplate.ButtonFrame.SettingButton
G2L["15"] = Instance.new("TextButton", G2L["14"]);
G2L["15"]["Visible"] = false;
G2L["15"]["TextWrapped"] = true;
G2L["15"]["TextStrokeTransparency"] = 0;
G2L["15"]["TextSize"] = 20;
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(162, 110, 231);
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["15"]["BorderMode"] = Enum.BorderMode.Inset;
G2L["15"]["BackgroundTransparency"] = 0.65;
G2L["15"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[Option]];
G2L["15"]["Name"] = [[SettingButton]];


-- StarterGui.ScreenGui.MainFrame.SettingTemplate.ButtonFrame.UIListLayout
G2L["16"] = Instance.new("UIListLayout", G2L["14"]);
G2L["16"]["HorizontalFlex"] = Enum.UIFlexAlignment.SpaceEvenly;
G2L["16"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
G2L["16"]["FillDirection"] = Enum.FillDirection.Horizontal;

-- StarterGui.ScreenGui.MainFrame.HelpHeader.UselessFiller
G2L["17"] = Instance.new("Frame", G2L["a"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33);
G2L["17"]["Size"] = UDim2.new(0, 35, 1, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["LayoutOrder"] = 1;
G2L["17"]["Name"] = [[UselessFiller]];
G2L["17"]["Position"] = UDim2.new(1, -35, 0, 0);

-- StarterGui.ScreenGui.MainFrame.SearchHeader.UselessFiller
G2L["17"] = Instance.new("Frame", G2L["f"]);
G2L["17"]["BorderSizePixel"] = 0;
G2L["17"]["BackgroundColor3"] = Color3.fromRGB(27, 28, 33);
G2L["17"]["Size"] = UDim2.new(0, 35, 1, 0);
G2L["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["17"]["LayoutOrder"] = 1;
G2L["17"]["Name"] = [[UselessFiller]];
G2L["17"]["Position"] = UDim2.new(1, -35, 0, 0);



return G2L["2"];