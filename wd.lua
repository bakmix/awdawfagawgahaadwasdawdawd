local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- Notification function
local onMessage = function(message)  
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Notification",
        Text = message,
        Duration = 10,
        Icon = "rbxassetid://120191430745933"
    })
end

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KeySystemGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main container with gradient background
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 500)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 30, 40)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Main frame corner
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

-- Gradient background
local Gradient = Instance.new("UIGradient")
Gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(35, 45, 65)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 25, 35))
}
Gradient.Rotation = 45
Gradient.Parent = MainFrame

-- Drop shadow effect
local Shadow = Instance.new("Frame")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 20, 1, 20)
Shadow.Position = UDim2.new(0, -10, 0, -10)
Shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Shadow.BackgroundTransparency = 0.8
Shadow.ZIndex = -1

local ShadowCorner = Instance.new("UICorner")
ShadowCorner.CornerRadius = UDim.new(0, 20)
ShadowCorner.Parent = Shadow
Shadow.Parent = MainFrame

-- Top bar with logo and close button
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 60)
TopBar.BackgroundTransparency = 1
TopBar.Parent = MainFrame

-- Logo (1500x1500 placeholder)
local Logo = Instance.new("ImageLabel")
Logo.Name = "Logo"
Logo.Size = UDim2.new(0, 40, 0, 40)
Logo.Position = UDim2.new(0, 15, 0, 10)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://120191430745933" -- Replace with your 1500x1500 logo
Logo.ScaleType = Enum.ScaleType.Fit
Logo.Parent = TopBar

-- Title
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -120, 0, 30)
Title.Position = UDim2.new(0, 65, 0, 10)
Title.BackgroundTransparency = 1
Title.Text = "Key Status"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.Parent = TopBar

-- Subtitle
local Subtitle = Instance.new("TextLabel")
Subtitle.Name = "Subtitle"
Subtitle.Size = UDim2.new(1, -120, 0, 20)
Subtitle.Position = UDim2.new(0, 65, 0, 35)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Check your premium key expiration date"
Subtitle.TextColor3 = Color3.fromRGB(160, 170, 180)
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Font = Enum.Font.Gotham
Subtitle.TextSize = 12
Subtitle.Parent = TopBar

-- Close button
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -45, 0, 12)
CloseButton.BackgroundColor3 = Color3.fromRGB(60, 70, 85)
CloseButton.BorderSizePixel = 0
CloseButton.Text = "✕"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.Parent = TopBar

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 8)
CloseButtonCorner.Parent = CloseButton

-- Content container
local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Size = UDim2.new(1, -30, 1, -90)
ContentFrame.Position = UDim2.new(0, 15, 0, 75)
ContentFrame.BackgroundTransparency = 1
ContentFrame.Parent = MainFrame

-- Key input with icon
local InputContainer = Instance.new("Frame")
InputContainer.Name = "InputContainer"
InputContainer.Size = UDim2.new(1, 0, 0, 50)
InputContainer.Position = UDim2.new(0, 0, 0, 20)
InputContainer.BackgroundColor3 = Color3.fromRGB(45, 55, 70)
InputContainer.BorderSizePixel = 0
InputContainer.Parent = ContentFrame

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 10)
InputCorner.Parent = InputContainer

-- Key icon
local KeyIcon = Instance.new("ImageLabel")
KeyIcon.Name = "KeyIcon"
KeyIcon.Size = UDim2.new(0, 20, 0, 20)
KeyIcon.Position = UDim2.new(0, 15, 0, 15)
KeyIcon.BackgroundTransparency = 1
KeyIcon.Image = "rbxassetid://3926305904" -- Key icon
KeyIcon.ImageColor3 = Color3.fromRGB(100, 150, 255)
KeyIcon.Parent = InputContainer

-- Key input
local KeyInput = Instance.new("TextBox")
KeyInput.Name = "KeyInput"
KeyInput.Size = UDim2.new(1, -50, 1, 0)
KeyInput.Position = UDim2.new(0, 45, 0, 0)
KeyInput.BackgroundTransparency = 1
KeyInput.PlaceholderText = "Enter your key..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.PlaceholderColor3 = Color3.fromRGB(120, 130, 140)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.TextXAlignment = Enum.TextXAlignment.Left
KeyInput.ClearTextOnFocus = false
KeyInput.Parent = InputContainer

