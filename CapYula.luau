-- ═══════════════════════════════════════════════════════════════════════════
-- NovaUI v2.0 - مكتبة واجهة احترافية لـ Roblox
-- Author: ibrahimkhacef5-del
-- Version: 2.0.0
-- ═══════════════════════════════════════════════════════════════════════════

local NovaUI = {}
NovaUI.__index = NovaUI
NovaUI.Version = "2.0.0"

-- ═══════════════════════════════════════════════════════════════════════════
-- الخدمات
-- ═══════════════════════════════════════════════════════════════════════════
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

-- ═══════════════════════════════════════════════════════════════════════════
-- الإعدادات
-- ═══════════════════════════════════════════════════════════════════════════
NovaUI.Config = {
    WindowSize = UDim2.new(0, 560, 0, 460),
    BackgroundImage = "",
    BackgroundTransparency = 0.5,
    ShowBootScreen = true,
    BootDuration = 2.0,
    SaveFileName = "NovaUI_Config",
}

-- ═══════════════════════════════════════════════════════════════════════════
-- 12 ثيم
-- ═══════════════════════════════════════════════════════════════════════════
NovaUI.Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 20),
        Card = Color3.fromRGB(25, 25, 35),
        TitleBar = Color3.fromRGB(30, 30, 45),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(180, 180, 200),
        Accent = Color3.fromRGB(120, 80, 255),
        AccentHover = Color3.fromRGB(140, 100, 255),
        Success = Color3.fromRGB(80, 200, 120),
        Danger = Color3.fromRGB(255, 80, 100),
        Warning = Color3.fromRGB(255, 180, 60),
        Border = Color3.fromRGB(50, 50, 70),
    },
    Light = {
        Background = Color3.fromRGB(240, 240, 245),
        Card = Color3.fromRGB(255, 255, 255),
        TitleBar = Color3.fromRGB(230, 230, 240),
        Text = Color3.fromRGB(20, 20, 30),
        SubText = Color3.fromRGB(100, 100, 120),
        Accent = Color3.fromRGB(80, 100, 220),
        AccentHover = Color3.fromRGB(100, 120, 240),
        Success = Color3.fromRGB(50, 180, 100),
        Danger = Color3.fromRGB(220, 60, 80),
        Warning = Color3.fromRGB(240, 160, 40),
        Border = Color3.fromRGB(200, 200, 215),
    },
    Ocean = {
        Background = Color3.fromRGB(10, 25, 40),
        Card = Color3.fromRGB(20, 40, 60),
        TitleBar = Color3.fromRGB(15, 30, 50),
        Text = Color3.fromRGB(220, 240, 255),
        SubText = Color3.fromRGB(140, 180, 220),
        Accent = Color3.fromRGB(0, 180, 220),
        AccentHover = Color3.fromRGB(30, 200, 240),
        Success = Color3.fromRGB(0, 200, 150),
        Danger = Color3.fromRGB(255, 80, 100),
        Warning = Color3.fromRGB(255, 200, 60),
        Border = Color3.fromRGB(30, 60, 90),
    },
    Sunset = {
        Background = Color3.fromRGB(30, 15, 20),
        Card = Color3.fromRGB(45, 25, 35),
        TitleBar = Color3.fromRGB(40, 20, 30),
        Text = Color3.fromRGB(255, 240, 230),
        SubText = Color3.fromRGB(200, 160, 160),
        Accent = Color3.fromRGB(255, 120, 80),
        AccentHover = Color3.fromRGB(255, 140, 100),
        Success = Color3.fromRGB(255, 180, 80),
        Danger = Color3.fromRGB(255, 60, 80),
        Warning = Color3.fromRGB(255, 220, 100),
        Border = Color3.fromRGB(80, 40, 50),
    },
    Forest = {
        Background = Color3.fromRGB(15, 25, 18),
        Card = Color3.fromRGB(25, 40, 30),
        TitleBar = Color3.fromRGB(20, 35, 25),
        Text = Color3.fromRGB(230, 255, 235),
        SubText = Color3.fromRGB(160, 200, 170),
        Accent = Color3.fromRGB(80, 200, 120),
        AccentHover = Color3.fromRGB(100, 220, 140),
        Success = Color3.fromRGB(120, 230, 150),
        Danger = Color3.fromRGB(255, 90, 90),
        Warning = Color3.fromRGB(240, 200, 80),
        Border = Color3.fromRGB(40, 70, 50),
    },
    Purple = {
        Background = Color3.fromRGB(20, 12, 35),
        Card = Color3.fromRGB(35, 20, 55),
        TitleBar = Color3.fromRGB(30, 15, 50),
        Text = Color3.fromRGB(240, 230, 255),
        SubText = Color3.fromRGB(180, 160, 220),
        Accent = Color3.fromRGB(180, 100, 255),
        AccentHover = Color3.fromRGB(200, 120, 255),
        Success = Color3.fromRGB(150, 220, 180),
        Danger = Color3.fromRGB(255, 100, 140),
        Warning = Color3.fromRGB(255, 200, 120),
        Border = Color3.fromRGB(60, 35, 90),
    },
    Midnight = {
        Background = Color3.fromRGB(8, 8, 15),
        Card = Color3.fromRGB(15, 15, 25),
        TitleBar = Color3.fromRGB(12, 12, 22),
        Text = Color3.fromRGB(255, 255, 255),
        SubText = Color3.fromRGB(150, 150, 180),
        Accent = Color3.fromRGB(255, 100, 150),
        AccentHover = Color3.fromRGB(255, 120, 170),
        Success = Color3.fromRGB(100, 255, 180),
        Danger = Color3.fromRGB(255, 80, 100),
        Warning = Color3.fromRGB(255, 200, 100),
        Border = Color3.fromRGB(30, 30, 50),
    },
    Cyberpunk = {
        Background = Color3.fromRGB(10, 5, 20),
        Card = Color3.fromRGB(20, 10, 35),
        TitleBar = Color3.fromRGB(15, 5, 25),
        Text = Color3.fromRGB(0, 255, 200),
        SubText = Color3.fromRGB(255, 50, 150),
        Accent = Color3.fromRGB(255, 0, 150),
        AccentHover = Color3.fromRGB(255, 50, 180),
        Success = Color3.fromRGB(0, 255, 150),
        Danger = Color3.fromRGB(255, 0, 80),
        Warning = Color3.fromRGB(255, 255, 0),
        Border = Color3.fromRGB(255, 0, 150),
    },
    Neon = {
        Background = Color3.fromRGB(5, 5, 15),
        Card = Color3.fromRGB(15, 15, 30),
        TitleBar = Color3.fromRGB(10, 10, 20),
        Text = Color3.fromRGB(0, 255, 255),
        SubText = Color3.fromRGB(150, 255, 255),
        Accent = Color3.fromRGB(0, 255, 255),
        AccentHover = Color3.fromRGB(50, 255, 255),
        Success = Color3.fromRGB(0, 255, 100),
        Danger = Color3.fromRGB(255, 0, 100),
        Warning = Color3.fromRGB(255, 255, 0),
        Border = Color3.fromRGB(0, 100, 150),
    },
    Blood = {
        Background = Color3.fromRGB(15, 5, 5),
        Card = Color3.fromRGB(30, 10, 10),
        TitleBar = Color3.fromRGB(20, 5, 5),
        Text = Color3.fromRGB(255, 220, 220),
        SubText = Color3.fromRGB(220, 150, 150),
        Accent = Color3.fromRGB(255, 0, 0),
        AccentHover = Color3.fromRGB(255, 50, 50),
        Success = Color3.fromRGB(200, 50, 50),
        Danger = Color3.fromRGB(255, 0, 0),
        Warning = Color3.fromRGB(255, 150, 0),
        Border = Color3.fromRGB(80, 20, 20),
    },
    Sky = {
        Background = Color3.fromRGB(220, 235, 250),
        Card = Color3.fromRGB(255, 255, 255),
        TitleBar = Color3.fromRGB(200, 220, 240),
        Text = Color3.fromRGB(20, 40, 80),
        SubText = Color3.fromRGB(80, 120, 160),
        Accent = Color3.fromRGB(50, 150, 250),
        AccentHover = Color3.fromRGB(70, 170, 255),
        Success = Color3.fromRGB(60, 200, 120),
        Danger = Color3.fromRGB(240, 80, 100),
        Warning = Color3.fromRGB(250, 180, 50),
        Border = Color3.fromRGB(180, 210, 240),
    },
    Gold = {
        Background = Color3.fromRGB(25, 20, 10),
        Card = Color3.fromRGB(40, 30, 15),
        TitleBar = Color3.fromRGB(30, 25, 12),
        Text = Color3.fromRGB(255, 240, 200),
        SubText = Color3.fromRGB(220, 180, 120),
        Accent = Color3.fromRGB(255, 200, 50),
        AccentHover = Color3.fromRGB(255, 220, 80),
        Success = Color3.fromRGB(200, 220, 100),
        Danger = Color3.fromRGB(255, 100, 80),
        Warning = Color3.fromRGB(255, 220, 100),
        Border = Color3.fromRGB(120, 90, 30),
    },
}

