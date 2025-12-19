-- WHITELIST USERNAME
local Whitelist = {
    "Asdd5644",
    "FATONGJLS",
    "ZADa_62849",
    "NewPlayer29339",
    "mmmjnj",
    "Patrickstarnibos",
    "Rezz_8850",
    "wongirengjembutennn7",
    "lyan_vivix",
    "gak_tau4564",
    "ZENLIAK"
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function isWhitelisted(name)
    for _, allowed in ipairs(Whitelist) do
        if string.lower(name) == string.lower(allowed) then
            return true
        end
    end
    return false
end

if not isWhitelisted(LocalPlayer.Name) then
    local Screen = Instance.new("ScreenGui")
    Screen.Parent = PlayerGui
    Screen.IgnoreGuiInset = true

    local Frame = Instance.new("Frame", Screen)
    Frame.Size = UDim2.new(1,0,1,0)
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

    local Text = Instance.new("TextLabel", Frame)
    Text.Size = UDim2.new(1,0,0.2,0)
    Text.Position = UDim2.new(0,0,0.4,0)
    Text.BackgroundTransparency = 1
    Text.Font = Enum.Font.GothamBold
    Text.TextColor3 = Color3.fromRGB(255,60,60)
    Text.TextScaled = true
    Text.Text = "Script Loaded pls wait"

    task.wait(3)
    LocalPlayer:Kick("You're not authorized to use this script")
    return
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Camera = Workspace.CurrentCamera
local StarterGui = game:GetService("StarterGui")
local player = Players.LocalPlayer

-- ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "LockPlayerV5"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- Sound klik
local clickSound = Instance.new("Sound", gui)
clickSound.SoundId = "rbxassetid://7149512484"
clickSound.Volume = 1

-- Notify
local function notify(msg)
    StarterGui:SetCore("SendNotification", {Title = "LockPlayerV5", Text = msg, Duration = 4})
end

-- Dragify smooth
local function dragify(frame)
    local dragToggle = false
    local dragInput, dragStart, startPos
    local dragSpeed = 0.12

    frame.InputBegan:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
            dragToggle = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragToggle = false
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragToggle then
            local delta = input.Position - dragStart
            local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            TweenService:Create(frame, TweenInfo.new(dragSpeed), {Position = newPos}):Play()
        end
    end)
end

-- Toggle Button
local toggleBtn = Instance.new("ImageButton", gui)
toggleBtn.Size = UDim2.new(0, 50, 0, 50)
toggleBtn.Position = UDim2.new(0.5, -40, 0.5, -40)
toggleBtn.BackgroundTransparency = 1
toggleBtn.Image = "rbxassetid://93429775553017"
toggleBtn.Visible = true
Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(1, 0)
local tbStroke = Instance.new("UIStroke", toggleBtn)
tbStroke.Color = Color3.fromRGB(180, 0, 255)
tbStroke.Thickness = 2
dragify(toggleBtn)

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 0, 0, 0)
main.Position = UDim2.new(0.32, 0, 0.25, 0)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0
main.Visible = false
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Color = Color3.fromRGB(180, 0, 255)
mainStroke.Thickness = 2
dragify(main)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -120, 0, 36)
title.Position = UDim2.new(0, 16, 0, 8)
title.BackgroundTransparency = 1
title.BackgroundColor3 = Color3.new(0,0,0)
title.Text = "LockPlayerV5 Ultimate | By: SibahCH"
title.Font = Enum.Font.FredokaOne
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(180, 0, 255)
title.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
local closeBtn = Instance.new("TextButton", main)
closeBtn.Size = UDim2.new(0, 36, 0, 36)
closeBtn.Position = UDim2.new(1, -44, 0, 8)
closeBtn.BackgroundTransparency = 1
closeBtn.BackgroundColor3 = Color3.new(0,0,0)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(200, 100, 255)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 20

