--═════════════════════════════════════════════
-- NovaUI - مكتبة واجهة احترافية لـ Roblox
-- Version: 1.0.0
-- Features: Boot, Themes, Background, Toggle, Slider, ColorPicker
-- ═══════════════════════════════════════════════════════════════════════

local NovaUI = {}
NovaUI.__index = NovaUI

-- ═══════════════════════════════════════════════════════════════════════
-- الخدمات
-- ═══════════════════════════════════════════════════════════════════════
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

-- ═══════════════════════════════════════════════════════════════════════
-- الثيمات
-- ═══════════════════════════════════════════════════════════════════════
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
    },
}

-- الثيم الحالي
NovaUI.CurrentTheme = "Dark"
NovaUI.Theme = NovaUI.Themes.Dark

-- ═══════════════════════════════════════════════════════════════════════
-- الإعدادات الافتراضية
-- ═══════════════════════════════════════════════════════════════════════
NovaUI.Config = {
    WindowSize = UDim2.new(0, 520, 0, 420),
    BackgroundImage = "",
    BackgroundTransparency = 0.5,
    ShowBootScreen = true,
}

-- ═══════════════════════════════════════════════════════════════════════
-- أدوات مساعدة
-- ═══════════════════════════════════════════════════════════════════════
local function Create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local function Corner(parent, radius)
    Create("UICorner", {
        CornerRadius = UDim.new(0, radius or 8)
    }, parent)
end

local function Stroke(parent, color, thickness)
    Create("UIStroke", {
        Color = color or NovaUI.Theme.Accent,
        Thickness = thickness or 1,
        Transparency = 0.5,
    }, parent)
end

local function Tween(obj, time, props)
    local tween = TweenService:Create(obj, TweenInfo.new(time, Enum.EasingStyle.Quad), props)
    tween:Play()
    return tween
end

-- ═══════════════════════════════════════════════════════════════════════
-- Boot Screen
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateBootScreen()
    local gui = Create("ScreenGui", {
        Name = "NovaUI_Boot",
        ResetOnSpawn = false,
        DisplayOrder = 999,
    }, CoreGui)

    local bg = Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(10, 10, 15),
        BorderSizePixel = 0,
    }, gui)

    -- Logo
    local logo = Create("Frame", {
        Size = UDim2.new(0, 100, 0, 100),
        Position = UDim2.new(0.5, -50, 0.5, -80),
        BackgroundColor3 = NovaUI.Theme.Accent,
        BorderSizePixel = 0,
    }, bg)
    Corner(logo, 25)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 60,
        Font = Enum.Font.GothamBlack,
    }, logo)

    -- Title
    local title = Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 40),
        Position = UDim2.new(0, 0, 0.5, 30),
        BackgroundTransparency = 1,
        Text = "NovaUI",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 32,
        Font = Enum.Font.GothamBlack,
    }, bg)

    -- Subtitle
    local subtitle = Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0.5, 70),
        BackgroundTransparency = 1,
        Text = "Loading...",
        TextColor3 = Color3.fromRGB(150, 150, 180),
        TextSize = 16,
        Font = Enum.Font.Gotham,
    }, bg)

    -- Progress Bar
    local progressBg = Create("Frame", {
        Size = UDim2.new(0, 300, 0, 6),
        Position = UDim2.new(0.5, -150, 0.5, 110),
        BackgroundColor3 = Color3.fromRGB(30, 30, 45),
        BorderSizePixel = 0,
    }, bg)
    Corner(progressBg, 3)

    local progressBar = Create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = NovaUI.Theme.Accent,
        BorderSizePixel = 0,
    }, progressBg)
    Corner(progressBar, 3)

    -- Animate
    Tween(logo, 0.6, { Position = UDim2.new(0.5, -50, 0.5, -100) })
    Tween(progressBar, 2, { Size = UDim2.new(1, 0, 1, 0) })

    -- Steps
    local steps = {
        "Initializing...",
        "Loading modules...",
        "Connecting...",
        "Almost ready...",
        "Ready!",
    }

    task.spawn(function()
        for i, step in ipairs(steps) do
            subtitle.Text = step
            task.wait(0.4)
        end

        task.wait(0.3)

        -- Fade out
        Tween(bg, 0.5, { BackgroundTransparency = 1 })
        Tween(title, 0.5, { TextTransparency = 1 })
        Tween(subtitle, 0.5, { TextTransparency = 1 })
        Tween(progressBg, 0.5, { BackgroundTransparency = 1 })
        Tween(progressBar, 0.5, { BackgroundTransparency = 1 })
        Tween(logo, 0.5, { BackgroundTransparency = 1 })

        task.wait(0.6)
        gui:Destroy()
    end)

    return gui