NovaUI.CurrentTheme = "Dark"
NovaUI.Theme = NovaUI.Themes.Dark

-- ═══════════════════════════════════════════════════════════════════════════
-- أدوات
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:Create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

function NovaUI:Corner(parent, radius)
    return self:Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8)
    }, parent)
end

function NovaUI:Stroke(parent, color, thickness, transparency)
    return self:Create("UIStroke", {
        Color = color or self.Theme.Accent,
        Thickness = thickness or 1,
        Transparency = transparency or 0.5,
    }, parent)
end

function NovaUI:Tween(obj, time, props)
    local tween = TweenService:Create(
        obj,
        TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        props
    )
    tween:Play()
    return tween
end

function NovaUI:Round(num, decimals)
    local mult = 10 ^ (decimals or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- ═══════════════════════════════════════════════════════════════════════════
-- Boot Screen
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateBootScreen()
    local gui = self:Create("ScreenGui", {
        Name = "NovaUI_Boot",
        ResetOnSpawn = false,
        DisplayOrder = 999,
        IgnoreGuiInset = true,
    }, CoreGui)

    local bg = self:Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(8, 8, 12),
        BorderSizePixel = 0,
    }, gui)

    local logoContainer = self:Create("Frame", {
        Size = UDim2.new(0, 120, 0, 120),
        Position = UDim2.new(0.5, -60, 0.5, -120),
        BackgroundTransparency = 1,
    }, bg)

    local circle = self:Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
    }, logoContainer)
    self:Corner(circle, 60)

    self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 70,
        Font = Enum.Font.GothamBlack,
    }, circle)

    self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 50),
        Position = UDim2.new(0, 0, 0.5, 20),
        BackgroundTransparency = 1,
        Text = "NovaUI",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 40,
        Font = Enum.Font.GothamBlack,
    }, bg)

    local loadingText = self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0.5, 70),
        BackgroundTransparency = 1,
        Text = "Initializing...",
        TextColor3 = self.Theme.SubText,
        TextSize = 14,
        Font = Enum.Font.Gotham,
    }, bg)

    local progressBg = self:Create("Frame", {
        Size = UDim2.new(0, 320, 0, 4),
        Position = UDim2.new(0.5, -160, 0.5, 110),
        BackgroundColor3 = Color3.fromRGB(30, 30, 45),
        BorderSizePixel = 0,
    }, bg)
    self:Corner(progressBg, 2)

    local progressBar = self:Create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
    }, progressBg)
    self:Corner(progressBar, 2)

    local percentText = self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0.5, 135),
        BackgroundTransparency = 1,
        Text = "0%",
        TextColor3 = self.Theme.Accent,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
    }, bg)

    local steps = {
        {0.0, "Initializing..."},
        {0.2, "Loading modules..."},
        {0.4, "Connecting..."},
        {0.6, "Preparing UI..."},
        {0.8, "Almost ready..."},
        {0.95, "Ready!"},
    }

    local startTime = tick()
    local duration = NovaUI.Config.BootDuration

    task.spawn(function()
        while tick() - startTime < duration do
            local progress = math.min((tick() - startTime) / duration, 1)
            progressBar.Size = UDim2.new(progress, 0, 1, 0)
            percentText.Text = math.floor(progress * 100) .. "%"

            for _, step in ipairs(steps) do
                if progress >= step[1] then
                    loadingText.Text = step[2]
                end
            end

            task.wait(0.05)
        end

        progressBar.Size = UDim2.new(1, 0, 1, 0)
        percentText.Text = "100%"
        loadingText.Text = "Welcome!"

        task.wait(0.4)

        for _, obj in ipairs(bg:GetDescendants()) do
            if obj:IsA("Frame") or obj:IsA("TextLabel") then
                pcall(function()
                    self:Tween(obj, 0.5, {
                        BackgroundTransparency = 1,
                        TextTransparency = 1,
                    })
                end)
            end
        end

        task.wait(0.6)
        gui:Destroy()
    end)

    return gui