-- Target Box
local targetBox = Instance.new("TextBox", main)
targetBox.Size = UDim2.new(0, 340, 0, 36)
targetBox.Position = UDim2.new(0, 20, 0, 50)
targetBox.BackgroundColor3 = Color3.fromRGB(25, 10, 50)
targetBox.BackgroundTransparency = 0.4
targetBox.PlaceholderText = "T4rget here"
targetBox.TextColor3 = Color3.fromRGB(200, 150, 255)
targetBox.Font = Enum.Font.Gotham
targetBox.TextSize = 14
Instance.new("UICorner", targetBox).CornerRadius = UDim.new(0,8)
local boxStroke = Instance.new("UIStroke", targetBox)
boxStroke.Color = Color3.fromRGB(180, 0, 255)
boxStroke.Thickness = 1.2

-- Players List Button
local listBtn = Instance.new("TextButton", main)
listBtn.Size = UDim2.new(0, 340, 0, 36)
listBtn.Position = UDim2.new(0, 20, 0, 100)
listBtn.BackgroundColor3 = Color3.fromRGB(25, 10, 50)
listBtn.BackgroundTransparency = 0.4
listBtn.Text = "📋 Players List"
listBtn.TextColor3 = Color3.fromRGB(180, 0, 255)
listBtn.Font = Enum.Font.GothamBold
listBtn.TextSize = 16
Instance.new("UICorner", listBtn).CornerRadius = UDim.new(0,8)
local listBtnStroke = Instance.new("UIStroke", listBtn)
listBtnStroke.Color = Color3.fromRGB(180, 0, 255)
listBtnStroke.Thickness = 1.2

-- Fling Button
local flingBtn = Instance.new("TextButton", main)
flingBtn.Size = UDim2.new(0, 100, 0, 36)
flingBtn.Position = UDim2.new(0, 20, 0, 150)
flingBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 80)
flingBtn.BackgroundTransparency = 0.4
flingBtn.Text = "Fling OFF"
flingBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", flingBtn).CornerRadius = UDim.new(0,8)
local fStroke = Instance.new("UIStroke", flingBtn)
fStroke.Color = Color3.fromRGB(180, 0, 255)
fStroke.Thickness = 2

-- Kill Button
local killBtn = Instance.new("TextButton", main)
killBtn.Size = UDim2.new(0, 100, 0, 36)
killBtn.Position = UDim2.new(0, 140, 0, 150)
killBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
killBtn.BackgroundTransparency = 0.4
killBtn.Text = "Kill"
killBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", killBtn).CornerRadius = UDim.new(0,8)
local kStroke = Instance.new("UIStroke", killBtn)
kStroke.Color = Color3.fromRGB(220, 0, 255)
kStroke.Thickness = 2

-- View Button
local viewBtn = Instance.new("TextButton", main)
viewBtn.Size = UDim2.new(0, 100, 0, 36)
viewBtn.Position = UDim2.new(0, 260, 0, 150)
viewBtn.BackgroundColor3 = Color3.fromRGB(40, 0, 100)
viewBtn.BackgroundTransparency = 0.4
viewBtn.Text = "View"
viewBtn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", viewBtn).CornerRadius = UDim.new(0,8)
local vStroke = Instance.new("UIStroke", viewBtn)
vStroke.Color = Color3.fromRGB(150, 0, 255)
vStroke.Thickness = 2

-- Animation
local elements = {title, closeBtn, targetBox, boxStroke, listBtn, listBtnStroke, flingBtn, fStroke, killBtn, kStroke, viewBtn, vStroke}

