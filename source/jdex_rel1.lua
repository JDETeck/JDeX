-- [[
JDeX Developer Suite

Developed by Eduardo7881 & JDETeck
Owned by JDE Tecnology(c) DO NOT DISTRIBUTE FOR A PRICE. IT'S FREE!
--]]

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

-- DeX Settings
local TITLE = "JDeX Minimal ALPHA"
local VERSION = "2"
local changelogs_logs = {
	{
		version = "2.0",
		message = "Added Changelog Panel\nFixed UI Scalling Issues\nImproved Explorer\nStay tuned for new updates!"
	}
}

local function CreateLoadingScreen()
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
    loadingText.Font = Enum.Font.SourceSans
    loadingText.TextSize = 24
    loadingText.Parent = background

    loadingScreen.Parent = PlayerGui

    wait(2)
    loadingScreen:Destroy()
end

local function CreateDeXInterface()
    local dexGui = Instance.new("ScreenGui")
    dexGui.Name = "JDeXMain"
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

	local corner = Instance.new("UICorner")
	corner.Name = "GUICorner"
	corner.CornerRadius = UDim.new(0, 12)
	corner.Parent = mainFrame

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
    titleText.Text = TITLE .. " v" .. VERSION
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
	propertiesTab.Visible = false
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

    local changelogPanel = Instance.new("ScrollingFrame")
    changelogPanel.Name = "ChangelogPanel"
    changelogPanel.Size = UDim2.new(0.7, 0, 1, 0)
    changelogPanel.Position = UDim2.new(0.3, 0, 0, 0)
    changelogPanel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    changelogPanel.BorderSizePixel = 0
    changelogPanel.ScrollBarThickness = 8
    changelogPanel.AutomaticCanvasSize = Enum.AutomaticSize.Y
    changelogPanel.CanvasSize = UDim2.new(0, 0, 0, 0)
    changelogPanel.Visible = true
    changelogPanel.Parent = contentFrame

    local changelogTitle = Instance.new("TextLabel")
    changelogTitle.Name = "ChangelogTitle"
    changelogTitle.Size = UDim2.new(1, 0, 0, 30)
    changelogTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    changelogTitle.BorderSizePixel = 0
    changelogTitle.Text = "Changelog"
    changelogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    changelogTitle.Font = Enum.Font.SourceSansSemibold
    changelogTitle.TextSize = 20
	changelogTitle.Visible = true
    changelogTitle.Parent = changelogPanel

	local function DisplayChangelogs()
        local yOffset = 40
		
		for i, log in ipairs(changelogs_logs) do
			local versionFrame = Instance.new("Frame")
			versionFrame.Name = "Version_" .. log.version
			versionFrame.Size = UDim2.new(1, -20, 0, 60)
			versionFrame.Position = UDim2.new(0, 10, 0, yOffset)
			versionFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			versionFrame.BorderSizePixel = 0
			versionFrame.Parent = changelogPanel

			local versionText = Instance.new("TextLabel")
			versionText.Name = "VersionText"
			versionText.Size = UDim2.new(0.3, 0, 0, 25)
			versionText.Position = UDim2.new(0, 10, 0, 5)
			versionText.BackgroundTransparency = 1
			versionText.Text = "v" .. log.version
			versionText.TextColor3 = Color3.fromRGB(0, 170, 255)
			versionText.Font = Enum.Font.SourceSansSemibold
			versionText.TextSize = 18
			versionText.TextXAlignment = Enum.TextXAlignment.Left
			versionText.Parent = versionFrame

			local changesText = Instance.new("TextLabel")
            changesText.Name = "ChangesText"
            changesText.Size = UDim2.new(0.9, -10, 0, 50)
            changesText.Position = UDim2.new(0.1, 10, 0, 5)
            changesText.BackgroundTransparency = 1
            changesText.Text = log.message
            changesText.TextColor3 = Color3.fromRGB(200, 200, 200)
            changesText.Font = Enum.Font.SourceSans
            changesText.TextSize = 16
            changesText.TextXAlignment = Enum.TextXAlignment.Left
            changesText.TextYAlignment = Enum.TextYAlignment.Top
            changesText.TextWrapped = true
            changesText.Parent = versionFrame

			local divider = Instance.new("Frame")
            divider.Name = "Divider"
            divider.Size = UDim2.new(1, -20, 0, 1)
            divider.Position = UDim2.new(0, 10, 0, 58)
            divider.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            divider.BorderSizePixel = 0
            divider.Parent = versionFrame

			yOffset = yOffset + 65
		end

		changelogPanel.CanvasSize = UDim2.new(0, 0, 0, yOffset + 10)
	end

	DisplayChangelogs()

    local function ShowExplorer()
        explorerPanel.Visible = true
        explorerTab.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end

    explorerTab.MouseButton1Click:Connect(ShowExplorer)

    ShowExplorer()

    local function CreateExplorerItem(parent, name, depth, expand)
        depth = depth or 0
		expand = expand or false
		local itemY = #parent:GetChildren() * 25
        
        local itemFrame = Instance.new("Frame")
        itemFrame.Name = name .. "Item"
        itemFrame.Size = UDim2.new(1, -20 * depth, 0, 25)
		itemFrame.Position = UDim2.new(0, 0, 0, itemY)
        itemFrame.BackgroundTransparency = 1
        itemFrame.Parent = parent
        
        if expand then
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
		end
        
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

	local EXPANDABLE_SERVICES = {
		Workspace = true,
		Players = true,
		Lighting = true,
		ServerScriptService = true,
	    ReplicatedStorage = true,
		ReplicatedFirst = true,
		StarterPlayer = true,
		StarterGui = true,
		StarterPack = true,
		SoundService = true,
		TextChatService = true
	}

	local function RenderDescendants(parentFrame, instance, depth)
	    depth = depth or 1

		if not instance or not instance:IsA("Instance") then return end

		local children = {}
		for _, child in ipairs(instance:GetChildren()) do
		    table.insert(children, child)
		end
		table.sort(children, function (a, b) return a.Name:lower() < b.Name:lower() end)

		for _, child in ipairs(children) do
			local isExpandanle = #child:GetChildren() > 0
			local childItem = CreateExplorerItem(parentFrame, child.Name, depth, isExpandable)

			if isExpandable then
				local expandButton = childItem:FindFirstChild("ExpandButton")
				local expanded = false
				local childContainer

				expandButton.MouseButton1Click:Connect(function()
				    expanded = not expanded

					if expanded then
						expandButton.Text = "-"
						childContainer = Instance.new("Frame")
						childContainer.Name = "ChildContainer"
						childContainer.Size = UDim2.new(1, 0, 0, 0)
						childContainer.Position = UDim2.new(0, 0, 0, 25)
						childContainer.BackgroundTransparency = 1
						childContainer.Parent = childItem

						RenderDescendants(childContainer, child, depth + 1)

						local totalHeight = 0
						for _, item in ipairs(childContainer:GetChildren()) do
							if item:IsA("Frame") then
								totalHeight = totalHeight + item.Size.Y.Offset
							end
						end
						childContainer.Size = UDim2.new(1, 0, 0, totalHeight)
					else
						expandButton.Text = "+"
						if childContainer then
							childContainer:Destroy()
						end
					end

					RecalculatePositions(parentFrame)
				end)
			end
		end
	end

	local function RecalculatePositions(container)
	    local yPosition = 0

		for _, item in ipairs(container:GetChildren()) do
			if item:IsA("Frame") and item.Name:find("Item$") then
                item.Position = UDim2.new(0, 0, 0, yPosition)
                yPosition = yPosition + item.Size.Y.Offset

                local childContainer = item:FindFirstChild("ChildContainer")
                if childContainer then
                    RecalculatePositions(childContainer)
                    yPosition = yPosition + childContainer.Size.Y.Offset
                end
            end
		end

		if container:IsA("ScrollingFrame") then
			container.CanvasSize = UDim2.new(0, 0, 0, yPosition)
		else
			container.Size = UDim2.new(container.Size.X.Scale, container.Size.X.Offset, 0, yPosition)
		end
    end

	local function InitializeExplorer()
	    local serviceList = {
            {name = "Workspace", func = function() return game:GetService("Workspace") end},
            {name = "Players", func = function() return game:GetService("Players") end},
            {name = "Lighting", func = function() return game:GetService("Lighting") end},
            {name = "ServerScriptService", func = function() return game:GetService("ServerScriptService") end},
            {name = "ReplicatedStorage", func = function() return game:GetService("ReplicatedStorage") end},
            {name = "ReplicatedFirst", func = function() return game:GetService("ReplicatedFirst") end},
            {name = "StarterPlayer", func = function() return game:GetService("StarterPlayer") end},
            {name = "StarterGui", func = function() return game:GetService("StarterGui") end},
            {name = "StarterPack", func = function() return game:GetService("StarterPack") end},
            {name = "SoundService", func = function() return game:GetService("SoundService") end},
            {name = "CoreGui", func = function() return game:GetService("CoreGui") end},
            {name = "CorePackages", func = function() return game:GetService("CorePackages") end},
            {name = "MaterialService", func = function() return game:FindService("MaterialService") end}, -- Usando FindService pois pode não existir
            {name = "NetworkClient", func = function() return game:FindService("NetworkClient") end},
            {name = "Chat", func = function() return game:FindService("Chat") end},
            {name = "TextChatService", func = function() return game:FindService("TextChatService") end},
            {name = "VoiceChatService", func = function() return game:FindService("VoiceChatService") end},
            {name = "Teams", func = function() return game:GetService("Teams") end},
            {name = "AssetService", func = function() return game:FindService("AssetService") end},
            {name = "BadgeService", func = function() return game:FindService("BadgeService") end},
            {name = "CollectionService", func = function() return game:GetService("CollectionService") end},
            {name = "ContentProvider", func = function() return game:FindService("ContentProvider") end},
            {name = "Debris", func = function() return game:GetService("Debris") end},
            {name = "GamePassService", func = function() return game:FindService("GamePassService") end},
            {name = "HttpService", func = function() return game:GetService("HttpService") end},
            {name = "RunService", func = function() return game:GetService("RunService") end},
            {name = "TeleportService", func = function() return game:GetService("TeleportService") end},
            {name = "UserInputService", func = function() return game:GetService("UserInputService") end},
            {name = "MarketplaceService", func = function() return game:GetService("MarketplaceService") end}
        }

		table.sort(serviceList, function(a, b) return a.name:lower() < b.name:lower() end)

        for _, serviceInfo in ipairs(serviceList) do
			local success, service = pcall(serviceInfo.func)
			if success and service then
				local isExpandable = EXPANDABLE_SERVICES[serviceInfo.name] and #service:GetChildren() > 0
				local item = CreateExplorerItem(explorerPanel, serviceInfo.name, 0, isExpandable)

				if isExpandable then
					local expandButton = item:FindFirstChild("ExpandButton")
                    local expanded = false
                    local childContainer

					expandButton.MouseButton1Click:Connect(function()
                        expanded = not expanded
                    
                        if expanded then
                            expandButton.Text = "-"
                            childContainer = Instance.new("Frame")
                            childContainer.Name = "ChildContainer"
                            childContainer.Size = UDim2.new(1, 0, 0, 0)
                            childContainer.Position = UDim2.new(0, 0, 0, 25)
                            childContainer.BackgroundTransparency = 1
                            childContainer.Parent = item
                        
                            RenderDescendants(childContainer, service, 1)
                        
                            local totalHeight = 0
                            for _, childItem in ipairs(childContainer:GetChildren()) do
                                if childItem:IsA("Frame") then
                                    totalHeight = totalHeight + childItem.Size.Y.Offset
                                end
                            end
                            childContainer.Size = UDim2.new(1, 0, 0, totalHeight)
                        else
                            expandButton.Text = "+"
                            if childContainer then
                                childContainer:Destroy()
                            end
                        end
                    
                        RecalculatePositions(explorerPanel)
                    end)
                end
			end
		end
	end
            

    InitializeExplorer()

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

print("[==== Loading JDeX... ====]")
CreateLoadingScreen()
wait()
CreateDeXInterface()