end

-- ═══════════════════════════════════════════════════════════════════════
-- Notifications
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:Notify(options)
    local title = options.Title or "Notification"
    local text = options.Text or ""
    local duration = options.Duration or 5
    local type_ = options.Type or "info"

    -- الألوان
    local colors = {
        info = NovaUI.Theme.Accent,
        success = NovaUI.Theme.Success,
        warning = NovaUI.Theme.Warning,
        error = NovaUI.Theme.Danger,
    }
    local color = colors[type_] or NovaUI.Theme.Accent

    -- GUI
    local gui = Create("ScreenGui", {
        Name = "NovaUI_Notify",
        ResetOnSpawn = false,
        DisplayOrder = 998,
    }, CoreGui)

    local notif = Create("Frame", {
        Size = UDim2.new(0, 300, 0, 80),
        Position = UDim2.new(1, 320, 0, 20),
        BackgroundColor3 = NovaUI.Theme.Card,
        BorderSizePixel = 0,
    }, gui)
    Corner(notif, 10)
    Stroke(notif, color)

    -- Accent bar
    Create("Frame", {
        Size = UDim2.new(0, 5, 1, 0),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
    }, notif)
    Corner(notif:FindFirstChildOfClass("Frame"), 10)

    -- Title
    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 25),
        Position = UDim2.new(0, 15, 0, 10),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = NovaUI.Theme.Text,
        TextSize = 15,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, notif)

    -- Text
    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 35),
        Position = UDim2.new(0, 15, 0, 35),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = NovaUI.Theme.SubText,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextWrapped = true,
    }, notif)

    -- Animate in
    Tween(notif, 0.4, { Position = UDim2.new(1, -320, 0, 20) })

    -- Animate out
    task.delay(duration, function()
        Tween(notif, 0.4, { Position = UDim2.new(1, 320, 0, 20) })
        task.wait(0.5)
        gui:Destroy()
    end)

    return notif
end