local function showElements()
    for _, el in ipairs(elements) do
        if el:IsA("GuiObject") then
            el.Visible = true
            el.BackgroundTransparency = 1
            el.TextTransparency = 1
            if el:IsA("UIStroke") then el.Transparency = 1 end
        end
    end

    task.delay(0.1, function()
        for i, el in ipairs(elements) do
            task.delay(i * 0.05, function()
                TweenService:Create(el, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    BackgroundTransparency = el:IsA("GuiObject") and 0.4 or el.Transparency,
                    TextTransparency = el:IsA("GuiObject") and 0 or el.TextTransparency,
                }):Play()
                if el:IsA("UIStroke") then
                    TweenService:Create(el, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 0}):Play()
                end
            end)
        end
    end)
end

local function hideElements()
    for _, el in ipairs(elements) do
        TweenService:Create(el, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            BackgroundTransparency = 1,
            TextTransparency = 1,
        }):Play()
        if el:IsA("UIStroke") then
            TweenService:Create(el, TweenInfo.new(0.26, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Transparency = 1}):Play()
        end
    end
end

-- Toggle GUI
local guiOpen = false
local function toggleGUI()
    clickSound:Play()
    guiOpen = not guiOpen
    if guiOpen then
        main.Visible = true
        TweenService:Create(main, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 320)}):Play()
        showElements()
    else
        hideElements()
        local shrink = TweenService:Create(main, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
        shrink:Play()
        shrink.Completed:Connect(function()
            main.Visible = false
        end)
    end
end

toggleBtn.MouseButton1Click:Connect(toggleGUI)
closeBtn.MouseButton1Click:Connect(toggleGUI)

-- list player
local listGui = nil
local function showPlayerList()
    if listGui then listGui:Destroy() end

    listGui = Instance.new("Frame", gui)
    listGui.Size = UDim2.new(0, 320, 0, 420)
    listGui.Position = UDim2.new(0.5, -160, 0.5, -210)
    listGui.BackgroundColor3 = Color3.fromRGB(15, 5, 30)
    listGui.BackgroundTransparency = 0.35
    Instance.new("UICorner", listGui).CornerRadius = UDim.new(0,12)
    local listStroke = Instance.new("UIStroke", listGui)
    listStroke.Color = Color3.fromRGB(180, 0, 255)
    listStroke.Thickness = 2
    dragify(listGui)

    local listTitle = Instance.new("TextLabel", listGui)
    listTitle.Size = UDim2.new(1, -80, 0, 36)
    listTitle.Position = UDim2.new(0, 16, 0, 8)
    listTitle.BackgroundTransparency = 1
    listTitle.Text = "📋 List Player"
    listTitle.Font = Enum.Font.FredokaOne
    listTitle.TextSize = 18
    listTitle.TextColor3 = Color3.fromRGB(180, 0, 255)
    listTitle.TextXAlignment = Enum.TextXAlignment.Left

    local listCloseBtn = Instance.new("TextButton", listGui)
    listCloseBtn.Size = UDim2.new(0, 38, 0, 36)
    listCloseBtn.Position = UDim2.new(1, -54, 0, 8)
    listCloseBtn.Text = "✖"
    listCloseBtn.Font = Enum.Font.GothamBold
    listCloseBtn.TextSize = 18
    listCloseBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
    listCloseBtn.BackgroundTransparency = 0.4
    listCloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", listCloseBtn).CornerRadius = UDim.new(1,0)

    local playerScroll = Instance.new("ScrollingFrame", listGui)
    playerScroll.Size = UDim2.new(1, -20, 1, -60)
    playerScroll.Position = UDim2.new(0, 10, 0, 50)
    playerScroll.ScrollBarThickness = 6
    playerScroll.BackgroundColor3 = Color3.fromRGB(20, 5, 40)
    playerScroll.BackgroundTransparency = 0.4
    Instance.new("UICorner", playerScroll).CornerRadius = UDim.new(0,8)
    local playerStroke = Instance.new("UIStroke", playerScroll)
    playerStroke.Color = Color3.fromRGB(180, 0, 255)
    playerStroke.Thickness = 1

    local playerListLayout = Instance.new("UIListLayout", playerScroll)
    playerListLayout.Padding = UDim.new(0,6)
    playerListLayout.SortOrder = Enum.SortOrder.Name

    local function updateList()
        for _, child in playerScroll:GetChildren() do
            if child:IsA("TextButton") then child:Destroy() end
        end
        for _, p in Players:GetPlayers() do
            if p ~= player then
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(1, -12, 0, 36)
                btn.BackgroundColor3 = Color3.fromRGB(25, 10, 50)
                btn.BackgroundTransparency = 0.4
                btn.Text = p.Name .. " • " .. (p.DisplayName ~= "" and p.DisplayName or "No Display")
                btn.TextColor3 = Color3.fromRGB(200, 150, 255)
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 14
                btn.Parent = playerScroll
                Instance.new("UICorner", btn).CornerRadius = UDim.new(0,6)
                local stroke = Instance.new("UIStroke", btn)
                stroke.Color = Color3.fromRGB(180, 0, 255)
                stroke.Thickness = 1

                btn.MouseButton1Click:Connect(function()
                    targetBox.Text = p.Name
                    clickSound:Play()
                    notify("Target set: " .. p.Name)
                    listGui:Destroy()
                    listGui = nil
                end)
            end
        end
        playerScroll.CanvasSize = UDim2.new(0, 0, 0, playerListLayout.AbsoluteContentSize.Y + 10)
        listTitle.Text = "📋 List Player (" .. #Players:GetPlayers() - 1 .. ")"
    end

    updateList()
    Players.PlayerAdded:Connect(updateList)
    Players.PlayerRemoving:Connect(updateList)

    listCloseBtn.MouseButton1Click:Connect(function()
        clickSound:Play()
        local shrink = TweenService:Create(listGui, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)})
        shrink:Play()
        shrink.Completed:Wait()
        listGui:Destroy()
        listGui = nil
    end)
