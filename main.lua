-- Murder Mystery Script mit allen gewünschten Funktionen
-- Ersteller: Venice

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- UI Erstellung
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MurderMysteryHack"

-- Versuche, es zu CoreGui hinzuzufügen, falls das fehlschlägt, versuche es mit PlayerGui
local success, err = pcall(function()
    ScreenGui.Parent = game:GetService("CoreGui")
end)
if not success then
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
end

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Size = UDim2.new(0, 500, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "Murder Mystery Hack by Venice"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 20

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(0, 460, 0, 10)
CloseButton.Size = UDim2.new(0, 30, 0, 20)
CloseButton.Font = Enum.Font.SourceSans
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

local Tabs = Instance.new("Frame")
Tabs.Name = "Tabs"
Tabs.Parent = MainFrame
Tabs.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Tabs.BorderSizePixel = 0
Tabs.Position = UDim2.new(0, 0, 0, 40)
Tabs.Size = UDim2.new(0, 500, 0, 40)

local MainTab = Instance.new("TextButton")
MainTab.Name = "MainTab"
MainTab.Parent = Tabs
MainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainTab.BorderSizePixel = 0
MainTab.Position = UDim2.new(0, 10, 0, 5)
MainTab.Size = UDim2.new(0, 90, 0, 30)
MainTab.Font = Enum.Font.Gotham
MainTab.Text = "Main"
MainTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MainTab.TextSize = 14

local VisualsTab = Instance.new("TextButton")
VisualsTab.Name = "VisualsTab"
VisualsTab.Parent = Tabs
VisualsTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
VisualsTab.BorderSizePixel = 0
VisualsTab.Position = UDim2.new(0, 110, 0, 5)
VisualsTab.Size = UDim2.new(0, 90, 0, 30)
VisualsTab.Font = Enum.Font.Gotham
VisualsTab.Text = "Visuals"
VisualsTab.TextColor3 = Color3.fromRGB(255, 255, 255)
VisualsTab.TextSize = 14

local CombatTab = Instance.new("TextButton")
CombatTab.Name = "CombatTab"
CombatTab.Parent = Tabs
CombatTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
CombatTab.BorderSizePixel = 0
CombatTab.Position = UDim2.new(0, 210, 0, 5)
CombatTab.Size = UDim2.new(0, 90, 0, 30)
CombatTab.Font = Enum.Font.Gotham
CombatTab.Text = "Combat"
CombatTab.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatTab.TextSize = 14

local ContentFrame = Instance.new("Frame")
ContentFrame.Name = "ContentFrame"
ContentFrame.Parent = MainFrame
ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ContentFrame.BorderSizePixel = 0
ContentFrame.Position = UDim2.new(0, 0, 0, 80)
ContentFrame.Size = UDim2.new(0, 500, 0, 320)

-- Main Tab Content
local MainContent = Instance.new("ScrollingFrame")
MainContent.Name = "MainContent"
MainContent.Parent = ContentFrame
MainContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainContent.BorderSizePixel = 0
MainContent.Position = UDim2.new(0, 0, 0, 0)
MainContent.Size = UDim2.new(0, 500, 0, 320)
MainContent.ScrollBarThickness = 5
MainContent.Visible = true

local FlyToggle = Instance.new("TextButton")
FlyToggle.Name = "FlyToggle"
FlyToggle.Parent = MainContent
FlyToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlyToggle.BorderSizePixel = 0
FlyToggle.Position = UDim2.new(0, 20, 0, 20)
FlyToggle.Size = UDim2.new(0, 100, 0, 30)
FlyToggle.Font = Enum.Font.Gotham
FlyToggle.Text = "Fly: OFF"
FlyToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlyToggle.TextSize = 14

local FlySpeedLabel = Instance.new("TextLabel")
FlySpeedLabel.Name = "FlySpeedLabel"
FlySpeedLabel.Parent = MainContent
FlySpeedLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FlySpeedLabel.BorderSizePixel = 0
FlySpeedLabel.Position = UDim2.new(0, 140, 0, 20)
FlySpeedLabel.Size = UDim2.new(0, 80, 0, 30)
FlySpeedLabel.Font = Enum.Font.Gotham
FlySpeedLabel.Text = "Speed: 1.0"
FlySpeedLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedLabel.TextSize = 14

local FlySpeedSlider = Instance.new("TextButton")
FlySpeedSlider.Name = "FlySpeedSlider"
FlySpeedSlider.Parent = MainContent
FlySpeedSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FlySpeedSlider.BorderSizePixel = 0
FlySpeedSlider.Position = UDim2.new(0, 240, 0, 20)
FlySpeedSlider.Size = UDim2.new(0, 200, 0, 30)
FlySpeedSlider.Font = Enum.Font.Gotham
FlySpeedSlider.Text = ""
FlySpeedSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
FlySpeedSlider.TextSize = 14

local SpeedToggle = Instance.new("TextButton")
SpeedToggle.Name = "SpeedToggle"
SpeedToggle.Parent = MainContent
SpeedToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedToggle.BorderSizePixel = 0
SpeedToggle.Position = UDim2.new(0, 20, 0, 70)
SpeedToggle.Size = UDim2.new(0, 100, 0, 30)
SpeedToggle.Font = Enum.Font.Gotham
SpeedToggle.Text = "Speed: OFF"
SpeedToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedToggle.TextSize = 14

local NoClipToggle = Instance.new("TextButton")
NoClipToggle.Name = "NoClipToggle"
NoClipToggle.Parent = MainContent
NoClipToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
NoClipToggle.BorderSizePixel = 0
NoClipToggle.Position = UDim2.new(0, 130, 0, 70)  -- Geänderte Position
NoClipToggle.Size = UDim2.new(0, 100, 0, 30)
NoClipToggle.Font = Enum.Font.Gotham
NoClipToggle.Text = "NoClip: OFF"
NoClipToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
NoClipToggle.TextSize = 14

local PlayerTrackerToggle = Instance.new("TextButton")
PlayerTrackerToggle.Name = "PlayerTrackerToggle"
PlayerTrackerToggle.Parent = MainContent
PlayerTrackerToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerTrackerToggle.BorderSizePixel = 0
PlayerTrackerToggle.Position = UDim2.new(0, 240, 0, 70)  -- Position neben NoClip
PlayerTrackerToggle.Size = UDim2.new(0, 100, 0, 30)
PlayerTrackerToggle.Font = Enum.Font.Gotham
PlayerTrackerToggle.Text = "Tracker: OFF"
PlayerTrackerToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerTrackerToggle.TextSize = 14

local FlingToggle = Instance.new("TextButton")
FlingToggle.Name = "FlingToggle"
FlingToggle.Parent = MainContent
FlingToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FlingToggle.BorderSizePixel = 0
FlingToggle.Position = UDim2.new(0, 20, 0, 220)  -- Position unter den anderen Toggles
FlingToggle.Size = UDim2.new(0, 100, 0, 30)
FlingToggle.Font = Enum.Font.Gotham
FlingToggle.Text = "Fling: OFF"
FlingToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FlingToggle.TextSize = 14

local FindMurderToggle = Instance.new("TextButton")
FindMurderToggle.Name = "FindMurderToggle"
FindMurderToggle.Parent = MainContent
FindMurderToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FindMurderToggle.BorderSizePixel = 0
FindMurderToggle.Position = UDim2.new(0, 20, 0, 120)  -- Unverändert, aber zur Klarheit
FindMurderToggle.Size = UDim2.new(0, 150, 0, 30)
FindMurderToggle.Font = Enum.Font.Gotham
FindMurderToggle.Text = "Find Murder: OFF"
FindMurderToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FindMurderToggle.TextSize = 14

local FindSheriffToggle = Instance.new("TextButton")
FindSheriffToggle.Name = "FindSheriffToggle"
FindSheriffToggle.Parent = MainContent
FindSheriffToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
FindSheriffToggle.BorderSizePixel = 0
FindSheriffToggle.Position = UDim2.new(0, 20, 0, 170)  -- Position unter FindMurderToggle
FindSheriffToggle.Size = UDim2.new(0, 150, 0, 30)
FindSheriffToggle.Font = Enum.Font.Gotham
FindSheriffToggle.Text = "Find Sheriff: OFF"
FindSheriffToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
FindSheriffToggle.TextSize = 14

-- Visuals Tab Content
local VisualsContent = Instance.new("ScrollingFrame")
VisualsContent.Name = "VisualsContent"
VisualsContent.Parent = ContentFrame
VisualsContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
VisualsContent.BorderSizePixel = 0
VisualsContent.Position = UDim2.new(0, 0, 0, 0)
VisualsContent.Size = UDim2.new(0, 500, 0, 320)
VisualsContent.ScrollBarThickness = 5
VisualsContent.Visible = false

local ItemEspToggle = Instance.new("TextButton")
ItemEspToggle.Name = "ItemEspToggle"
ItemEspToggle.Parent = VisualsContent
ItemEspToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ItemEspToggle.BorderSizePixel = 0
ItemEspToggle.Position = UDim2.new(0, 20, 0, 20)
ItemEspToggle.Size = UDim2.new(0, 150, 0, 30)
ItemEspToggle.Font = Enum.Font.Gotham
ItemEspToggle.Text = "Item ESP: OFF"
ItemEspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
ItemEspToggle.TextSize = 14

local PlayerEspToggle = Instance.new("TextButton")
PlayerEspToggle.Name = "PlayerEspToggle"
PlayerEspToggle.Parent = VisualsContent
PlayerEspToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerEspToggle.BorderSizePixel = 0
PlayerEspToggle.Position = UDim2.new(0, 20, 0, 70)
PlayerEspToggle.Size = UDim2.new(0, 150, 0, 30)
PlayerEspToggle.Font = Enum.Font.Gotham
PlayerEspToggle.Text = "Player ESP: OFF"
PlayerEspToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerEspToggle.TextSize = 14



-- Combat Tab Content
local CombatContent = Instance.new("ScrollingFrame")
CombatContent.Name = "CombatContent"
CombatContent.Parent = ContentFrame
CombatContent.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
CombatContent.BorderSizePixel = 0
CombatContent.Position = UDim2.new(0, 0, 0, 0)
CombatContent.Size = UDim2.new(0, 500, 0, 320)
CombatContent.ScrollBarThickness = 5
CombatContent.Visible = false

local AimbotToggle = Instance.new("TextButton")
AimbotToggle.Name = "AimbotToggle"
AimbotToggle.Parent = CombatContent
AimbotToggle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
AimbotToggle.BorderSizePixel = 0
AimbotToggle.Position = UDim2.new(0, 20, 0, 20)
AimbotToggle.Size = UDim2.new(0, 150, 0, 30)
AimbotToggle.Font = Enum.Font.Gotham
AimbotToggle.Text = "Aimbot: OFF"
AimbotToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotToggle.TextSize = 14

-- Variablen

local flyEnabled = false
local speedEnabled = false
local noclipEnabled = false  -- Neue Variable für NoClip
local itemEspEnabled = false
local playerEspEnabled = false
local aimbotEnabled = false
local findMurderEnabled = false
local flySpeed = 1.0
local murder = nil
local espObjects = {}
-- Player Tracker Variablen
local playerTrackerEnabled = false
local trackedPlayer = nil
local trackerConnection = nil
local trackerGui = nil
local sheriff = nil
local findSheriffEnabled = false
local flingEnabled = false
local flingTarget = nil
local flingGui = nil

-- Fly Funktion (korrigiert)
local function fly()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") or not Character:FindFirstChild("HumanoidRootPart") then return end
    
    local Humanoid = Character.Humanoid
    local HumanoidRootPart = Character.HumanoidRootPart
    
    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    bv.Parent = HumanoidRootPart
    
    local bg = Instance.new("BodyGyro")
    bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
    bg.Parent = HumanoidRootPart
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not flyEnabled then
            bv:Destroy()
            bg:Destroy()
            Humanoid.PlatformStand = false  -- Wichtig: PlatformStand zurücksetzen
            connection:Disconnect()
            return
        end
        
        Humanoid.PlatformStand = true
        -- Korrigierte Steuerung (vorwärts ist jetzt wirklich vorwärts)
        local moveDir = Vector3.new(
            (UserInputService:IsKeyDown(Enum.KeyCode.D) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.A) and 1 or 0),
            (UserInputService:IsKeyDown(Enum.KeyCode.Space) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) and 1 or 0),
            (UserInputService:IsKeyDown(Enum.KeyCode.S) and 1 or 0) - (UserInputService:IsKeyDown(Enum.KeyCode.W) and 1 or 0)
        )
        
        if moveDir ~= Vector3.new() then
            moveDir = moveDir.Unit
        end
        
        -- Bewegung relativ zur Kamerarichtung
        local cameraDirection = workspace.CurrentCamera.CFrame.LookVector
        local rightDirection = workspace.CurrentCamera.CFrame.RightVector
        
        local relativeMove = (rightDirection * moveDir.X + cameraDirection * (-moveDir.Z) + Vector3.new(0, moveDir.Y, 0))
        bv.Velocity = relativeMove * flySpeed * 20
        bg.CFrame = CFrame.new(HumanoidRootPart.Position, HumanoidRootPart.Position + cameraDirection)
    end)
