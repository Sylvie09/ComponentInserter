--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 14 | Scripts: 0 | Modules: 0 | Tags: 0
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
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(26, 27, 32);
G2L["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["3"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["3"]["Size"] = UDim2.new(1, 0, 0, 25);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Text"] = [[Component Inserter]];
G2L["3"]["LayoutOrder"] = 1;
G2L["3"]["Name"] = [[Title]];


-- StarterGui.ScreenGui.MainFrame.Search
G2L["4"] = Instance.new("TextBox", G2L["2"]);
G2L["4"]["Name"] = [[Search]];
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["TextWrapped"] = true;
G2L["4"]["TextSize"] = 14;
G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["TextScaled"] = true;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(26, 27, 32);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["PlaceholderText"] = [[Search...]];
G2L["4"]["Size"] = UDim2.new(1, 0, 0, 35);
G2L["4"]["Position"] = UDim2.new(0, 0, 0, 30);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[]];
G2L["4"]["LayoutOrder"] = 2;


-- StarterGui.ScreenGui.MainFrame.UIListLayout
G2L["5"] = Instance.new("UIListLayout", G2L["2"]);
G2L["5"]["Padding"] = UDim.new(0, 5);
G2L["5"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


-- StarterGui.ScreenGui.MainFrame.ComponentList
G2L["6"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["6"]["Active"] = true;
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["Name"] = [[ComponentList]];
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Size"] = UDim2.new(1, 0, 1, -70);
G2L["6"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Position"] = UDim2.new(0.08564, 0, 0.07949, 0);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["ScrollBarThickness"] = 10;
G2L["6"]["LayoutOrder"] = 3;
G2L["6"]["BackgroundTransparency"] = 0.98;


-- StarterGui.ScreenGui.MainFrame.ComponentList.UIListLayout
G2L["7"] = Instance.new("UIListLayout", G2L["6"]);
G2L["7"]["Padding"] = UDim.new(0, 2);


-- StarterGui.ScreenGui.MainFrame.ComponentTemplate
G2L["8"] = Instance.new("Frame", G2L["2"]);
G2L["8"]["Visible"] = false;
G2L["8"]["BorderSizePixel"] = 0;
G2L["8"]["BackgroundColor3"] = Color3.fromRGB(33, 35, 41);
G2L["8"]["Size"] = UDim2.new(1, -10, 0, 35);
G2L["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["8"]["Name"] = [[ComponentTemplate]];


-- StarterGui.ScreenGui.MainFrame.ComponentTemplate.ComponentName
G2L["9"] = Instance.new("TextButton", G2L["8"]);
G2L["9"]["TextWrapped"] = true;
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 14;
G2L["9"]["TextScaled"] = true;
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(129, 129, 129);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["9"]["BackgroundTransparency"] = 0.65;
G2L["9"]["Size"] = UDim2.new(1, -35, 0, 35);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Name"] = [[ComponentName]];


-- StarterGui.ScreenGui.MainFrame.ComponentTemplate.HelpButton
G2L["a"] = Instance.new("TextButton", G2L["8"]);
G2L["a"]["TextWrapped"] = true;
G2L["a"]["TextStrokeTransparency"] = 0;
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["TextSize"] = 14;
G2L["a"]["TextScaled"] = true;
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(161, 109, 230);
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["BackgroundTransparency"] = 0.65;
G2L["a"]["Size"] = UDim2.new(0, 35, 1, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[?]];
G2L["a"]["Name"] = [[HelpButton]];
G2L["a"]["Position"] = UDim2.new(1, -35, 0, 0);


-- StarterGui.ScreenGui.MainFrame.HelpHeader
G2L["b"] = Instance.new("Frame", G2L["2"]);
G2L["b"]["Visible"] = false;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["Size"] = UDim2.new(1, 0, 0, 35);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Name"] = [[HelpHeader]];
G2L["b"]["LayoutOrder"] = 2;
G2L["b"]["BackgroundTransparency"] = 1;


-- StarterGui.ScreenGui.MainFrame.HelpHeader.ComponentTitle
G2L["c"] = Instance.new("TextLabel", G2L["b"]);
G2L["c"]["TextWrapped"] = true;
G2L["c"]["BorderSizePixel"] = 0;
G2L["c"]["TextSize"] = 14;
G2L["c"]["TextScaled"] = true;
G2L["c"]["BackgroundColor3"] = Color3.fromRGB(26, 27, 32);
G2L["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["c"]["Size"] = UDim2.new(1, -35, 1, 0);
G2L["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["c"]["Text"] = [[Component]];
G2L["c"]["LayoutOrder"] = 1;
G2L["c"]["Name"] = [[ComponentTitle]];
G2L["c"]["Position"] = UDim2.new(0, 35, 0, 0);


-- StarterGui.ScreenGui.MainFrame.HelpHeader.BackButton
G2L["d"] = Instance.new("TextButton", G2L["b"]);
G2L["d"]["TextWrapped"] = true;
G2L["d"]["TextStrokeTransparency"] = 0;
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["TextSize"] = 14;
G2L["d"]["TextScaled"] = true;
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(129, 129, 129);
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["d"]["BackgroundTransparency"] = 0.65;
G2L["d"]["Size"] = UDim2.new(0, 35, 0, 35);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[X]];
G2L["d"]["Name"] = [[BackButton]];


-- StarterGui.ScreenGui.MainFrame.HelpScroll
G2L["e"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["e"]["Visible"] = false;
G2L["e"]["Active"] = true;
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["CanvasSize"] = UDim2.new(0, 0, 0, 1600);
G2L["e"]["Name"] = [[HelpScroll]];
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["Size"] = UDim2.new(1, 0, 1, -70);
G2L["e"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Position"] = UDim2.new(0.08564, 0, 0.07949, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["ScrollBarThickness"] = 10;
G2L["e"]["LayoutOrder"] = 3;
G2L["e"]["BackgroundTransparency"] = 0.98;


-- StarterGui.ScreenGui.MainFrame.HelpScroll.TextLabel
G2L["f"] = Instance.new("TextLabel", G2L["e"]);
G2L["f"]["TextWrapped"] = true;
G2L["f"]["TextStrokeTransparency"] = 0.5;
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["TextSize"] = 18;
G2L["f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["f"]["TextYAlignment"] = Enum.TextYAlignment.Top;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["BackgroundTransparency"] = 1;
G2L["f"]["RichText"] = true;
G2L["f"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["f"]["Size"] = UDim2.new(1, -20, 1, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);



return G2L["2"];