end

-- ═══════════════════════════════════════════════════════════════════════════
-- Notifications
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:Notify(options)
    options = options or {}
    local title = options.Title or "Notification"
    local text = options.Text or ""
    local duration = options.Duration or 4
    local type_ = options.Type or "info"

    local colors = {
        info = self.Theme.Accent,
        success = self.Theme.Success,
        warning = self.Theme.Warning,
        error = self.Theme.Danger,
    }
    local icons = {
        info = "ℹ",
        success = "✓",
        warning = "⚠",
        error = "✕",
    }
    local color = colors[type_] or self.Theme.Accent
    local icon = icons[type_] or "ℹ"

    local gui = self:Create("ScreenGui", {
        Name = "NovaUI_Notify",
        ResetOnSpawn = false,
        DisplayOrder = 998,
    }, CoreGui)

    local notif = self:Create("Frame", {
        Size = UDim2.new(0, 320, 0, 85),
        Position = UDim2.new(1, 350, 0, 20),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
    }, gui)
    self:Corner(notif, 10)
    self:Stroke(notif, color, 1.5, 0.3)

    local iconFrame = self:Create("Frame", {
        Size = UDim2.new(0, 40, 0, 40),
        Position = UDim2.new(0, 15, 0.5, -20),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
    }, notif)
    self:Corner(iconFrame, 20)

    self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = icon,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 20,
        Font = Enum.Font.GothamBold,
    }, iconFrame)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -75, 0, 24),
        Position = UDim2.new(0, 65, 0, 12),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = self.Theme.Text,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, notif)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -75, 0, 38),
        Position = UDim2.new(0, 65, 0, 36),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = self.Theme.SubText,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    }, notif)

    local progressLine = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
    }, notif)

    self:Tween(notif, 0.4, { Position = UDim2.new(1, -340, 0, 20) })
    self:Tween(progressLine, duration, { Size = UDim2.new(0, 0, 0, 2) })

    task.delay(duration, function()
        self:Tween(notif, 0.4, { Position = UDim2.new(1, 350, 0, 20) })
        task.wait(0.5)
        gui:Destroy()
    end)

    return notif
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateWindow
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateWindow(options)
    options = options or {}

    if options.Theme and self.Themes[options.Theme] then
        self.CurrentTheme = options.Theme
        self.Theme = self.Themes[options.Theme]
    end

    if self.Config.ShowBootScreen then
        self:CreateBootScreen()
        task.wait(0.5)
    end

    local window = setmetatable({
        Options = options,
        Tabs = {},
        CurrentTab = nil,
        Gui = nil,
        Minimized = false,
    }, self)

    local gui = self:Create("ScreenGui", {
        Name = "NovaUI",
        ResetOnSpawn = false,
    }, CoreGui)
    window.Gui = gui

    local main = self:Create("Frame", {
        Size = self.Config.WindowSize,
        Position = UDim2.new(0.5, -280, 0.5, -230),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, gui)
    window.Main = main
    self:Corner(main, 14)
    self:Stroke(main, self.Theme.Accent, 2, 0.3)

    local titleBar = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = self.Theme.TitleBar,
        BorderSizePixel = 0,
    }, main)
    self:Corner(titleBar, 14)
    window.TitleBar = titleBar

    local logoFrame = self:Create("Frame", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(0, 15, 0.5, -16),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
    }, titleBar)
    self:Corner(logoFrame, 8)

    self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 18,
        Font = Enum.Font.GothamBlack,
    }, logoFrame)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -180, 1, 0),
        Position = UDim2.new(0, 55, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Name or "NovaUI",
        TextColor3 = self.Theme.Text,
        TextSize = 17,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, titleBar)

    local themeBtn = self:Create("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -90, 0.5, -16),
        BackgroundColor3 = self.Theme.Card,
        Text = "🎨",
        TextSize = 16,
        Font = Enum.Font.Gotham,
    }, titleBar)
    self:Corner(themeBtn, 8)

    local closeBtn = self:Create("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -12, 0.5, -16),
        BackgroundColor3 = self.Theme.Danger,
        Text = "✕",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
    }, titleBar)
    self:Corner(closeBtn, 8)

    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- Drag
    local dragging, dragStart, startPos
    titleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
        end
    end)
    titleBar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
           or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- Tabs
    local tabsContainer = self:Create("Frame", {
        Size = UDim2.new(1, -20, 0, 40),
        Position = UDim2.new(0, 10, 0, 60),
        BackgroundTransparency = 1,
    }, main)

    self:Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
    }, tabsContainer)
    window.TabsContainer = tabsContainer

    local content = self:Create("Frame", {
        Size = UDim2.new(1, -20, 1, -115),
        Position = UDim2.new(0, 10, 0, 105),
        BackgroundColor3 = self.Theme.Card,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
    }, main)
    self:Corner(content, 10)
    window.Content = content

    -- Theme Menu
    local themeMenu = self:Create("Frame", {
        Size = UDim2.new(0, 180, 0, 250),
        Position = UDim2.new(1, -190, 0, 55),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 10,
    }, main)
    self:Corner(themeMenu, 10)
    self:Stroke(themeMenu, self.Theme.Accent)

    self:Create("UIListLayout", {
        Padding = UDim.new(0, 4),
    }, themeMenu)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 30),
        BackgroundTransparency = 1,
        Text = "🎨 Themes",
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
    }, themeMenu)

    for name, _ in pairs(self.Themes) do
        local btn = self:Create("TextButton", {
            Size = UDim2.new(1, -20, 0, 28),
            BackgroundColor3 = self.Theme.Background,
            Text = name,
            TextColor3 = self.Theme.Text,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            ZIndex = 11,
        }, themeMenu)
        self:Corner(btn, 6)

        btn.MouseButton1Click:Connect(function()
            NovaUI:SetTheme(name)
            themeMenu.Visible = false
        end)
    end

    themeBtn.MouseButton1Click:Connect(function()
        themeMenu.Visible = not themeMenu.Visible
    end)

    return window