end

-- Speed Funktion
local function speed()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") then return end
    
    local Humanoid = Character.Humanoid
    local originalWalkSpeed = Humanoid.WalkSpeed
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not speedEnabled then
            Humanoid.WalkSpeed = originalWalkSpeed
            connection:Disconnect()
            return
        end
        
        Humanoid.WalkSpeed = flySpeed * 10
    end)
end

-- Fling Funktion
local function flingPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
    
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    
    -- Speichere die ursprüngliche Position
    local originalPosition = Character.HumanoidRootPart.Position
    
    -- Bewege den Spieler zum Ziel
    Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 2)
    
    -- Warte kurz, damit die Position aktualisiert wird
    wait(0.1)
    
    -- Wende eine enorme Kraft auf das Ziel an
    local velocity = Instance.new("BodyVelocity")
    velocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    velocity.Velocity = Vector3.new(0, 10000, 0)  -- Enorme nach oben gerichtete Kraft
    velocity.Parent = targetPlayer.Character.HumanoidRootPart
    
    -- Entferne die Velocity nach kurzer Zeit
    game:GetService("Debris"):AddItem(velocity, 0.1)
    
    -- Alternative Methode: Direkte CFrame-Manipulation
    targetPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10000, 0)  -- Teleportiere den Spieler weit nach oben
    
    -- Warte kurz und bringe den eigenen Charakter zurück zur ursprünglichen Position
    wait(0.2)
    Character.HumanoidRootPart.CFrame = CFrame.new(originalPosition)