end

listBtn.MouseButton1Click:Connect(function()
    clickSound:Play()
    showPlayerList()
end)

-- Get Target
local function getTarget()
    local name = targetBox.Text
    for _, p in Players:GetPlayers() do
        if string.lower(p.Name):find(string.lower(name)) or string.lower(p.DisplayName):find(string.lower(name)) then
            return p
        end
    end
    return Players:FindFirstChild(name)
end

-- Fuctions fling
local Folder = Instance.new("Folder", Workspace)
local Part = Instance.new("Part", Folder)
local Attachment1 = Instance.new("Attachment", Part)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(500, 500, 500)
    }

    getgenv().Network.RetainPart = function(Part)
        if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then
            table.insert(getgenv().Network.BaseParts, Part)
            Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            Part.CanCollide = false
        end
    end

    local function EnablePartControl()
        player.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(player, "SimulationRadius", math.huge)
            for _, Part in pairs(getgenv().Network.BaseParts) do
                if Part:IsDescendantOf(Workspace) then
                    Part.Velocity = getgenv().Network.Velocity
                end
            end
        end)
    end

    EnablePartControl()
end

local affectedParts = {}
local blackHoleActive = false
local DescendantAddedConnection

local function ForcePart(v)
    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in ipairs(v:GetChildren()) do
            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then x:Destroy() end
        end

        v.CanCollide = false
        local Torque = Instance.new("Torque", v)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        
        Torque.Torque = Vector3.new(50000000, 50000000, 50000000)
        Torque.Attachment0 = Attachment2

        AlignPosition.MaxForce = math.huge
        AlignPosition.Responsiveness = 500
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
        
        pcall(function()
            v.AssemblyAngularVelocity = Vector3.new(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-6000, 6000))
        end)
        
        affectedParts[v] = true
    end
end