end

-- ═══════════════════════════════════════════════════════════════════════════
-- Set Theme
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:SetTheme(name)
    if not self.Themes[name] then return end
    self.CurrentTheme = name
    self.Theme = self.Themes[name]

    self:Notify({
        Title = "Theme",
        Text = "Applied: " .. name,
        Type = "success",
    })
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateTab
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateTab(window, name)
    local tab = {
        Name = name,
        Window = window,
    }

    local btn = self:Create("TextButton", {
        Size = UDim2.new(0, 110, 1, 0),
        BackgroundColor3 = self.Theme.Background,
        Text = name,
        TextColor3 = self.Theme.SubText,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
    }, window.TabsContainer)
    self:Corner(btn, 8)
    tab.Button = btn

    local page = self:Create("ScrollingFrame", {
        Size = UDim2.new(1, -20, 1, -20),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = self.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
    }, window.Content)

    self:Create("UIListLayout", {
        Padding = UDim.new(0, 10),
    }, page)
    tab.Page = page

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(window.Tabs) do
            t.Page.Visible = false
            t.Button.BackgroundColor3 = self.Theme.Background
            t.Button.TextColor3 = self.Theme.SubText
        end
        page.Visible = true
        btn.BackgroundColor3 = self.Theme.Accent
        btn.TextColor3 = self.Theme.Text
        window.CurrentTab = tab
    end)

    table.insert(window.Tabs, tab)

    if #window.Tabs == 1 then
        page.Visible = true
        btn.BackgroundColor3 = self.Theme.Accent
        btn.TextColor3 = self.Theme.Text
        window.CurrentTab = tab
    end

    return tab
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateSection
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateSection(tab, name)
    local section = {
        Name = name,
        Tab = tab,
    }

    self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundTransparency = 1,
        Text = "◆ " .. name,
        TextColor3 = self.Theme.Accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, tab.Page)

    return section
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateButton
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateButton(section, options)
    local name = options.Name or "Button"
    local callback = options.Callback or function() end

    local btn = self:Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Accent,
        Text = name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
    }, section.Tab.Page)
    self:Corner(btn, 8)

    btn.MouseEnter:Connect(function()
        self:Tween(btn, 0.2, { BackgroundColor3 = self.Theme.AccentHover })
    end)
    btn.MouseLeave:Connect(function()
        self:Tween(btn, 0.2, { BackgroundColor3 = self.Theme.Accent })
    end)
    btn.MouseButton1Click:Connect(callback)

    return btn
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateToggle
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateToggle(section, options)
    local name = options.Name or "Toggle"
    local default = options.CurrentValue or false
    local callback = options.Callback or function() end

    local value = default

    local frame = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    self:Corner(frame, 8)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local toggle = self:Create("TextButton", {
        Size = UDim2.new(0, 50, 0, 26),
        Position = UDim2.new(0, 15, 0.5, -13),
        BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75),
        Text = "",
    }, frame)
    self:Corner(toggle, 13)

    local knob = self:Create("Frame", {
        Size = UDim2.new(0, 20, 0, 20),
        Position = value and UDim2.new(1, -23, 0, 3) or UDim2.new(0, 3, 0, 3),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, toggle)
    self:Corner(knob, 10)

    toggle.MouseButton1Click:Connect(function()
        value = not value
        self:Tween(toggle, 0.2, {
            BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75)
        })
        self:Tween(knob, 0.2, {
            Position = value and UDim2.new(1, -23, 0, 3) or UDim2.new(0, 3, 0, 3)
        })
        callback(value)
    end)

    return {
        Set = function(v)
            value = v
            toggle.BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75)
            knob.Position = value and UDim2.new(1, -23, 0, 3) or UDim2.new(0, 3, 0, 3)
        end,
        Get = function() return value end,
    }
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateSlider
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateSlider(section, options)
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.CurrentValue or min
    local callback = options.Callback or function() end

    local value = default

    local frame = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 55),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    self:Corner(frame, 8)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -80, 0, 25),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local valueLabel = self:Create("TextLabel", {
        Size = UDim2.new(0, 60, 0, 25),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundTransparency = 1,
        Text = tostring(value),
        TextColor3 = self.Theme.Accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, frame)

    local sliderBg = self:Create("Frame", {
        Size = UDim2.new(1, -30, 0, 6),
        Position = UDim2.new(0, 15, 0, 38),
        BackgroundColor3 = Color3.fromRGB(50, 50, 65),
        BorderSizePixel = 0,
    }, frame)
    self:Corner(sliderBg, 3)

    local fill = self:Create("Frame", {
        Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
    }, sliderBg)
    self:Corner(fill, 3)

    local dragging = false

    local function updateFromX(x)
        local rel = math.clamp((x - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * rel)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        valueLabel.Text = tostring(value)
        callback(value)
    end

    sliderBg.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            updateFromX(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
           or input.UserInputType == Enum.UserInputType.Touch) then
            updateFromX(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    return {
        Set = function(v)
            value = math.clamp(v, min, max)
            local rel = (value - min) / (max - min)
            fill.Size = UDim2.new(rel, 0, 1, 0)
            valueLabel.Text = tostring(value)
        end,
        Get = function() return value end,
    }
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateColorPicker
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateColorPicker(section, options)
    local name = options.Name or "Color"
    local default = options.Default or Color3.fromRGB(120, 80, 255)
    local callback = options.Callback or function() end

    local color = default

    local frame = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    self:Corner(frame, 8)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local swatch = self:Create("TextButton", {
        Size = UDim2.new(0, 50, 0, 26),
        Position = UDim2.new(0, 15, 0.5, -13),
        BackgroundColor3 = color,
        Text = "",
    }, frame)
    self:Corner(swatch, 6)

    local pickerPanel = self:Create("Frame", {
        Size = UDim2.new(0, 220, 0, 200),
        Position = UDim2.new(0.5, -110, 0.5, -100),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 20,
    }, section.Tab.Page)
    self:Corner(pickerPanel, 10)
    self:Stroke(pickerPanel, self.Theme.Accent)

    local presets = {
        Color3.fromRGB(255, 0, 0),
        Color3.fromRGB(255, 128, 0),
        Color3.fromRGB(255, 255, 0),
        Color3.fromRGB(0, 255, 0),
        Color3.fromRGB(0, 255, 255),
        Color3.fromRGB(0, 128, 255),
        Color3.fromRGB(0, 0, 255),
        Color3.fromRGB(128, 0, 255),
        Color3.fromRGB(255, 0, 255),
        Color3.fromRGB(255, 0, 128),
        Color3.fromRGB(255, 255, 255),
        Color3.fromRGB(0, 0, 0),
        Color3.fromRGB(120, 80, 255),
        Color3.fromRGB(255, 100, 150),
        Color3.fromRGB(80, 200, 120),
        Color3.fromRGB(255, 180, 60),
    }

    local presetContainer = self:Create("Frame", {
        Size = UDim2.new(1, -20, 1, -60),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 21,
    }, pickerPanel)

    self:Create("UIGridLayout", {
        CellSize = UDim2.new(0, 30, 0, 30),
        CellPadding = UDim2.new(0, 8, 0, 8),
    }, presetContainer)

    for _, c in ipairs(presets) do
        local pBtn = self:Create("TextButton", {
            Size = UDim2.new(0, 30, 0, 30),
            BackgroundColor3 = c,
            Text = "",
            ZIndex = 22,
        }, presetContainer)
        self:Corner(pBtn, 6)

        pBtn.MouseButton1Click:Connect(function()
            color = c
            swatch.BackgroundColor3 = c
            callback(c)
        end)
    end

    local closeBtn = self:Create("TextButton", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 1, -40),
        BackgroundColor3 = self.Theme.Accent,
        Text = "Done",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        ZIndex = 22,
    }, pickerPanel)
    self:Corner(closeBtn, 6)

    closeBtn.MouseButton1Click:Connect(function()
        pickerPanel.Visible = false
    end)

    swatch.MouseButton1Click:Connect(function()
        pickerPanel.Visible = not pickerPanel.Visible
    end)

    return {
        Set = function(c)
            color = c
            swatch.BackgroundColor3 = c
        end,
        Get = function() return color end,
    }
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateTextbox
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateTextbox(section, options)
    local name = options.Name or "Textbox"
    local default = options.CurrentValue or ""
    local callback = options.Callback or function() end

    local frame = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 65),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    self:Corner(frame, 8)

    self:Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 22),
        Position = UDim2.new(0, 15, 0, 8),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local textbox = self:Create("TextBox", {
        Size = UDim2.new(1, -30, 0, 28),
        Position = UDim2.new(0, 15, 0, 32),
        BackgroundColor3 = Color3.fromRGB(15, 15, 25),
        Text = default,
        PlaceholderText = "اكتب هنا...",
        TextColor3 = self.Theme.Text,
        PlaceholderColor3 = self.Theme.SubText,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    }, frame)
    self:Corner(textbox, 6)

    textbox.FocusLost:Connect(function(enterPressed)
        callback(textbox.Text, enterPressed)
    end)

    return {
        Set = function(v) textbox.Text = v end,
        Get = function() return textbox.Text end,
    }
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateDivider
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateDivider(section, text)
    local frame = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 20),
        BackgroundTransparency = 1,
    }, section.Tab.Page)

    local line = self:Create("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = self.Theme.Border,
        BorderSizePixel = 0,
    }, frame)

    if text then
        local label = self:Create("TextLabel", {
            Size = UDim2.new(0, 100, 1, 0),
            Position = UDim2.new(0.5, -50, 0, 0),
            BackgroundColor3 = self.Theme.Card,
            Text = text,
            TextColor3 = self.Theme.SubText,
            TextSize = 11,
            Font = Enum.Font.Gotham,
        }, frame)
        self:Corner(label, 4)
    end

    return frame
end

-- ═══════════════════════════════════════════════════════════════════════════
-- CreateLabel
-- ═══════════════════════════════════════════════════════════════════════════
function NovaUI:CreateLabel(section, text)
    local label = self:Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = self.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, section.Tab.Page)

    return label
end

-- ═══════════════════════════════════════════════════════════════════════════
-- إرجاع المكتبة
-- ═══════════════════════════════════════════════════════════════════════════
return NovaUI