-- Get Key button with icon
local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Name = "GetKeyButton"
GetKeyButton.Size = UDim2.new(1, 0, 0, 45)
GetKeyButton.Position = UDim2.new(0, 0, 0, 90)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(70, 130, 255)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Text = ""
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.TextSize = 14
GetKeyButton.Parent = ContentFrame

local GetKeyCorner = Instance.new("UICorner")
GetKeyCorner.CornerRadius = UDim.new(0, 10)
GetKeyCorner.Parent = GetKeyButton

-- Get Key button content
local GetKeyContainer = Instance.new("Frame")
GetKeyContainer.Size = UDim2.new(1, 0, 1, 0)
GetKeyContainer.BackgroundTransparency = 1
GetKeyContainer.Parent = GetKeyButton

local GetKeyIcon = Instance.new("ImageLabel")
GetKeyIcon.Name = "GetKeyIcon"
GetKeyIcon.Size = UDim2.new(0, 20, 0, 20)
GetKeyIcon.Position = UDim2.new(0, 15, 0, 12)
GetKeyIcon.BackgroundTransparency = 1
GetKeyIcon.Image = "rbxassetid://3926305904" -- Key icon
GetKeyIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
GetKeyIcon.Parent = GetKeyContainer

local GetKeyLabel = Instance.new("TextLabel")
GetKeyLabel.Size = UDim2.new(1, -50, 1, 0)
GetKeyLabel.Position = UDim2.new(0, 45, 0, 0)
GetKeyLabel.BackgroundTransparency = 1
GetKeyLabel.Text = "Get Key"
GetKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyLabel.Font = Enum.Font.GothamBold
GetKeyLabel.TextSize = 14
GetKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
GetKeyLabel.Parent = GetKeyContainer

-- Check Key button with icon
local CheckKeyButton = Instance.new("TextButton")
CheckKeyButton.Name = "CheckKeyButton"
CheckKeyButton.Size = UDim2.new(1, 0, 0, 45)
CheckKeyButton.Position = UDim2.new(0, 0, 0, 150)
CheckKeyButton.BackgroundColor3 = Color3.fromRGB(60, 70, 85)
CheckKeyButton.BorderSizePixel = 0
CheckKeyButton.Text = ""
CheckKeyButton.Font = Enum.Font.GothamBold
CheckKeyButton.TextSize = 14
CheckKeyButton.Parent = ContentFrame

local CheckKeyCorner = Instance.new("UICorner")
CheckKeyCorner.CornerRadius = UDim.new(0, 10)
CheckKeyCorner.Parent = CheckKeyButton

-- Check Key button content
local CheckKeyContainer = Instance.new("Frame")
CheckKeyContainer.Size = UDim2.new(1, 0, 1, 0)
CheckKeyContainer.BackgroundTransparency = 1
CheckKeyContainer.Parent = CheckKeyButton

local CheckKeyIcon = Instance.new("ImageLabel")
CheckKeyIcon.Name = "CheckKeyIcon"
CheckKeyIcon.Size = UDim2.new(0, 20, 0, 20)
CheckKeyIcon.Position = UDim2.new(0, 15, 0, 12)
CheckKeyIcon.BackgroundTransparency = 1
CheckKeyIcon.Image = "rbxassetid://3926307971" -- Search icon
CheckKeyIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyIcon.Parent = CheckKeyContainer

local CheckKeyLabel = Instance.new("TextLabel")
CheckKeyLabel.Size = UDim2.new(1, -50, 1, 0)
CheckKeyLabel.Position = UDim2.new(0, 45, 0, 0)
CheckKeyLabel.BackgroundTransparency = 1
CheckKeyLabel.Text = "Check Expiry Date"
CheckKeyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyLabel.Font = Enum.Font.GothamBold
CheckKeyLabel.TextSize = 14
CheckKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
CheckKeyLabel.Parent = CheckKeyContainer