end

-- NoClip Funktion (verbessert)
local function noclip()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") then return end
    
    local Humanoid = Character.Humanoid
    
    local connection
    connection = RunService.Stepped:Connect(function()
        if not noclipEnabled then
            -- Setze den Normalzustand zurück
            for _, part in ipairs(Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
            Humanoid:ChangeState("Standing")
            connection:Disconnect()
            return
        end
        
        -- Deaktiviere Collision für alle Teile des Charakters
        for _, part in ipairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end)
end

-- Item ESP Funktion (verbessert)
local function createItemESP(item)
    -- Entferne alte ESP, falls vorhanden
    local oldESP = item:FindFirstChild("ItemESP")
    if oldESP then
        oldESP:Destroy()
    end
    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "ItemESP"
    BillboardGui.Parent = item
    BillboardGui.Adornee = item
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    BillboardGui.AlwaysOnTop = true
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
    Frame.BackgroundTransparency = 0.3
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = item.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, BillboardGui)
end

-- Player ESP Funktion
local function createPlayerESP(player)
    local Character = player.Character
    if not Character then return end
    
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "PlayerESP"
    Highlight.Parent = Character
    Highlight.FillColor = Color3.fromRGB(255, 0, 0)
    Highlight.FillTransparency = 0.5
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "NameESP"
    BillboardGui.Parent = Character:FindFirstChild("Head")
    BillboardGui.Adornee = Character:FindFirstChild("Head")
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = player.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, Highlight)
    table.insert(espObjects, BillboardGui)