local function toggleFling(targetChar)
    local hrp = targetChar:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    blackHoleActive = not blackHoleActive
    flingBtn.Text = blackHoleActive and "Fling ON" or "Fling OFF"

    if blackHoleActive then
        for _, v in ipairs(Workspace:GetDescendants()) do ForcePart(v) end
        DescendantAddedConnection = Workspace.DescendantAdded:Connect(ForcePart)
        task.spawn(function()
            while blackHoleActive and hrp.Parent do
                Attachment1.WorldCFrame = hrp.CFrame
                for part in pairs(affectedParts) do
                    if part and part.Parent then
                        pcall(function()
                            part.AssemblyAngularVelocity = Vector3.new(math.random(-6000, 6000), math.random(-6000, 6000), math.random(-6000, 6000))
                        end)
                    end
                end
                RunService.Heartbeat:Wait()
            end
        end)
        notify("Fling ON untuk " .. targetChar.Name)
    else
        if DescendantAddedConnection then DescendantAddedConnection:Disconnect() end
        affectedParts = {}
        notify("Fling OFF")
    end
end

flingBtn.MouseButton1Click:Connect(function()
    clickSound:Play()
    local target = getTarget()
    if target and target.Character then
        toggleFling(target.Character)
    end
end)

-- Fuctions kill
local function SkidFling(TargetPlayer)
    local success, result = pcall(function()
        local Character = player.Character or player.CharacterAdded:Wait()
        local Humanoid = Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Humanoid and Humanoid.RootPart

        local TCharacter = TargetPlayer.Character
        local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
        local TRootPart = THumanoid and THumanoid.RootPart
        local THead = TCharacter and TCharacter:FindFirstChild("Head")
        local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
        local Handle = Accessory and Accessory:FindFirstChild("Handle")

        if Character and Humanoid and RootPart then
            if RootPart.Velocity.Magnitude < 50 then
                getgenv().OldPos = RootPart.CFrame
            end
            if THumanoid and THumanoid.Sit then
                return false, "Error: Target sedang duduk"
            end
            if THead then
                workspace.CurrentCamera.CameraSubject = THead
            elseif Handle then
                workspace.CurrentCamera.CameraSubject = Handle
            elseif THumanoid then
                workspace.CurrentCamera.CameraSubject = THumanoid
            end
            if not TCharacter or not TCharacter:FindFirstChildWhichIsA("BasePart") then
                return false, "Error: Target tidak memiliki BasePart"
            end

            local FPos = function(BasePart, Pos, Ang)
                RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                RootPart.Velocity = Vector3.new(9e7, 9e7, 9e7)
                RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end

            local SFBasePart = function(BasePart)
                local TimeToWait = 2
                local Time = tick()
                local Angle = 0

                repeat
                    if RootPart and THumanoid then
                        if BasePart.Velocity.Magnitude < 50 then
                            Angle = Angle + 100

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                            task.wait()
                        else
                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()

                            FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
            end

            local BV = Instance.new("BodyVelocity")
            BV.Name = "EpixVel"
            BV.Parent = RootPart
            BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
            BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

            local targetPart
            if TRootPart and THead then
                if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                    targetPart = THead
                else
                    targetPart = TRootPart
                end
            elseif TRootPart then
                targetPart = TRootPart
            elseif THead then
                targetPart = THead
            elseif Handle then
                targetPart = Handle
            else
                return false, "Error: Target tidak memiliki bagian yang diperlukan"
            end

            SFBasePart(targetPart)

            BV:Destroy()
            Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = Humanoid

            if getgenv().OldPos then
                repeat
                    RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                    Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                    Humanoid:ChangeState("GettingUp")
                    for _, x in Character:GetChildren() do
                        if x:IsA("BasePart") then
                            x.Velocity = Vector3.new()
                            x.RotVelocity = Vector3.new()
                        end
                    end
                    task.wait()
                until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
            end

            return true, "Success"
        else
            return false, "Error: Karakter Anda tidak lengkap"
        end
    end)

    if success then
        notify("Kill success " .. TargetPlayer.Name)
    else
        notify("Kill failed try again " .. tostring(result))
    end