-- Info text
local InfoText = Instance.new("TextLabel")
InfoText.Name = "InfoText"
InfoText.Size = UDim2.new(1, 0, 0, 20)
InfoText.Position = UDim2.new(0, 0, 0, 210)
InfoText.BackgroundTransparency = 1
InfoText.Text = "⏱ Keys typically last 30 days"
InfoText.TextColor3 = Color3.fromRGB(120, 130, 140)
InfoText.Font = Enum.Font.Gotham
InfoText.TextSize = 12
InfoText.TextXAlignment = Enum.TextXAlignment.Left
InfoText.Parent = ContentFrame

-- Bottom container for Discord and Website buttons
local BottomContainer = Instance.new("Frame")
BottomContainer.Name = "BottomContainer"
BottomContainer.Size = UDim2.new(1, 0, 0, 50)
BottomContainer.Position = UDim2.new(0, 0, 1, -70)
BottomContainer.BackgroundTransparency = 1
BottomContainer.Parent = ContentFrame

-- Discord button
local DiscordButton = Instance.new("TextButton")
DiscordButton.Name = "DiscordButton"
DiscordButton.Size = UDim2.new(0, 45, 0, 45)
DiscordButton.Position = UDim2.new(0, 0, 0, 0)
DiscordButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
DiscordButton.BorderSizePixel = 0
DiscordButton.Text = ""
DiscordButton.Parent = BottomContainer

local DiscordCorner = Instance.new("UICorner")
DiscordCorner.CornerRadius = UDim.new(0, 10)
DiscordCorner.Parent = DiscordButton

local DiscordIcon = Instance.new("ImageLabel")
DiscordIcon.Size = UDim2.new(0, 25, 0, 25)
DiscordIcon.Position = UDim2.new(0.5, -12, 0.5, -12)
DiscordIcon.BackgroundTransparency = 1
DiscordIcon.Image = "rbxassetid://3926305904" -- Discord icon (replace with actual Discord icon)
DiscordIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
DiscordIcon.Parent = DiscordButton

-- Website button
local WebsiteButton = Instance.new("TextButton")
WebsiteButton.Name = "WebsiteButton"
WebsiteButton.Size = UDim2.new(0, 45, 0, 45)
WebsiteButton.Position = UDim2.new(0, 55, 0, 0)
WebsiteButton.BackgroundColor3 = Color3.fromRGB(100, 110, 125)
WebsiteButton.BorderSizePixel = 0
WebsiteButton.Text = ""
WebsiteButton.Parent = BottomContainer

local WebsiteCorner = Instance.new("UICorner")
WebsiteCorner.CornerRadius = UDim.new(0, 10)
WebsiteCorner.Parent = WebsiteButton

local WebsiteIcon = Instance.new("ImageLabel")
WebsiteIcon.Size = UDim2.new(0, 25, 0, 25)
WebsiteIcon.Position = UDim2.new(0.5, -12, 0.5, -12)
WebsiteIcon.BackgroundTransparency = 1
WebsiteIcon.Image = "rbxassetid://3926305904" -- Website icon (replace with actual globe icon)
WebsiteIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
WebsiteIcon.Parent = WebsiteButton

-- Add main frame to screen
MainFrame.Parent = ScreenGui
ScreenGui.Parent = game:GetService("CoreGui") or game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Draggable functionality
local dragging = false
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

-- Button animations
local function animateButton(button, hoverColor, normalColor)
    button.MouseEnter:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = hoverColor})
        tween:Play()
    end)
    
    button.MouseLeave:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = normalColor})
        tween:Play()
    end)
    
    button.MouseButton1Down:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.1), {Size = button.Size - UDim2.new(0, 4, 0, 4)})
        tween:Play()
    end)
    
    button.MouseButton1Up:Connect(function()
        local tween = TweenService:Create(button, TweenInfo.new(0.1), {Size = button.Size + UDim2.new(0, 4, 0, 4)})
        tween:Play()
    end)
end

-- Apply animations
animateButton(CloseButton, Color3.fromRGB(255, 100, 100), Color3.fromRGB(60, 70, 85))
animateButton(GetKeyButton, Color3.fromRGB(90, 150, 255), Color3.fromRGB(70, 130, 255))
animateButton(CheckKeyButton, Color3.fromRGB(80, 90, 105), Color3.fromRGB(60, 70, 85))
animateButton(DiscordButton, Color3.fromRGB(108, 121, 255), Color3.fromRGB(88, 101, 242))
animateButton(WebsiteButton, Color3.fromRGB(120, 130, 145), Color3.fromRGB(100, 110, 125))

