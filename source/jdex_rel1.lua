--[[
JDeX Advanced v1.1

Developed by EduardoPlayss121 & JDETeck
--]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function _createLoadingScreen()
  local loadingScreen = Instance.new("ScreenGui")
  loadingScreen.Name = "DeXLoadingScreen"
  loadingScreen.IgnoreGuiInset = true
  loadingScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

  local background = Instance.new("Frame")
  background.Name = "Background"
  background.Size = UDim2.new(1, 0, 1, 0)
  background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  background.BorderSizePixel = 0
  background.Parent = loadingScreen

  local image = Instance.new("ImageLabel")
  image.Name = "LoadingImage"
  image.Size = UDim2.new(0, 256, 0, 256)
  image.Position = UDim2.new(0.5, -128, 0.5, -128)
  image.BackgroundTransparency = 1
  image.Image = "rbxassetid://134106610348737"
  image.Parent = background

  local loadingText = Instance.new("TextLabel")
  loadingText.Name = "LoadingText"
  loadingText.Size = UDim2.new(0, 200, 0, 30)
  loadingText.Position = UDim2.new(0.5, -100, 0.6, 0)
  loadingText.BackgroundTransparency = 1
  loadingText.Text = "Loading JDeX..."
  loadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
  loadingText.TextSize = 24
  loadingText.Parent = background

  loadingScreen.Parent = PlayerGui

  wait(2)
  loadingScreen:Destroy()
end

local function _createDeXInterface()
  local dexGui = Instance.new("ScreenGui")
  dexGui.Name = "JDeXGui"
  dexGui.ResetOnSpawn = false
  dexGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

  local mainFrame = Instance.new("Frame")
  mainFrame.Name = "MainFrame"
  mainFrame.Size = UDim2.new(0, 800, 0, 500)
  mainFrame.Position = UDim2.new(0.5, -400, 0.5, -250)
  mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
  mainFrame.BorderSizePixel = 0
  mainFrame.ClipsDescendants = true
  mainFrame.Parent = dexGui

  local titleBar = Instance.new("Frame")
  titleBar.Name = "TitleBar"
  titleBar.Size = UDim2.new(1, 0, 0, 30)
  titleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
  titleBar.BorderSizePixel = 0
  titleBar.Parent = mainFrame

  local titleText = Instance.new("TextLabel")
  titleText.Name = "TitleText"
  titleText.Size = UDim2.new(0, 100, 1, 0)
  titleText.Position = UDim2.new(0, 10, 0, 0)
  titleText.BackgroundTransparency = 1
  titleText.Text = "JDeX Advanced v1"
  titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
  titleText.Font = Enum.Font.SourceSansSemibold
  titleText.TextSize = 18
  titleText.TextXAlignment = Enum.TextXAlignment.Left
  titleText.Parent = titleBar

  local closeButton = Instance.new("TextButton")
  closeButton.Name = "CloseButton"
  closeButton.Size = UDim2.new(0, 30, 1, 0)
  closeButton.Position = UDim2.new(1, -30, 0, 0)
  closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
  closeButton.BorderSizePixel = 0
  closeButton.Text = "X"
  closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
  closeButton.Font = Enum.Font.SourceSansSemibold
  closeButton.TextSize = 18
  closeButton.Parent = titleBar

  closeButton.MouseButton1Click:Connect(function()
      dexGui:Destroy()
  end)

  local tabBar = Instance.new("Frame")
  tabBar.Name = "TabBar"
  tabBar.Size = UDim2.new(1, 0, 0, 30)
  tabBar.Position = UDim2.new(0, 0, 0, 30)
  tabBar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
  tabBar.BorderSizePixel = 0
  tabBar.Parent = mainFrame

  local explorerTab = Instance.new("TextButton")
  explorerTab.Name = "ExplorerTab"
  explorerTab.Size = UDim2.new(0, 100, 1, 0)
  explorerTab.Position = UDim2.new(0, 0, 0, 0)
  explorerTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  explorerTab.BorderSizePixel = 0
  explorerTab.Text = "Explorer"
  explorerTab.TextColor3 = Color3.fromRGB(255, 255, 255)
  explorerTab.Font = Enum.Font.SourceSans
  explorerTab.TextSize = 16
  explorerTab.Parent = tabBar

  local propertiesTab = Instance.new("TextButton")
  propertiesTab.Name = "PropertiesTab"
  propertiesTab.Size = UDim2.new(0, 100, 1, 0)
  propertiesTab.Position = UDim2.new(0, 100, 0, 0)
  propertiesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  propertiesTab.BorderSizePixel = 0
  propertiesTab.Text = "Properties"
  propertiesTab.TextColor3 = Color3.fromRGB(255, 255, 255)
  propertiesTab.Font = Enum.Font.SourceSans
  propertiesTab.TextSize = 16
  propertiesTab.Parent = tabBar

  local contentFrame = Instance.new("Frame")
  contentFrame.Name = "ContentFrame"
  contentFrame.Size = UDim2.new(1, 0, 1, -60)
  contentFrame.Position = UDim2.new(0, 0, 0, 60)
  contentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
  contentFrame.BorderSizePixel = 0
  contentFrame.Parent = mainFrame

  local explorerPanel = Instance.new("ScrollingFrame")
  explorerPanel.Name = "ExplorerPanel"
  explorerPanel.Size = UDim2.new(0.3, 0, 1, 0)
  explorerPanel.Position = UDim2.new(0, 0, 0, 0)
  explorerPanel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
  explorerPanel.BorderSizePixel = 0
  explorerPanel.ScrollBarThickness = 8
  explorerPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
  explorerPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
  explorerPanel.Parent = contentFrame

  local explorerTitle = Instance.new("TextLabel")
  explorerTitle.Name = "ExplorerTitle"
  explorerTitle.Size = UDim2.new(1, 0, 0, 30)
  explorerTitle.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
  explorerTitle.BorderSizePixel = 0
  explorerTitle.Text = "Explorer"
  explorerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
  explorerTitle.Font = Enum.Font.SourceSansSemibold
  explorerTitle.TextSize = 18
  explorerTitle.Parent = explorerPanel

  local propertiesPanel = Instance.new("ScrollingFrame")
  propertiesPanel.Name = "PropertiesPanel"
  propertiesPanel.Size = UDim2.new(0.7, 0, 1, 0)
  propertiesPanel.Position = UDim2.new(0.3, 0, 0, 0)
  propertiesPanel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
  propertiesPanel.BorderSizePixel = 0
  propertiesPanel.ScrollBarThickness = 8
  propertiesPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
  propertiesPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
  propertiesPanel.Visible = false
  propertiesPanel.Parent = contentFrame

  local propertiesTitle = Instance.new("TextLabel")
  propertiesTitle.Name = "PropertiesTitle"
  propertiesTitle.Size = UDim2.new(1, 0, 0, 30)
  propertiesTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
  propertiesTitle.BorderSizePixel = 0
  propertiesTitle.Text = "Properties"
  propertiesTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
  propertiesTitle.Font = Enum.Font.SourceSansSemibold
  propertiesTitle.TextSize = 18
  propertiesTitle.Parent = propertiesPanel

  local function ShowExplorer()
      explorerPanel.Visible = true
      propertiesPanel.Visible = false
      explorerTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
      propertiesTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
  end

  local function ShowProperties()
      explorerPanel.Visible = false
      propertiesPanel.Visible = true
      explorerTab.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
      propertiesTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
  end

  explorerTab.MouseButton1Click:Connect(ShowExplorer)
  propertiesTab.MouseButton1Click:Connect(ShowProperties)

  ShowExplorer()

  local function CreateExplorerItem(parent, name, depth)
    depth = depth or 0

    local itemFrame = Instance.new("Frame")
    itemFrame.Name = name .. "Item"
    itemFrame.Size = UDim2.new(1, -20 * depth, 0, 25)
    itemFrame.BackgroundTransparency = 1
    itemFrame.Parent = parent

    local expandButton = Instance.new("TextButton")
    expandButton.Name = "ExpandButton"
    expandButton.Size = UDim2.new(0, 20, 0, 20)
    expandButton.Position = UDim2.new(0, 20 * depth, 0, 2)
    expandButton.BackgroundTransparency = 1
    expandButton.Text = "+"
    expandButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    expandButton.Font = Enum.Font.SourceSans
    expandButton.TextSize = 16
    expandButton.Parent = itemFrame

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(1, -40 - (20 * depth), 1, 0)
    nameLabel.Position = UDim2.new(0, 40 + (20 * depth), 0, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 16
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = itemFrame

    return itemFrame
  end

  local workspaceItem = CreateExplorerItem(explorerPanel, "Workspace", 0)
  local playersItem = CreateExplorerItem(explorerPanel, "Players", 0)
  local lightingItem = CreateExplorerItem(explorerPanel, "Lighting", 0)
  local replicatedStorageItem = CreateExplorerItem(explorerPanel, "ReplicatedStorage", 0)
  local SoundServiceItem = CreateExplorerItem(explorerPanel, "SoundService", 0)
  local replicatedFirstItem = CreateExplorerItem(explorerPanel, "ReplicatedFirst", 0)
  local ServerScriptServiceItem = CreateExplorerItem(explorerPanel, "ServerScriptService(not work)", 0)
  local ServerScriptItem = CreateExplorerItem(explorerPanel, "ServerScript(not work)", 0)
  local TestService = CreateExplorerItem(explorerPanel, "TestService", 0)
  local DataStoreServiceItem = CreateExplorerItem(explorerPanel, "DataStoreService(not work)", 0)
  local StarterGuiItem = CreateExplorerItem(explorerPanel, "StarterGui", 0)
  local StarterPlayerItem = CreateExplorerItem(explorerPanel, "StarterPlayer", 0)

  local function createProperty(parent, name, value)
    local propertyFrame = Instance.new("Frame")
    propertyFrame.Name = name .. "Property"
    propertyFrame.Size = UDim2.new(1, -10, 0, 30)
    propertyFrame.BackgroundTransparency = 1
    propertyFrame.Parent = parent

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Name = "NameLabel"
    nameLabel.Size = UDim2.new(0.4, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    nameLabel.Font = Enum.Font.SourceSans
    nameLabel.TextSize = 16
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    nameLabel.Parent = propertyFrame

    local valueBox = Instance.new("TextBox")
    valueBox.Name = "ValueBox"
    valueBox.Size = UDim2.new(0.5, 0, 0, 25)
    valueBox.Position = UDim2.new(0.4, 5, 0, 2)
    valueBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    valueBox.BorderSizePixel = 0
    valueBox.Text = tostring(value)
    valueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueBox.Font = Enum.Font.SourceSans
    valueBox.TextSize = 16
    valueBox.Parent = propertyFrame

    return propertyFrame
  end

  -- examples
  CreateProperty(propertiesPanel, "Name", "ExampleObject")
  CreateProperty(propertiesPanel, "Position", "0, 0, 0")
  CreateProperty(propertiesPanel, "Size", "1, 1, 1")
  CreateProperty(propertiesPanel, "Color", "255, 255, 255")
  CreateProperty(propertiesPanel, "Transparency", "0")
  CreateProperty(propertiesPanel, "Anchored", "true")
  -- end examples --

  local dragging
  local dragInput
  local dragStart
  local startPos

  local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
  end

  titleBar.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
              dragging = false
            end
        end)
      end
  end)

  titleBar.InputChanged:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
          dragInput = input
      end
  end)

  game:GetService("UserInputService").InputChanged:Connect(function(input)
      if input == dragInput and dragging then
          update(input)
      end
  end)

  local resizing = false
  local resizeStart
  local startSize

  local resizeHandle = Instance.new("Frame")
  resizeHandle.Name = "ResizeHandle"
  resizeHandle.Size = UDim2.new(0, 10, 0, 10)
  resizeHandle.Position = UDim2.new(1, -10, 1, -10)
  resizeHandle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
  resizeHandle.BorderSizePixel = 0
  resizeHandle.Parent = mainFrame

  resizeHandle.InputBegan:Connect(function(input)
      if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
          resizing = true
          resizeStart = input.Position
          startSize = mainFrame.Size
            
          input.Changed:Connect(function()
              if input.UserInputState == Enum.UserInputState.End then
                  resizing = false
              end
          end)
      end
  end)

  game:GetService("UserInputService").InputChanged:Connect(function(input)
      if resizing and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
          local delta = input.Position - resizeStart
          local newSize = UDim2.new(startSize.X.Scale, startSize.X.Offset + delta.X, startSize.Y.Scale, startSize.Y.Offset + delta.Y)
            
          if newSize.X.Offset < 400 then newSize = UDim2.new(newSize.X.Scale, 400, newSize.Y.Scale, newSize.Y.Offset) end
          if newSize.Y.Offset < 300 then newSize = UDim2.new(newSize.X.Scale, newSize.X.Offset, newSize.Y.Scale, 300) end
            
          mainFrame.Size = newSize
      end
  end)

  dexGui.Parent = PlayerGui
end

_createLoadingScreen()
wait()
_createDeXInterface()