end



-- Murder ESP Funktion
local function createMurderESP(player)
    local Character = player.Character
    if not Character then return end
    
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "MurderESP"
    Highlight.Parent = Character
    Highlight.FillColor = Color3.fromRGB(0, 0, 255)
    Highlight.FillTransparency = 0.5
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "MurderNameESP"
    BillboardGui.Parent = Character:FindFirstChild("Head")
    BillboardGui.Adornee = Character:FindFirstChild("Head")
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = "MURDERER: " .. player.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, Highlight)
    table.insert(espObjects, BillboardGui)
end


-- Sheriff ESP Funktion
local function createSheriffESP(player)
    local Character = player.Character
    if not Character then return end
    
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "SheriffESP"
    Highlight.Parent = Character
    Highlight.FillColor = Color3.fromRGB(0, 255, 0)
    Highlight.FillTransparency = 0.5
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    
    local BillboardGui = Instance.new("BillboardGui")
    BillboardGui.Name = "SheriffNameESP"
    BillboardGui.Parent = Character:FindFirstChild("Head")
    BillboardGui.Adornee = Character:FindFirstChild("Head")
    BillboardGui.Size = UDim2.new(0, 100, 0, 50)
    BillboardGui.StudsOffset = Vector3.new(0, 2, 0)
    
    local Frame = Instance.new("Frame")
    Frame.Parent = BillboardGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Size = UDim2.new(1, 0, 1, 0)
    
    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.BackgroundTransparency = 1
    TextLabel.Size = UDim2.new(1, 0, 1, 0)
    TextLabel.Font = Enum.Font.SourceSansBold
    TextLabel.Text = "SHERIFF: " .. player.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14
    
    table.insert(espObjects, Highlight)
    table.insert(espObjects, BillboardGui)
end

-- Find Murder Funktion (korrigiert)
local function findMurder()
    murder = nil
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            -- Überprüfe auf verschiedene Möglichkeiten, wie das Messer im Spiel heißen könnte
            local knifeFound = false
            
            -- Prüfe auf Tool namens "Knife"
            for _, item in ipairs(player.Character:GetChildren()) do
                if item:IsA("Tool") and (item.Name == "Knife" or item.Name == "Machete" or string.find(string.lower(item.Name), "knife") or string.find(string.lower(item.Name), "murder")) then
                    murder = player
                    knifeFound = true
                    break
                end
            end
            
            -- Alternative Prüfung: Überprüfe auf Backpack mit Messer
            if not knifeFound then
                for _, item in ipairs(player.Backpack:GetChildren()) do
                    if item:IsA("Tool") and (item.Name == "Knife" or item.Name == "Machete" or string.find(string.lower(item.Name), "knife") or string.find(string.lower(item.Name), "murder")) then
                        murder = player
                        knifeFound = true
                        break
                    end
                end
            end
            
            -- Prüfe auf spezielle Charakter-Eigenschaften, die auf den Mörder hindeuten könnten
            if not knifeFound then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    -- In vielen Murder Mystery Spielen hat der Mörder eine besondere BodyColor oder ein anderes Merkmal
                    local bodyColors = player.Character:FindFirstChild("Body Colors")
                    if bodyColors then
                        -- Manchmal hat der Mörder eine bestimmte Kopf- oder Torso-Farbe
                        if bodyColors.HeadColor == Color3.new(0.905882, 0.905882, 0.905882) and bodyColors.TorsoColor == Color3.new(0.905882, 0.905882, 0.905882) then
                            murder = player
                        end
                    end
                end
            end
            
            if murder then
                createMurderESP(murder)
                return player
            end
        end
    end
    return nil
end

-- Find Sheriff Funktion
local function findSheriff()
    local sheriff = nil
    
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            -- Überprüfe auf verschiedene Möglichkeiten, wie die Waffe im Spiel heißen könnte
            local gunFound = false
            
            -- Prüfe auf Tool namens "Gun", "Pistol" oder ähnliches
            for _, item in ipairs(player.Character:GetChildren()) do
                if item:IsA("Tool") and (item.Name == "Gun" or item.Name == "Pistol" or item.Name == "Revolver" or string.find(string.lower(item.Name), "gun") or string.find(string.lower(item.Name), "pistol")) then
                    sheriff = player
                    gunFound = true
                    break
                end
            end
            
            -- Alternative Prüfung: Überprüfe auf Backpack mit Waffe
            if not gunFound then
                for _, item in ipairs(player.Backpack:GetChildren()) do
                    if item:IsA("Tool") and (item.Name == "Gun" or item.Name == "Pistol" or item.Name == "Revolver" or string.find(string.lower(item.Name), "gun") or string.find(string.lower(item.Name), "pistol")) then
                        sheriff = player
                        gunFound = true
                        break
                    end
                end
            end
            
            -- Prüfe auf spezielle Charakter-Eigenschaften, die auf den Sheriff hindeuten könnten
            if not gunFound then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    -- In vielen Murder Mystery Spielen hat der Sheriff eine besondere BodyColor
                    local bodyColors = player.Character:FindFirstChild("Body Colors")
                    if bodyColors then
                        -- Manchmal hat der Sheriff eine bestimmte Kopf- oder Torso-Farbe
                        if bodyColors.HeadColor == Color3.new(0.0666667, 0.0666667, 0.0666667) and bodyColors.TorsoColor == Color3.new(0.0666667, 0.0666667, 0.0666667) then
                            sheriff = player
                        end
                    end
                end
            end
            
            if sheriff then
                return player
            end
        end
    end
    return nil