-- Close button functionality
CloseButton.MouseButton1Click:Connect(function()
    local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })
    closeTween:Play()
    
    closeTween.Completed:Connect(function()
        ScreenGui:Destroy()
    end)
end)

-- Get Key button functionality
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro/key-sytem")
    onMessage("🌐 Key website copied to clipboard")
end)

-- Website button functionality
WebsiteButton.MouseButton1Click:Connect(function()
    setclipboard("https://bakmix.pro")
    onMessage("🌐 Website URL copied to clipboard")
end)

-- Discord button functionality
DiscordButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/9vWsKfRnQr")
    onMessage("🌐 Discord link copied to clipboard")
end)

-- Check Key button functionality
CheckKeyButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text:gsub("%s+", "")
    
    if key == "" then
        onMessage("🔑 Please enter a key!")
        return
    end
    
    -- Create request URL
    local url = "https://bakmix.pro/raw/callback?key=" .. HttpService:UrlEncode(key)
    
    local success, response = pcall(function()
        return game:HttpGet(url, true)
    end)
    
    if success then
        local data = HttpService:JSONDecode(response)
        if data.status == "success" then
            -- First check if in supported map after successful key validation
            local allowedPlaces = {
                {placeId = 3678761576, scriptUrl = "https://bakmix.pro/raw/script/ww1.lua"}
            }
            
            local playerPlaceId = game.PlaceId
            local scriptToLoad = nil
            
            for _, place in ipairs(allowedPlaces) do
                if playerPlaceId == place.placeId then
                    scriptToLoad = place.scriptUrl
                    break
                end
            end
            
            if not scriptToLoad then
                onMessage("✅ Key is valid!")
                onMessage("❌ The script does not support this map")
                return
            end
            
            -- Set global variables
            _G.Key = key
            _G.PASSWORD = "24122009"
            
            -- Load script
            loadstring(game:HttpGet(scriptToLoad))()
            wait(1)
            loadstring(game:HttpGet"https://bakmix.pro/raw/webhook.lua")()
            
            -- Close GUI with animation
            local closeTween = TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
            closeTween:Play()
            
            closeTween.Completed:Connect(function()
                ScreenGui:Destroy()
            end)
            
            -- Show notifications
            onMessage("🔑 Key: " .. data.data.key)
            onMessage("⏳ Expires: " .. data.data.expires_at)
        else
            onMessage("❌ " .. (data.message or "Invalid key"))
        end
    else
        onMessage("🌐 Connection Error")
        warn("🌐 Request Error: " .. response)
    end
end)

-- Mobile and desktop responsive design
local function updateUIScale()
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local isMobile = viewportSize.X < 800 or viewportSize.Y < 600
    
    if isMobile then
        -- Mobile layout
        MainFrame.Size = UDim2.new(0, math.min(350, viewportSize.X - 40), 0, 450)
        MainFrame.Position = UDim2.new(0.5, -math.min(175, (viewportSize.X - 40) / 2), 0.5, -225)
        
        -- Adjust text sizes for mobile
        Title.TextSize = 18
        Subtitle.TextSize = 11
        GetKeyLabel.TextSize = 13
        CheckKeyLabel.TextSize = 13
        KeyInput.TextSize = 13
        InfoText.TextSize = 11
    else
        -- Desktop layout
        local scale = math.min(1.2, math.min(viewportSize.X / 1920, viewportSize.Y / 1080) * 1.8)
        MainFrame.Size = UDim2.new(0, 400 * scale, 0, 500 * scale)
        MainFrame.Position = UDim2.new(0.5, -200 * scale, 0.5, -250 * scale)
        
        -- Reset text sizes for desktop
        Title.TextSize = 20
        Subtitle.TextSize = 12
        GetKeyLabel.TextSize = 14
        CheckKeyLabel.TextSize = 14
        KeyInput.TextSize = 14
        InfoText.TextSize = 12
    end
end

-- Initial scale update and viewport change listener
updateUIScale()
workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateUIScale)

-- Entrance animation
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)

local entranceTween = TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back), {
    Size = UDim2.new(0, 400, 0, 500),
    Position = UDim2.new(0.5, -200, 0.5, -250)
})

wait(0.1)
entranceTween:Play()