-- ═══════════════════════════════════════════════════════════════════════
-- Window
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateWindow(options)
    options = options or {}

    if options.Theme and self.Themes[options.Theme] then
        self.CurrentTheme = options.Theme
        self.Theme = self.Themes[options.Theme]
    end

    if NovaUI.Config.ShowBootScreen then
        self:CreateBootScreen()
        task.wait(0.5)
    end

    local window = setmetatable({
        Options = options,
        Tabs = {},
        CurrentTab = nil,
        Gui = nil,
    }, self)

    -- ScreenGui
    local gui = Create("ScreenGui", {
        Name = "NovaUI",
        ResetOnSpawn = false,
    }, CoreGui)
    window.Gui = gui

    -- Main Frame
    local main = Create("Frame", {
        Size = NovaUI.Config.WindowSize,
        Position = UDim2.new(0.5, -260, 0.5, -210),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, gui)
    window.Main = main
    Corner(main, 14)
    Stroke(main, self.Theme.Accent, 2)

    -- Background Image
    if NovaUI.Config.BackgroundImage and NovaUI.Config.BackgroundImage ~= "" then
        local bgImg = Create("ImageLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1,
            Image = NovaUI.Config.BackgroundImage,
            ImageTransparency = NovaUI.Config.BackgroundTransparency,
            ScaleType = Enum.ScaleType.Crop,
            ZIndex = 0,
        }, main)
        Corner(bgImg, 14)
    end

    -- Title Bar
    local titleBar = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 50),
        BackgroundColor3 = self.Theme.TitleBar,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ZIndex = 2,
    }, main)
    Corner(titleBar, 14)

    -- Logo
    local logoFrame = Create("Frame", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(0, 15, 0.5, -16),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
        ZIndex = 3,
    }, titleBar)
    Corner(logoFrame, 8)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 18,
        Font = Enum.Font.GothamBlack,
        ZIndex = 4,
    }, logoFrame)

    -- Title
    Create("TextLabel", {
        Size = UDim2.new(1, -180, 1, 0),
        Position = UDim2.new(0, 55, 0, 0),
        BackgroundTransparency = 1,
        Text = options.Name or "NovaUI",
        TextColor3 = self.Theme.Text,
        TextSize = 17,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 3,
    }, titleBar)

    -- Theme Button
    local themeBtn = Create("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -90, 0.5, -16),
        BackgroundColor3 = self.Theme.Card,
        Text = "🎨",
        TextSize = 16,
        Font = Enum.Font.Gotham,
        ZIndex = 3,
    }, titleBar)
    Corner(themeBtn, 8)

    -- Minimize
    local minBtn = Create("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -50, 0.5, -16),
        BackgroundColor3 = self.Theme.Card,
        Text = "—",
        TextColor3 = self.Theme.SubText,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
        ZIndex = 3,
    }, titleBar)
    Corner(minBtn, 8)

    -- Close
    local closeBtn = Create("TextButton", {
        Size = UDim2.new(0, 32, 0, 32),
        Position = UDim2.new(1, -12, 0.5, -16),
        BackgroundColor3 = self.Theme.Danger,
        Text = "✕",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        ZIndex = 3,
    }, titleBar)
    Corner(closeBtn, 8)

    closeBtn.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    -- Drag
    local dragging, dragInput, dragStart, startPos
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

    -- Tabs Container
    local tabsContainer = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 40),
        Position = UDim2.new(0, 10, 0, 60),
        BackgroundTransparency = 1,
        ZIndex = 2,
    }, main)

    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 8),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, tabsContainer)
    window.TabsContainer = tabsContainer

    -- Content
    local content = Create("Frame", {
        Size = UDim2.new(1, -20, 1, -115),
        Position = UDim2.new(0, 10, 0, 105),
        BackgroundColor3 = self.Theme.Card,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 2,
    }, main)
    Corner(content, 10)
    window.Content = content

    -- Theme Menu
    local themeMenu = Create("Frame", {
        Size = UDim2.new(0, 180, 0, 220),
        Position = UDim2.new(1, -190, 0, 55),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 10,
    }, main)
    Corner(themeMenu, 10)
    Stroke(themeMenu, self.Theme.Accent)

    Create("UIListLayout", {
        Padding = UDim.new(0, 6),
    }, themeMenu)

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 30),
        BackgroundTransparency = 1,
        Text = "🎨 Themes",
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
    }, themeMenu)

    for name, _ in pairs(self.Themes) do
        local btn = Create("TextButton", {
            Size = UDim2.new(1, -20, 0, 30),
            BackgroundColor3 = self.Theme.Background,
            Text = name,
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            ZIndex = 11,
        }, themeMenu)
        Corner(btn, 6)

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

-- ═══════════════════════════════════════════════════════════════════════
-- Set Theme
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:SetTheme(name)
    if not self.Themes[name] then return end
    self.CurrentTheme = name
    self.Theme = self.Themes[name]

    self:Notify({
        Title = "Theme Changed",
        Text = "Applied: " .. name,
        Type = "success",
    })