end

-- Aimbot Funktion
local function aimbot()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("Humanoid") then return end
    
    local targetPlayer = nil
    
    -- Zielt nur auf den Mörder, wenn Find Murder aktiviert ist
    if findMurderEnabled and murder and murder.Character and murder.Character:FindFirstChild("HumanoidRootPart") then
        targetPlayer = murder
    -- Ansonsten auf den nächsten Gegner (wenn nur Aimbot aktiv ist)
    elseif aimbotEnabled and not findMurderEnabled then
        local closestDistance = math.huge
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (player.Character.HumanoidRootPart.Position - Character.HumanoidRootPart.Position).Magnitude
                
                if distance < closestDistance then
                    targetPlayer = player
                    closestDistance = distance
                end
            end
        end
    end
    
    if targetPlayer and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        local targetCFrame = CFrame.new(Character.HumanoidRootPart.Position, targetPosition)
        
        -- Überprüfe, ob wir in der Third-Person-Ansicht sind
        local camera = workspace.CurrentCamera
        local distance = (camera.CFrame.Position - camera.Focus.Position).Magnitude
        
        if distance > 0.5 then  -- Third-Person/External View
            -- In der Außensicht: Ändere die Kameraausrichtung
            camera.CFrame = camera.CFrame:Lerp(targetCFrame, 0.1)
        else  -- First-Person/Internal View
            -- In der Innensicht: Ändere die Charakterausrichtung
            Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame:Lerp(targetCFrame, 0.1)
        end
    end
end