end

killBtn.MouseButton1Click:Connect(function()
    clickSound:Play()
    local target = getTarget()
    if target then
        SkidFling(target)
    end
end)

-- View Toggle
local viewing = false
local oldCamSubject
local function toggleView(target)
    if viewing then
        Camera.CameraSubject = oldCamSubject or player.Character:FindFirstChildOfClass("Humanoid")
        viewing = false
        viewBtn.Text = "View"
        notify("Unview")
        return
    end
    local hum = target.Character and target.Character:FindFirstChildOfClass("Humanoid")
    if hum then
        oldCamSubject = Camera.CameraSubject
        Camera.CameraSubject = hum
        viewing = true
        viewBtn.Text = "Unview"
        notify("Viewing " .. target.Name)
    end
end

viewBtn.MouseButton1Click:Connect(function()
    clickSound:Play()
    local target = getTarget()
    if target and target.Character then
        toggleView(target)
    end
end)

-- Toggle GUI Animation
local guiOpen = false
local function toggleGUI()
    clickSound:Play()
    guiOpen = not guiOpen
    if guiOpen then
        main.Visible = true
        TweenService:Create(main, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 380, 0, 320)}):Play()
    else
        local shrink = TweenService:Create(main, TweenInfo.new(0.36, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
        shrink:Play()
        shrink.Completed:Connect(function()
            main.Visible = false
        end)
    end
end

toggleBtn.MouseButton1Click:Connect(toggleGUI)
closeBtn.MouseButton1Click:Connect(toggleGUI)

-- Execute after GUI is loaded with error handling
local success, err = pcall(function()
    local args = {
        [1] = "RolePlayName",
        [2] = "Script LockPlayerV5 Loaded! Username : " .. player.Name
    }
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local re = replicatedStorage:FindFirstChild("RE")
    local remote = re and re:FindFirstChild("1RPNam1eTex1t")
    if remote then
        remote:FireServer(unpack(args))
    else
        error("RemoteEvent '1RPNam1eTex1t' tidak ditemukan di ReplicatedStorage.RE")
    end
end)

if not success then
    notify("Gagal menjalankan RolePlayName: " .. tostring(err))
end

-- Remove Void
game.Workspace.FallenPartsDestroyHeight = 0/08

-- Esp Script Owner
local espHighlights = {}
local function applyESP(p, labelText)
    if espHighlights[p] then return end 

    local function onCharacterAdded(char)
        local highlight = Instance.new("Highlight")
        highlight.Name = "TheHighlight"
        highlight.FillColor = Color3.fromRGB(128, 0, 128)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Parent = char

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "ScriptLabel"
        billboard.Adornee = char:WaitForChild("Head")
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.AlwaysOnTop = true
        billboard.Parent = char

        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 1, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = labelText
        textLabel.Font = Enum.Font.GothamBold
        textLabel.TextSize = 18
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 255)
        textLabel.Parent = billboard

        espHighlights[p] = {highlight, billboard}
    end

    if p.Character then
        onCharacterAdded(p.Character)
    end
    p.CharacterAdded:Connect(onCharacterAdded)
end

local function checkForSpecialPlayers()
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Name == "Asdd5644" then
            applyESP(p, "Developer Script")
        elseif p.Name == "ZADa_62849" then
            applyESP(p, "The Hunter")
        end
    end
end

-- check player
checkForSpecialPlayers()

-- The player
Players.PlayerAdded:Connect(function(p)
    if p.Name == "Asdd5644" then
        applyESP(p, "Developer Script")
    elseif p.Name == "ZADa_62849" then
        applyESP(p, "The Hunter")
    end
end)

-- clear esp owner
Players.PlayerRemoving:Connect(function(p)
    if espHighlights[p] then
        for _, obj in ipairs(espHighlights[p]) do
            obj:Destroy()
        end
        espHighlights[p] = nil
    end
end) 