end

-- ═══════════════════════════════════════════════════════════════════════
-- CreateTab
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateTab(window, name)
    local tab = {
        Name = name,
        Window = window,
        Sections = {},
    }

    local btn = Create("TextButton", {
        Size = UDim2.new(0, 110, 1, 0),
        BackgroundColor3 = self.Theme.Background,
        Text = name,
        TextColor3 = self.Theme.SubText,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        ZIndex = 3,
    }, window.TabsContainer)
    Corner(btn, 8)
    tab.Button = btn

    local page = Create("ScrollingFrame", {
        Size = UDim2.new(1, -20, 1, -20),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = self.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ZIndex = 3,
    }, window.Content)

    Create("UIListLayout", {
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

-- ═══════════════════════════════════════════════════════════════════════
-- Section
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateSection(tab, name)
    local section = {
        Name = name,
        Tab = tab,
    }

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundTransparency = 1,
        Text = "◆ " .. name,
        TextColor3 = self.Theme.Accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 4,
    }, tab.Page)

    return section
end

-- ═══════════════════════════════════════════════════════════════════════
-- Button
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateButton(section, options)
    local name = options.Name or "Button"
    local callback = options.Callback or function() end

    local btn = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Accent,
        Text = name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        ZIndex = 4,
    }, section.Tab.Page)
    Corner(btn, 8)

    btn.MouseEnter:Connect(function()
        Tween(btn, 0.2, { BackgroundColor3 = self.Theme.AccentHover })
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, 0.2, { BackgroundColor3 = self.Theme.Accent })
    end)

    btn.MouseButton1Click:Connect(function()
        Tween(btn, 0.1, { Size = UDim2.new(0.98, 0, 0, 40) })
        task.wait(0.1)
        Tween(btn, 0.1, { Size = UDim2.new(1, 0, 0, 42) })
        callback()
    end)

    return btn
end

-- ═══════════════════════════════════════════════════════════════════════
-- Toggle
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateToggle(section, options)
    local name = options.Name or "Toggle"
    local default = options.CurrentValue or false
    local callback = options.Callback or function() end

    local value = default

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
        ZIndex = 4,
    }, section.Tab.Page)
    Corner(frame, 8)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 5,
    }, frame)

    local toggle = Create("TextButton", {
        Size = UDim2.new(0, 50, 0, 26),
        Position = UDim2.new(0, 15, 0.5, -13),
        BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75),
        Text = "",
        ZIndex = 5,
    }, frame)
    Corner(toggle, 13)

    local knob = Create("Frame", {
        Size = UDim2.new(0, 20, 0, 20),
        Position = value and UDim2.new(1, -23, 0, 3) or UDim2.new(0, 3, 0, 3),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ZIndex = 6,
    }, toggle)
    Corner(knob, 10)

    toggle.MouseButton1Click:Connect(function()
        value = not value
        Tween(toggle, 0.2, {
            BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75)
        })
        Tween(knob, 0.2, {
            Position = value and UDim2.new(1, -23, 0, 3) or UDim2.new(0, 3, 0, 3)
        })
        callback(value)
    end)

    return {
        Set = function(v)
            value = v
            Tween(toggle, 0.2, {
                BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75)
            })
            Tween(knob, 0.2, {
                Position = value and UDim2.new(1, -23, 0, 3) or UDim2.new(0, 3, 0, 3)
            })
        end,
        Get = function() return value end,
    }
end