-- Erstelle die Player Tracker UI
local function createTrackerUI()
    if trackerGui then
        trackerGui:Destroy()
    end
    
    trackerGui = Instance.new("ScreenGui")
    trackerGui.Name = "PlayerTrackerGui"
    trackerGui.Parent = ScreenGui.Parent  -- Verwende denselben Parent wie die Haupt-UI
    trackerGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local TrackerFrame = Instance.new("Frame")
    TrackerFrame.Name = "TrackerFrame"
    TrackerFrame.Parent = trackerGui
    TrackerFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TrackerFrame.BorderSizePixel = 0
    TrackerFrame.Position = UDim2.new(0, 520, 0.5, -150)  -- Position neben der Haupt-UI
    TrackerFrame.Size = UDim2.new(0, 250, 0, 300)
    TrackerFrame.Active = true
    TrackerFrame.Draggable = true
    
    local TrackerTitle = Instance.new("TextLabel")
    TrackerTitle.Name = "TrackerTitle"
    TrackerTitle.Parent = TrackerFrame
    TrackerTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TrackerTitle.BorderSizePixel = 0
    TrackerTitle.Position = UDim2.new(0, 0, 0, 0)
    TrackerTitle.Size = UDim2.new(0, 250, 0, 30)
    TrackerTitle.Font = Enum.Font.GothamBold
    TrackerTitle.Text = "Player Tracker"
    TrackerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    TrackerTitle.TextSize = 18
    
    local CloseTrackerButton = Instance.new("TextButton")
    CloseTrackerButton.Name = "CloseTrackerButton"
    CloseTrackerButton.Parent = TrackerFrame
    CloseTrackerButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseTrackerButton.BorderSizePixel = 0
    CloseTrackerButton.Position = UDim2.new(0, 220, 0, 5)
    CloseTrackerButton.Size = UDim2.new(0, 25, 0, 20)
    CloseTrackerButton.Font = Enum.Font.SourceSans
    CloseTrackerButton.Text = "X"
    CloseTrackerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseTrackerButton.TextSize = 14
    
    local PlayerListFrame = Instance.new("ScrollingFrame")
    PlayerListFrame.Name = "PlayerListFrame"
    PlayerListFrame.Parent = TrackerFrame
    PlayerListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    PlayerListFrame.BorderSizePixel = 0
    PlayerListFrame.Position = UDim2.new(0, 0, 0, 30)
    PlayerListFrame.Size = UDim2.new(0, 250, 0, 270)
    PlayerListFrame.ScrollBarThickness = 5
    
    -- Fülle die Spielerliste
    local function updatePlayerList()
        -- Lösche alte Einträge
        for _, child in ipairs(PlayerListFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Füge alle Spieler hinzu
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local PlayerButton = Instance.new("TextButton")
                PlayerButton.Name = "PlayerButton"
                PlayerButton.Parent = PlayerListFrame
                PlayerButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                PlayerButton.BorderSizePixel = 0
                PlayerButton.Position = UDim2.new(0, 10, 0, #PlayerListFrame:GetChildren() * 35)
                PlayerButton.Size = UDim2.new(0, 230, 0, 30)
                PlayerButton.Font = Enum.Font.Gotham
                PlayerButton.Text = player.Name
                PlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerButton.TextSize = 14
                
                -- Markiere den verfolgten Spieler
                if trackedPlayer == player then
                    PlayerButton.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
                end
                
                PlayerButton.MouseButton1Click:Connect(function()
                    trackPlayer(player)
                    updatePlayerList()  -- Aktualisiere die Liste, um die Markierung zu aktualisieren
                end)
            end
        end
        
        -- Setze die CanvasSize basierend auf der Anzahl der Spieler
        PlayerListFrame.CanvasSize = UDim2.new(0, 0, 0, #PlayerListFrame:GetChildren() * 35)
    end
    
    -- Event Handler
    CloseTrackerButton.MouseButton1Click:Connect(function()
        playerTrackerEnabled = false
        trackPlayer(nil)  -- Beende das Tracking
        trackerGui:Destroy()
        trackerGui = nil
    end)
    
    -- Aktualisiere die Spielerliste, wenn ein Spieler hinzugefügt oder entfernt wird
    Players.PlayerAdded:Connect(updatePlayerList)
    Players.PlayerRemoving:Connect(updatePlayerList)
    
    -- Initiale Aktualisierung
    updatePlayerList()
    
    return trackerGui
end

-- Erstelle die Fling UI
local function createFlingUI()
    if flingGui then
        flingGui:Destroy()
    end
    
    flingGui = Instance.new("ScreenGui")
    flingGui.Name = "FlingGui"
    flingGui.Parent = ScreenGui.Parent  -- Verwende denselben Parent wie die Haupt-UI
    flingGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local FlingFrame = Instance.new("Frame")
    FlingFrame.Name = "FlingFrame"
    FlingFrame.Parent = flingGui
    FlingFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    FlingFrame.BorderSizePixel = 0
    FlingFrame.Position = UDim2.new(0, 520, 0.5, -150)  -- Position neben der Haupt-UI
    FlingFrame.Size = UDim2.new(0, 250, 0, 300)
    FlingFrame.Active = true
    FlingFrame.Draggable = true
    
    local FlingTitle = Instance.new("TextLabel")
    FlingTitle.Name = "FlingTitle"
    FlingTitle.Parent = FlingFrame
    FlingTitle.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    FlingTitle.BorderSizePixel = 0
    FlingTitle.Position = UDim2.new(0, 0, 0, 0)
    FlingTitle.Size = UDim2.new(0, 250, 0, 30)
    FlingTitle.Font = Enum.Font.GothamBold
    FlingTitle.Text = "Player Fling"
    FlingTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    FlingTitle.TextSize = 18
    
    local CloseFlingButton = Instance.new("TextButton")
    CloseFlingButton.Name = "CloseFlingButton"
    CloseFlingButton.Parent = FlingFrame
    CloseFlingButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    CloseFlingButton.BorderSizePixel = 0
    CloseFlingButton.Position = UDim2.new(0, 220, 0, 5)
    CloseFlingButton.Size = UDim2.new(0, 25, 0, 20)
    CloseFlingButton.Font = Enum.Font.SourceSans
    CloseFlingButton.Text = "X"
    CloseFlingButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseFlingButton.TextSize = 14
    
    local PlayerListFrame = Instance.new("ScrollingFrame")
    PlayerListFrame.Name = "PlayerListFrame"
    PlayerListFrame.Parent = FlingFrame
    PlayerListFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    PlayerListFrame.BorderSizePixel = 0
    PlayerListFrame.Position = UDim2.new(0, 0, 0, 30)
    PlayerListFrame.Size = UDim2.new(0, 250, 0, 270)
    PlayerListFrame.ScrollBarThickness = 5
    
    -- Fülle die Spielerliste
    local function updatePlayerList()
        -- Lösche alte Einträge
        for _, child in ipairs(PlayerListFrame:GetChildren()) do
            if child:IsA("TextButton") then
                child:Destroy()
            end
        end
        
        -- Füge alle Spieler hinzu
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                local PlayerButton = Instance.new("TextButton")
                PlayerButton.Name = "PlayerButton"
                PlayerButton.Parent = PlayerListFrame
                PlayerButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                PlayerButton.BorderSizePixel = 0
                PlayerButton.Position = UDim2.new(0, 10, 0, #PlayerListFrame:GetChildren() * 35)
                PlayerButton.Size = UDim2.new(0, 230, 0, 30)
                PlayerButton.Font = Enum.Font.Gotham
                PlayerButton.Text = player.Name
                PlayerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                PlayerButton.TextSize = 14
                
                -- Markiere das aktuelle Ziel
                if flingTarget == player then
                    PlayerButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
                end
                
                PlayerButton.MouseButton1Click:Connect(function()
                    flingTarget = player
                    flingPlayer(player)  -- Führe den Fling sofort aus
                    updatePlayerList()  -- Aktualisiere die Liste, um die Markierung zu aktualisieren
                end)
            end
        end
        
        -- Setze die CanvasSize basierend auf der Anzahl der Spieler
        PlayerListFrame.CanvasSize = UDim2.new(0, 0, 0, #PlayerListFrame:GetChildren() * 35)
    end
    
    -- Event Handler
    CloseFlingButton.MouseButton1Click:Connect(function()
        flingEnabled = false
        flingTarget = nil
        flingGui:Destroy()
        flingGui = nil
    end)
    
    -- Aktualisiere die Spielerliste, wenn ein Spieler hinzugefügt oder entfernt wird
    Players.PlayerAdded:Connect(updatePlayerList)
    Players.PlayerRemoving:Connect(updatePlayerList)
    
    -- Initiale Aktualisierung
    updatePlayerList()
    
    return flingGui
end

-- Event Handler
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

MainTab.MouseButton1Click:Connect(function()
    MainContent.Visible = true
    VisualsContent.Visible = false
    CombatContent.Visible = false
    
    MainTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CombatTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
end)

VisualsTab.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    VisualsContent.Visible = true
    CombatContent.Visible = false
    
    MainTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    CombatTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
end)

CombatTab.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    VisualsContent.Visible = false
    CombatContent.Visible = true
    
    MainTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    VisualsTab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    CombatTab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
end)

FlyToggle.MouseButton1Click:Connect(function()
    flyEnabled = not flyEnabled
    FlyToggle.Text = "Fly: " .. (flyEnabled and "ON" or "OFF")
    
    if flyEnabled then
        fly()
    end
end)

SpeedToggle.MouseButton1Click:Connect(function()
    speedEnabled = not speedEnabled
    SpeedToggle.Text = "Speed: " .. (speedEnabled and "ON" or "OFF")
    
    if speedEnabled then
        speed()
    end
end)

NoClipToggle.MouseButton1Click:Connect(function()
    noclipEnabled = not noclipEnabled  -- Verwende die neue Variable
    NoClipToggle.Text = "NoClip: " .. (noclipEnabled and "ON" or "OFF")
    
    if noclipEnabled then
        noclip()
    end
end)

PlayerTrackerToggle.MouseButton1Click:Connect(function()
    playerTrackerEnabled = not playerTrackerEnabled
    PlayerTrackerToggle.Text = "Tracker: " .. (playerTrackerEnabled and "ON" or "OFF")
    
    if playerTrackerEnabled then
        createTrackerUI()
    else
        trackPlayer(nil)  -- Beende das Tracking
        if trackerGui then
            trackerGui:Destroy()
            trackerGui = nil
        end
    end
end)

FlingToggle.MouseButton1Click:Connect(function()
    flingEnabled = not flingEnabled
    FlingToggle.Text = "Fling: " .. (flingEnabled and "ON" or "OFF")
    
    if flingEnabled then
        createFlingUI()
    else
        flingTarget = nil
        if flingGui then
            flingGui:Destroy()
            flingGui = nil
        end
    end
end)

ItemEspToggle.MouseButton1Click:Connect(function()
    itemEspEnabled = not itemEspEnabled
    ItemEspToggle.Text = "Item ESP: " .. (itemEspEnabled and "ON" or "OFF")
    
    if itemEspEnabled then
        -- Überprüfe alle Items im Workspace
        for _, item in ipairs(workspace:GetDescendants()) do
            if item:IsA("Tool") and item.Parent ~= LocalPlayer.Character then
                createItemESP(item)
            end
        end
        
        -- Überprüfe auch auf Modelle, die Waffen enthalten könnten
        for _, item in ipairs(workspace:GetDescendants()) do
            if item:IsA("Model") and item.Parent ~= LocalPlayer.Character then
                for _, child in ipairs(item:GetChildren()) do
                    if child:IsA("Tool") then
                        createItemESP(child)
                    end
                end
            end
        end
        
        -- Event für neue Items
        local itemAddedConnection
        itemAddedConnection = workspace.ChildAdded:Connect(function(child)
            if itemEspEnabled then
                -- Direkte Tools
                if child:IsA("Tool") and child.Parent ~= LocalPlayer.Character then
                    wait(0.1)  -- Kurze Verzögerung, damit das Item vollständig geladen ist
                    createItemESP(child)
                -- Modelle, die Tools enthalten könnten
                elseif child:IsA("Model") then
                    wait(0.1)
                    for _, subChild in ipairs(child:GetChildren()) do
                        if subChild:IsA("Tool") then
                            createItemESP(subChild)
                        end
                    end
                end
            end
        end)
        
        -- Speichere die Verbindung, um sie später zu trennen
        table.insert(espObjects, {Connection = itemAddedConnection})
    else
        -- Entferne alle Item ESPs
        for _, obj in ipairs(espObjects) do
            if type(obj) == "table" and obj.Connection then
                obj.Connection:Disconnect()
            elseif obj.Name == "ItemESP" then
                obj:Destroy()
            end
        end
        
        -- Bereinige die espObjects Tabelle
        espObjects = {}
    end
end)

PlayerEspToggle.MouseButton1Click:Connect(function()
    playerEspEnabled = not playerEspEnabled
    PlayerEspToggle.Text = "Player ESP: " .. (playerEspEnabled and "ON" or "OFF")
    
    if playerEspEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer then
                createPlayerESP(player)
            end
        end
        
        Players.PlayerAdded:Connect(function(player)
            if playerEspEnabled then
                createPlayerESP(player)
            end
        end)
    else
        for _, obj in ipairs(espObjects) do
            if obj.Name == "PlayerESP" or obj.Name == "NameESP" then
                obj:Destroy()
            end
        end
    end
end)

AimbotToggle.MouseButton1Click:Connect(function()
    aimbotEnabled = not aimbotEnabled
    AimbotToggle.Text = "Aimbot: " .. (aimbotEnabled and "ON" or "OFF")
    
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not aimbotEnabled then
            connection:Disconnect()
            return
        end
        
        aimbot()
    end)
end)

FindMurderToggle.MouseButton1Click:Connect(function()
    findMurderEnabled = not findMurderEnabled
    FindMurderToggle.Text = "Find Murder: " .. (findMurderEnabled and "ON" or "OFF")
    
    if findMurderEnabled then
        findMurder()
    else
        murder = nil
        for _, obj in ipairs(espObjects) do
            if obj.Name == "MurderESP" or obj.Name == "MurderNameESP" then
                obj:Destroy()
            end
        end
    end
end)

FindSheriffToggle.MouseButton1Click:Connect(function()
    findSheriffEnabled = not findSheriffEnabled
    FindSheriffToggle.Text = "Find Sheriff: " .. (findSheriffEnabled and "ON" or "OFF")
    
    if findSheriffEnabled then
        sheriff = findSheriff()
        if sheriff then
            createSheriffESP(sheriff)
        end
    else
        sheriff = nil
        for _, obj in ipairs(espObjects) do
            if obj.Name == "SheriffESP" or obj.Name == "SheriffNameESP" then
                obj:Destroy()
            end
        end
    end
end)

-- Fly Speed Slider
local isDragging = false

FlySpeedSlider.MouseButton1Down:Connect(function()
    isDragging = true
end)

UserInputService.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local mousePos = UserInputService:GetMouseLocation()
        local sliderPos = FlySpeedSlider.AbsolutePosition
        local sliderSize = FlySpeedSlider.AbsoluteSize
        
        local relativeX = math.clamp((mousePos.X - sliderPos.X) / sliderSize.X, 0, 1)
        flySpeed = 0.1 + relativeX * 49.9
        FlySpeedLabel.Text = "Speed: " .. string.format("%.1f", flySpeed)
        
        -- Update slider fill
        local fill = FlySpeedSlider:FindFirstChild("Fill")
        if not fill then
            fill = Instance.new("Frame")
            fill.Name = "Fill"
            fill.Parent = FlySpeedSlider
            fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            fill.BorderSizePixel = 0
            fill.Position = UDim2.new(0, 0, 0, 0)
            fill.Size = UDim2.new(relativeX, 0, 1, 0)
        else
            fill.Size = UDim2.new(relativeX, 0, 1, 0)
        end
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)


    
-- Verbesserte Überprüfungsfunktion
local function checkForMurder()
    if findMurderEnabled then
        local newMurder = findMurder()
        if newMurder and newMurder ~= murder then
            murder = newMurder
            -- Entferne alte Murder ESP
            for _, obj in ipairs(espObjects) do
                if obj.Name == "MurderESP" or obj.Name == "MurderNameESP" then
                    obj:Destroy()
                end
            end
            -- Erstelle neue Murder ESP
            createMurderESP(murder)
        elseif newMurder == nil and murder ~= nil then
            -- Mörder wurde nicht gefunden, aber wir hatten vorher einen
            murder = nil
            -- Entferne alte Murder ESP
            for _, obj in ipairs(espObjects) do
                if obj.Name == "MurderESP" or obj.Name == "MurderNameESP" then
                    obj:Destroy()
                end
            end
        end
    end
end

-- Verbesserte Überprüfungsfunktion für Sheriff
local function checkForSheriff()
    if findSheriffEnabled then
        local newSheriff = findSheriff()
        if newSheriff and newSheriff ~= sheriff then
            sheriff = newSheriff
            -- Entferne alte Sheriff ESP
            for _, obj in ipairs(espObjects) do
                if obj.Name == "SheriffESP" or obj.Name == "SheriffNameESP" then
                    obj:Destroy()
                end
            end
            -- Erstelle neue Sheriff ESP
            createSheriffESP(sheriff)
        elseif newSheriff == nil and sheriff ~= nil then
            -- Sheriff wurde nicht gefunden, aber wir hatten vorher einen
            sheriff = nil
            -- Entferne alte Sheriff ESP
            for _, obj in ipairs(espObjects) do
                if obj.Name == "SheriffESP" or obj.Name == "SheriffNameESP" then
                    obj:Destroy()
                end
            end
        end
    end
end
    
  -- Überprüfe alle 2 Sekunden nach dem Mörder
spawn(function()
    while true do
        wait(2)
        checkForMurder()
    end
end)

-- Überprüfe alle 2 Sekunden nach dem Sheriff
spawn(function()
    while true do
        wait(2)
        checkForSheriff()
    end
end)




-- Verbesserte Initialisierung
local function initialize()
    -- Setze initialen Slider-Wert
    local fill = Instance.new("Frame")
    fill.Name = "Fill"
    fill.Parent = FlySpeedSlider
    fill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    fill.BorderSizePixel = 0
    fill.Position = UDim2.new(0, 0, 0, 0)
    fill.Size = UDim2.new(0.018, 0, 1, 0)  -- 0.1 / 50.0 = 0.018
    
    -- Überprüfe periodisch nach dem Mörder und Sheriff
    spawn(function()
        while true do
            wait(0.5)  -- Alle 0.5 Sekunden überprüfen
            checkForMurder()
            checkForSheriff()
        end
    end)
    
    -- Zusätzliche Überprüfung, wenn ein Spieler stirbt oder respawnt
    Players.PlayerAdded:Connect(function(player)
        player.CharacterAdded:Connect(function(character)
            if findMurderEnabled or findSheriffEnabled then
                wait(1)  -- Warte kurz, damit das Character geladen ist
                checkForMurder()
                checkForSheriff()
            end
        end)
    end)
    
    -- Überprüfe auch, wenn sich etwas im Workspace ändert
    workspace.ChildAdded:Connect(function(child)
        if (findMurderEnabled or findSheriffEnabled) and child:IsA("Tool") then
            wait(0.2)
            checkForMurder()
            checkForSheriff()
        end
    end)
end

initialize()

print("Murder Mystery Hack by Venice geladen!")