-- ═══════════════════════════════════════════════════════════════════════
-- Slider
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateSlider(section, options)
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.CurrentValue or min
    local callback = options.Callback or function() end

    local value = default

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 55),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
        ZIndex = 4,
    }, section.Tab.Page)
    Corner(frame, 8)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 0, 25),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 5,
    }, frame)

    local valueLabel = Create("TextLabel", {
        Size = UDim2.new(0, 60, 0, 25),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundTransparency = 1,
        Text = tostring(value),
        TextColor3 = self.Theme.Accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 5,
    }, frame)

    -- Slider Bar
    local sliderBg = Create("Frame", {
        Size = UDim2.new(1, -30, 0, 6),
        Position = UDim2.new(0, 15, 0, 38),
        BackgroundColor3 = Color3.fromRGB(50, 50, 65),
        BorderSizePixel = 0,
        ZIndex = 5,
    }, frame)
    Corner(sliderBg, 3)

    local fill = Create("Frame", {
        Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
        ZIndex = 6,
    }, sliderBg)
    Corner(fill, 3)

    -- Draggable
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

-- ═══════════════════════════════════════════════════════════════════════
-- Color Picker (مع تدرجات)
-- ═══════════════════════════════════════════════════════════════════════
function NovaUI:CreateColorPicker(section, options)
    local name = options.Name or "Color"
    local default = options.Default or Color3.fromRGB(120, 80, 255)
    local callback = options.Callback or function() end

    local color = default

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
        ZIndex = 4,
    }, section.Tab.Page)
    Corner(frame, 8)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
        ZIndex = 5,
    }, frame)

    local swatch = Create("TextButton", {
        Size = UDim2.new(0, 50, 0, 26),
        Position = UDim2.new(0, 15, 0.5, -13),
        BackgroundColor3 = color,
        Text = "",
        ZIndex = 5,
    }, frame)
    Corner(swatch, 6)

    -- Picker Panel
    local pickerPanel = Create("Frame", {
        Size = UDim2.new(0, 220, 0, 260),
        Position = UDim2.new(0.5, -110, 0.5, -130),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 20,
    }, section.Tab.Page)
    Corner(pickerPanel, 10)
    Stroke(pickerPanel, self.Theme.Accent)

    -- Hue Gradient
    local hueFrame = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 40),
        BorderSizePixel = 0,
        ZIndex = 21,
    }, pickerPanel)
    Corner(hueFrame, 4)

    local hueGradient = Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
            ColorSequenceKeypoint.new(0.16, Color3.fromRGB(255, 255, 0)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(0, 255, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(0, 0, 255)),
            ColorSequenceKeypoint.new(0.83, Color3.fromRGB(255, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
        }),
    }, hueFrame)

    -- Saturation/Brightness area
    local satFrame = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 80),
        Position = UDim2.new(0, 10, 0, 70),
        BackgroundColor3 = Color3.fromRGB(255, 0, 0),
        BorderSizePixel = 0,
        ZIndex = 21,
    }, pickerPanel)
    Corner(satFrame, 4)

    local satGradient = Create("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
        }),
    }, satFrame)

    -- Presets
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

    local presetContainer = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 60),
        Position = UDim2.new(0, 10, 0, 160),
        BackgroundTransparency = 1,
        ZIndex = 21,
    }, pickerPanel)

    Create("UIGridLayout", {
        CellSize = UDim2.new(0, 20, 0, 20),
        CellPadding = UDim2.new(0, 5, 0, 5),
    }, presetContainer)

    for _, c in ipairs(presets) do
        local pBtn = Create("TextButton", {
            Size = UDim2.new(0, 20, 0, 20),
            BackgroundColor3 = c,
            Text = "",
            ZIndex = 22,
        }, presetContainer)
        Corner(pBtn, 4)

        pBtn.MouseButton1Click:Connect(function()
            color = c
            swatch.BackgroundColor3 = c
            callback(c)
        end)
    end

    -- Close picker
    local closeBtn = Create("TextButton", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 1, -40),
        BackgroundColor3 = self.Theme.Accent,
        Text = "Done",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        ZIndex = 22,
    }, pickerPanel)
    Corner(closeBtn, 6)

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

-- ═══════════════════════════════════════════════════════════════════════
-- إرجاع المكتبة
-- ═══════════════════════════════════════════════════════════════════════
return NovaUI


