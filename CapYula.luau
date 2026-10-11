--═════════════════════════════════════════════
-- NovaUI v4.0 - مكتبة واجهة احترافية
-- Author: ibrahimkhacef5-del
-- Version: 4.0.0
-- Inspired by Rayfield (Apache 2.0)
--═════════════════════════════════════════════

local NovaUI = {}
NovaUI.__index = NovaUI
NovaUI.Version = "4.0.0"
NovaUI._hasBooted = false
NovaUI.Flags = {}

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer

NovaUI.Config = {
    WindowSize = UDim2.new(0, 600, 0, 400),
    ShowBootScreen = true,
    BootDuration = 1.5,
}

-- 12 ثيم
NovaUI.Themes = {
    Dark = {
        Background = Color3.fromRGB(15, 15, 20),
        Card = Color3.fromRGB(25, 25, 35),
        TitleBar = Color3.fromRGB(30, 30, 45),
        Sidebar = Color3.fromRGB(20, 20, 30),
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
        Sidebar = Color3.fromRGB(250, 250, 255),
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
        Sidebar = Color3.fromRGB(15, 30, 45),
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
        Sidebar = Color3.fromRGB(35, 18, 25),
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
        Sidebar = Color3.fromRGB(18, 30, 22),
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
        Sidebar = Color3.fromRGB(25, 15, 45),
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
        Sidebar = Color3.fromRGB(10, 10, 20),
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
        Sidebar = Color3.fromRGB(12, 8, 30),
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
        Sidebar = Color3.fromRGB(8, 8, 25),
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
        Sidebar = Color3.fromRGB(18, 8, 8),
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
        Sidebar = Color3.fromRGB(235, 245, 255),
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
        Sidebar = Color3.fromRGB(28, 22, 12),
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

local function Create(class, props, parent)
    local obj = Instance.new(class)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    obj.Parent = parent
    return obj
end

local function Corner(parent, radius)
    Create("UICorner", {CornerRadius = UDim.new(0, radius or 8)}, parent)
end

local function Stroke(parent, color, thickness, transparency)
    Create("UIStroke", {
        Color = color or NovaUI.Theme.Accent,
        Thickness = thickness or 1,
        Transparency = transparency or 0.5,
    }, parent)
end

local function Tween(obj, time, props)
    local tween = TweenService:Create(
        obj,
        TweenInfo.new(time or 0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        props
    )
    tween:Play()
    return tween
end

-- Boot Screen
function NovaUI:CreateBootScreen(opts)
    opts = opts or {}
    local title = opts.Title or "NovaUI"
    local subtitle = opts.Subtitle or "Loading..."
    local duration = opts.Duration or NovaUI.Config.BootDuration

    local gui = Create("ScreenGui", {
        Name = "NovaUI_Boot",
        ResetOnSpawn = false,
        DisplayOrder = 999,
    }, CoreGui)

    Create("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
    }, gui)

    local main = Create("Frame", {
        Size = UDim2.new(0, 320, 0, 160),
        Position = UDim2.new(0.5, -160, 0.5, -80),
        BackgroundColor3 = NovaUI.Theme.Background,
        BorderSizePixel = 0,
    }, gui)
    Corner(main, 14)
    Stroke(main, NovaUI.Theme.Accent, 1.5, 0.3)

    local logo = Create("Frame", {
        Size = UDim2.new(0, 50, 0, 50),
        Position = UDim2.new(0.5, -25, 0, 15),
        BackgroundColor3 = NovaUI.Theme.Accent,
        BorderSizePixel = 0,
    }, main)
    Corner(logo, 14)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 26,
        Font = Enum.Font.GothamBlack,
    }, logo)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 25),
        Position = UDim2.new(0, 0, 0, 70),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = NovaUI.Theme.Text,
        TextSize = 16,
        Font = Enum.Font.GothamBold,
    }, main)

    local subLabel = Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 20),
        Position = UDim2.new(0, 0, 0, 92),
        BackgroundTransparency = 1,
        Text = subtitle,
        TextColor3 = NovaUI.Theme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
    }, main)

    local barBg = Create("Frame", {
        Size = UDim2.new(1, -40, 0, 4),
        Position = UDim2.new(0, 20, 0, 122),
        BackgroundColor3 = Color3.fromRGB(40, 40, 55),
        BorderSizePixel = 0,
    }, main)
    Corner(barBg, 2)

    local bar = Create("Frame", {
        Size = UDim2.new(0, 0, 1, 0),
        BackgroundColor3 = NovaUI.Theme.Accent,
        BorderSizePixel = 0,
    }, barBg)
    Corner(bar, 2)

    Tween(bar, duration, {Size = UDim2.new(1, 0, 1, 0)})

    task.spawn(function()
        local steps = {"Initializing...", "Loading modules...", "Ready!"}
        for i, s in ipairs(steps) do
            subLabel.Text = s
            task.wait(duration / #steps)
        end
    end)

    task.delay(duration + 0.3, function()
        for _, obj in ipairs(main:GetDescendants()) do
            pcall(function()
                if obj:IsA("Frame") or obj:IsA("TextLabel") then
                    Tween(obj, 0.4, {BackgroundTransparency = 1, TextTransparency = 1})
                end
            end)
        end
        task.wait(0.5)
        gui:Destroy()
    end)
end

-- Notifications
function NovaUI:Notify(options)
    options = options or {}
    local title = options.Title or "Notification"
    local text = options.Text or ""
    local duration = options.Duration or 4
    local type_ = options.Type or "info"

    local colors = {
        info = NovaUI.Theme.Accent,
        success = NovaUI.Theme.Success,
        warning = NovaUI.Theme.Warning,
        error = NovaUI.Theme.Danger,
    }
    local icons = {info = "ℹ", success = "✓", warning = "⚠", error = "✕"}
    local color = colors[type_] or NovaUI.Theme.Accent
    local icon = icons[type_] or "ℹ"

    local gui = Create("ScreenGui", {
        Name = "NovaUI_Notify",
        ResetOnSpawn = false,
        DisplayOrder = 998,
    }, CoreGui)

    local notif = Create("Frame", {
        Size = UDim2.new(0, 300, 0, 70),
        Position = UDim2.new(1, 320, 0, 20),
        BackgroundColor3 = NovaUI.Theme.Card,
        BorderSizePixel = 0,
    }, gui)
    Corner(notif, 14)
    Stroke(notif, color, 1.5, 0.3)

    local iconFrame = Create("Frame", {
        Size = UDim2.new(0, 36, 0, 36),
        Position = UDim2.new(0, 12, 0.5, -18),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
    }, notif)
    Corner(iconFrame, 18)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = icon,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 18,
        Font = Enum.Font.GothamBold,
    }, iconFrame)

    Create("TextLabel", {
        Size = UDim2.new(1, -65, 0, 22),
        Position = UDim2.new(0, 55, 0, 8),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = NovaUI.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, notif)

    Create("TextLabel", {
        Size = UDim2.new(1, -65, 0, 30),
        Position = UDim2.new(0, 55, 0, 30),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = NovaUI.Theme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
    }, notif)

    local progress = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        Position = UDim2.new(0, 0, 1, -2),
        BackgroundColor3 = color,
        BorderSizePixel = 0,
    }, notif)

    Tween(notif, 0.4, {Position = UDim2.new(1, -320, 0, 20)})
    Tween(progress, duration, {Size = UDim2.new(0, 0, 0, 2)})

    task.delay(duration, function()
        Tween(notif, 0.4, {Position = UDim2.new(1, 320, 0, 20)})
        task.wait(0.5)
        gui:Destroy()
    end)
end

-- CreateWindow (مع Sidebar)
function NovaUI:CreateWindow(options)
    options = options or {}

    if options.Theme and self.Themes[options.Theme] then
        self.CurrentTheme = options.Theme
        self.Theme = self.Themes[options.Theme]
    end

    if NovaUI.Config.ShowBootScreen and not NovaUI._hasBooted then
        NovaUI._hasBooted = true
        self:CreateBootScreen({
            Title = options.LoadingTitle or "NovaUI",
            Subtitle = options.LoadingSubtitle or "Loading...",
            Duration = options.LoadingDuration or NovaUI.Config.BootDuration,
        })
        task.wait(0.3)
    end

    local window = setmetatable({
        Options = options,
        Tabs = {},
        CurrentTab = nil,
        Gui = nil,
    }, self)

    local winSize = options.Size or NovaUI.Config.WindowSize

    local gui = Create("ScreenGui", {
        Name = "NovaUI",
        ResetOnSpawn = false,
    }, CoreGui)
    window.Gui = gui

    local main = Create("Frame", {
        Size = winSize,
        Position = UDim2.new(0.5, -winSize.X.Offset/2, 0.5, -winSize.Y.Offset/2),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, gui)
    window.Main = main
    Corner(main, 16)
    Stroke(main, self.Theme.Accent, 2, 0.4)

    -- Sidebar
    local sidebar = Create("Frame", {
        Size = UDim2.new(0, 145, 1, -20),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundColor3 = self.Theme.Sidebar,
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ZIndex = 2,
    }, main)
    Corner(sidebar, 12)
    window.Sidebar = sidebar

    -- Logo
    local logoFrame = Create("Frame", {
        Size = UDim2.new(0, 38, 0, 38),
        Position = UDim2.new(0, 12, 0, 12),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
        ZIndex = 3,
    }, sidebar)
    Corner(logoFrame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = "N",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 18,
        Font = Enum.Font.GothamBlack,
        ZIndex = 4,
    }, logoFrame)

    Create("TextLabel", {
        Size = UDim2.new(1, -60, 0, 38),
        Position = UDim2.new(0, 58, 0, 12),
        BackgroundTransparency = 1,
        Text = options.Name or "NovaUI",
        TextColor3 = self.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate = Enum.TextTruncate.AtEnd,
        ZIndex = 3,
    }, sidebar)

    -- Tabs Container
    local tabsContainer = Create("Frame", {
        Size = UDim2.new(1, -20, 1, -70),
        Position = UDim2.new(0, 10, 0, 60),
        BackgroundTransparency = 1,
        ZIndex = 3,
    }, sidebar)

    Create("UIListLayout", {
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 5),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }, tabsContainer)
    window.TabsContainer = tabsContainer

    -- Title Bar (يمين)
    local titleBar = Create("Frame", {
        Size = UDim2.new(1, -165, 0, 40),
        Position = UDim2.new(0, 165, 0, 10),
        BackgroundColor3 = self.Theme.TitleBar,
        BackgroundTransparency = 0.3,
        BorderSizePixel = 0,
        ZIndex = 2,
    }, main)
    Corner(titleBar, 10)

    -- أزرار التحكم
    local function makeControlBtn(text, xOffset, bgColor, textColor)
        local btn = Create("TextButton", {
            Size = UDim2.new(0, 28, 0, 28),
            Position = UDim2.new(1, xOffset, 0.5, -14),
            BackgroundColor3 = bgColor,
            Text = text,
            TextColor3 = textColor,
            TextSize = 12,
            Font = Enum.Font.GothamBold,
            ZIndex = 3,
            AutoButtonColor = false,
        }, titleBar)
        Corner(btn, 7)
        return btn
    end

    local themeBtn = makeControlBtn("🎨", -70, self.Theme.Card, self.Theme.Text)
    local minBtn = makeControlBtn("—", -38, self.Theme.Card, self.Theme.SubText)
    local closeBtn = makeControlBtn("✕", -6, self.Theme.Danger, Color3.fromRGB(255,255,255))

    local function addPressEffect(btn, originalSize)
        btn.MouseButton1Down:Connect(function()
            Tween(btn, 0.1, {Size = UDim2.new(originalSize.X.Scale, originalSize.X.Offset * 0.9,
                                                originalSize.Y.Scale, originalSize.Y.Offset * 0.9)})
        end)
        btn.MouseButton1Up:Connect(function()
            Tween(btn, 0.1, {Size = originalSize})
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, 0.1, {Size = originalSize})
        end)
    end

    addPressEffect(themeBtn, themeBtn.Size)
    addPressEffect(minBtn, minBtn.Size)
    addPressEffect(closeBtn, closeBtn.Size)

    closeBtn.MouseButton1Click:Connect(function() gui:Destroy() end)

    -- Minimize
    local minimized = false
    minBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            Tween(main, 0.3, {Size = UDim2.new(main.Size.X.Scale, main.Size.X.Offset, 0, 45)})
        else
            Tween(main, 0.3, {Size = winSize})
        end
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

    -- Content
    local content = Create("Frame", {
        Size = UDim2.new(1, -175, 1, -70),
        Position = UDim2.new(0, 165, 0, 58),
        BackgroundColor3 = self.Theme.Card,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 2,
    }, main)
    Corner(content, 10)
    window.Content = content

    -- Theme Menu
    local themeMenu = Create("Frame", {
        Size = UDim2.new(0, 180, 0, 260),
        Position = UDim2.new(1, -190, 0, 55),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 10,
    }, main)
    Corner(themeMenu, 12)
    Stroke(themeMenu, self.Theme.Accent)

    Create("UIListLayout", {Padding = UDim.new(0, 4)}, themeMenu)

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 28),
        BackgroundTransparency = 1,
        Text = "🎨 الثيمات",
        TextColor3 = self.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
    }, themeMenu)

    for name, _ in pairs(self.Themes) do
        local btn = Create("TextButton", {
            Size = UDim2.new(1, -20, 0, 26),
            BackgroundColor3 = self.Theme.Background,
            Text = name,
            TextColor3 = self.Theme.Text,
            TextSize = 12,
            Font = Enum.Font.Gotham,
            ZIndex = 11,
            AutoButtonColor = false,
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

function NovaUI:SetTheme(name)
    if not self.Themes[name] then return end
    self.CurrentTheme = name
    self.Theme = self.Themes[name]
    self:Notify({Title = "Theme", Text = "Applied: " .. name, Type = "success"})
end

-- CreateTab (Sidebar)
function NovaUI:CreateTab(window, name, icon)
    local tab = {Name = name, Window = window}

    local btn = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 35),
        BackgroundColor3 = self.Theme.Background,
        BackgroundTransparency = 0.7,
        Text = (icon and (icon .. "  ") or "") .. name,
        TextColor3 = self.Theme.SubText,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 3,
        AutoButtonColor = false,
    }, window.TabsContainer)
    Corner(btn, 8)

    local pad = Create("UIPadding", {
        PaddingLeft = UDim.new(0, 10),
    }, btn)

    tab.Button = btn

    local page = Create("ScrollingFrame", {
        Size = UDim2.new(1, -20, 1, -20),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = self.Theme.Accent,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        ZIndex = 3,
    }, window.Content)

    Create("UIListLayout", {Padding = UDim.new(0, 8)}, page)
    tab.Page = page

    btn.MouseButton1Click:Connect(function()
        for _, t in pairs(window.Tabs) do
            t.Page.Visible = false
            t.Button.BackgroundColor3 = self.Theme.Background
            t.Button.BackgroundTransparency = 0.7
            t.Button.TextColor3 = self.Theme.SubText
        end
        page.Visible = true
        btn.BackgroundColor3 = self.Theme.Accent
        btn.BackgroundTransparency = 0
        btn.TextColor3 = self.Theme.Text
        window.CurrentTab = tab
    end)

    table.insert(window.Tabs, tab)
    if #window.Tabs == 1 then
        page.Visible = true
        btn.BackgroundColor3 = self.Theme.Accent
        btn.BackgroundTransparency = 0
        btn.TextColor3 = self.Theme.Text
        window.CurrentTab = tab
    end

    return tab
end

function NovaUI:CreateSection(tab, name)
    local section = {Name = name, Tab = tab}
    Create("TextLabel", {
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

function NovaUI:CreateButton(section, options)
    local name = options.Name or "Button"
    local callback = options.Callback or function() end

    local btn = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = self.Theme.Accent,
        Text = name,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
    }, section.Tab.Page)
    Corner(btn, 10)
    Stroke(btn, self.Theme.AccentHover, 1, 0.7)

    btn.MouseEnter:Connect(function()
        Tween(btn, 0.2, {BackgroundColor3 = self.Theme.AccentHover})
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, 0.2, {BackgroundColor3 = self.Theme.Accent})
    end)

    btn.MouseButton1Down:Connect(function()
        Tween(btn, 0.1, {Size = UDim2.new(0.98, 0, 0.9, 0)})
    end)
    btn.MouseButton1Up:Connect(function()
        Tween(btn, 0.1, {Size = UDim2.new(1, 0, 0, 40)})
    end)
    btn.MouseLeave:Connect(function()
        Tween(btn, 0.1, {Size = UDim2.new(1, 0, 0, 40)})
    end)

    btn.MouseButton1Click:Connect(callback)
    return btn
end

function NovaUI:CreateToggle(section, options)
    local name = options.Name or "Toggle"
    local default = options.CurrentValue or false
    local callback = options.Callback or function() end
    local value = default

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local toggle = Create("TextButton", {
        Size = UDim2.new(0, 48, 0, 24),
        Position = UDim2.new(0, 15, 0.5, -12),
        BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75),
        Text = "",
        AutoButtonColor = false,
    }, frame)
    Corner(toggle, 12)

    local knob = Create("Frame", {
        Size = UDim2.new(0, 18, 0, 18),
        Position = value and UDim2.new(1, -21, 0, 3) or UDim2.new(0, 3, 0, 3),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, toggle)
    Corner(knob, 9)

    toggle.MouseButton1Click:Connect(function()
        value = not value
        Tween(toggle, 0.2, {BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75)})
        Tween(knob, 0.2, {Position = value and UDim2.new(1, -21, 0, 3) or UDim2.new(0, 3, 0, 3)})
        callback(value)
    end)

    return {
        Set = function(v)
            value = v
            toggle.BackgroundColor3 = value and self.Theme.Accent or Color3.fromRGB(60, 60, 75)
            knob.Position = value and UDim2.new(1, -21, 0, 3) or UDim2.new(0, 3, 0, 3)
        end,
        Get = function() return value end,
    }
end

function NovaUI:CreateSlider(section, options)
    local name = options.Name or "Slider"
    local min = options.Min or 0
    local max = options.Max or 100
    local default = options.CurrentValue or min
    local callback = options.Callback or function() end
    local value = default

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 52),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 0, 22),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local valueLabel = Create("TextLabel", {
        Size = UDim2.new(0, 60, 0, 22),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundTransparency = 1,
        Text = tostring(value),
        TextColor3 = self.Theme.Accent,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    }, frame)

    local sliderBg = Create("Frame", {
        Size = UDim2.new(1, -30, 0, 8),
        Position = UDim2.new(0, 15, 0, 34),
        BackgroundColor3 = Color3.fromRGB(45, 45, 60),
        BorderSizePixel = 0,
    }, frame)
    Corner(sliderBg, 4)

    local fill = Create("Frame", {
        Size = UDim2.new((value - min) / (max - min), 0, 1, 0),
        BackgroundColor3 = self.Theme.Accent,
        BorderSizePixel = 0,
    }, sliderBg)
    Corner(fill, 4)

    local knob = Create("Frame", {
        Size = UDim2.new(0, 18, 0, 18),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new((value - min) / (max - min), 0, 0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderSizePixel = 0,
        ZIndex = 5,
    }, sliderBg)
    Corner(knob, 9)

    local dragging = false

    local function updateFromX(x)
        local rel = math.clamp((x - sliderBg.AbsolutePosition.X) / sliderBg.AbsoluteSize.X, 0, 1)
        value = math.floor(min + (max - min) * rel)
        fill.Size = UDim2.new(rel, 0, 1, 0)
        knob.Position = UDim2.new(rel, 0, 0.5, 0)
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
            knob.Position = UDim2.new(rel, 0, 0.5, 0)
            valueLabel.Text = tostring(value)
        end,
        Get = function() return value end,
    }
end

function NovaUI:CreateColorPicker(section, options)
    local name = options.Name or "Color"
    local default = options.Default or Color3.fromRGB(120, 80, 255)
    local callback = options.Callback or function() end
    local color = default

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -80, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local swatch = Create("TextButton", {
        Size = UDim2.new(0, 50, 0, 26),
        Position = UDim2.new(0, 15, 0.5, -13),
        BackgroundColor3 = color,
        Text = "",
        AutoButtonColor = false,
    }, frame)
    Corner(swatch, 8)
    Stroke(swatch, self.Theme.Border, 1, 0.5)

    local pickerPanel = Create("Frame", {
        Size = UDim2.new(0, 240, 0, 220),
        Position = UDim2.new(0.5, -120, 0.5, -110),
        BackgroundColor3 = self.Theme.Card,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 20,
    }, section.Tab.Page)
    Corner(pickerPanel, 12)
    Stroke(pickerPanel, self.Theme.Accent)

    local presets = {
        Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 128, 0),
        Color3.fromRGB(255, 255, 0), Color3.fromRGB(0, 255, 0),
        Color3.fromRGB(0, 255, 255), Color3.fromRGB(0, 128, 255),
        Color3.fromRGB(0, 0, 255), Color3.fromRGB(128, 0, 255),
        Color3.fromRGB(255, 0, 255), Color3.fromRGB(255, 0, 128),
        Color3.fromRGB(255, 255, 255), Color3.fromRGB(0, 0, 0),
        Color3.fromRGB(120, 80, 255), Color3.fromRGB(255, 100, 150),
        Color3.fromRGB(80, 200, 120), Color3.fromRGB(255, 180, 60),
    }

    local presetContainer = Create("Frame", {
        Size = UDim2.new(1, -20, 1, -60),
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundTransparency = 1,
        ZIndex = 21,
    }, pickerPanel)

    Create("UIGridLayout", {
        CellSize = UDim2.new(0, 32, 0, 32),
        CellPadding = UDim2.new(0, 8, 0, 8),
    }, presetContainer)

    for _, c in ipairs(presets) do
        local pBtn = Create("TextButton", {
            Size = UDim2.new(0, 32, 0, 32),
            BackgroundColor3 = c,
            Text = "",
            ZIndex = 22,
            AutoButtonColor = false,
        }, presetContainer)
        Corner(pBtn, 8)
        Stroke(pBtn, self.Theme.Border, 1, 0.6)

        pBtn.MouseButton1Click:Connect(function()
            color = c
            swatch.BackgroundColor3 = c
            callback(c)
        end)
    end

    local closeBtn = Create("TextButton", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 1, -40),
        BackgroundColor3 = self.Theme.Accent,
        Text = "Done",
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        ZIndex = 22,
        AutoButtonColor = false,
    }, pickerPanel)
    Corner(closeBtn, 8)

    closeBtn.MouseButton1Click:Connect(function()
        pickerPanel.Visible = false
    end)

    swatch.MouseButton1Click:Connect(function()
        pickerPanel.Visible = not pickerPanel.Visible
    end)

    return {
        Set = function(c) color = c; swatch.BackgroundColor3 = c end,
        Get = function() return color end,
    }
end

function NovaUI:CreateDropdown(section, options)
    local name = options.Name or "Dropdown"
    local opts = options.Options or {}
    local default = options.CurrentOption or opts[1]
    local callback = options.Callback or function() end
    local current = default
    local isOpen = false

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -100, 0, 25),
        Position = UDim2.new(0, 15, 0, 8),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local currentLabel = Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 20),
        Position = UDim2.new(0, 15, 0, 35),
        BackgroundTransparency = 1,
        Text = tostring(current),
        TextColor3 = self.Theme.Accent,
        TextSize = 12,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local arrow = Create("TextLabel", {
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(0, 10, 0, 6),
        BackgroundTransparency = 1,
        Text = "▼",
        TextColor3 = self.Theme.SubText,
        TextSize = 14,
        Font = Enum.Font.Gotham,
    }, frame)

    local optionsList = Create("Frame", {
        Size = UDim2.new(1, -20, 0, 0),
        Position = UDim2.new(0, 10, 0, 60),
        BackgroundTransparency = 1,
        ClipsDescendants = true,
    }, frame)

    Create("UIListLayout", {Padding = UDim.new(0, 4)}, optionsList)

    for _, opt in ipairs(opts) do
        local optBtn = Create("TextButton", {
            Size = UDim2.new(1, 0, 0, 30),
            BackgroundColor3 = self.Theme.Card,
            Text = tostring(opt),
            TextColor3 = self.Theme.Text,
            TextSize = 13,
            Font = Enum.Font.Gotham,
            AutoButtonColor = false,
        }, optionsList)
        Corner(optBtn, 6)

        optBtn.MouseButton1Click:Connect(function()
            current = opt
            currentLabel.Text = tostring(opt)
            isOpen = false
            Tween(frame, 0.3, {Size = UDim2.new(1, 0, 0, 42)})
            arrow.Text = "▼"
            callback(opt)
        end)
    end

    local clickArea = Create("TextButton", {
        Size = UDim2.new(1, 0, 0, 42),
        BackgroundTransparency = 1,
        Text = "",
        ZIndex = 5,
    }, frame)

    clickArea.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            local height = 42 + (#opts * 34) + 10
            Tween(frame, 0.3, {Size = UDim2.new(1, 0, 0, height)})
            arrow.Text = "▲"
        else
            Tween(frame, 0.3, {Size = UDim2.new(1, 0, 0, 42)})
            arrow.Text = "▼"
        end
    end)

    return {
        Set = function(v) current = v; currentLabel.Text = tostring(v) end,
        Get = function() return current end,
    }
end

function NovaUI:CreateInput(section, options)
    local name = options.Name or "Input"
    local placeholder = options.PlaceholderText or "اكتب هنا..."
    local callback = options.Callback or function() end

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 65),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -30, 0, 20),
        Position = UDim2.new(0, 15, 0, 8),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local inputFrame = Create("Frame", {
        Size = UDim2.new(1, -30, 0, 30),
        Position = UDim2.new(0, 15, 0, 30),
        BackgroundColor3 = Color3.fromRGB(15, 15, 25),
        BorderSizePixel = 0,
    }, frame)
    Corner(inputFrame, 8)
    Stroke(inputFrame, self.Theme.Border, 1, 0.5)

    local textbox = Create("TextBox", {
        Size = UDim2.new(1, -20, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        Text = "",
        PlaceholderText = placeholder,
        TextColor3 = self.Theme.Text,
        PlaceholderColor3 = self.Theme.SubText,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        ClearTextOnFocus = false,
    }, inputFrame)

    textbox.FocusLost:Connect(function(enter)
        callback(textbox.Text, enter)
    end)

    return {
        Set = function(t) textbox.Text = t end,
        Get = function() return textbox.Text end,
    }
end

function NovaUI:CreateKeybind(section, options)
    local name = options.Name or "Keybind"
    local default = options.CurrentKeybind or "F"
    local callback = options.Callback or function() end
    local current = default
    local checking = false

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 40),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -90, 1, 0),
        Position = UDim2.new(0, 15, 0, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    local keyFrame = Create("Frame", {
        Size = UDim2.new(0, 65, 0, 26),
        Position = UDim2.new(0, 12, 0.5, -13),
        BackgroundColor3 = Color3.fromRGB(15, 15, 25),
        BorderSizePixel = 0,
    }, frame)
    Corner(keyFrame, 6)
    Stroke(keyFrame, self.Theme.Accent, 1, 0.5)

    local keyLabel = Create("TextButton", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        Text = current,
        TextColor3 = self.Theme.Accent,
        TextSize = 13,
        Font = Enum.Font.GothamBold,
        AutoButtonColor = false,
    }, keyFrame)

    keyLabel.MouseButton1Click:Connect(function()
        checking = true
        keyLabel.Text = "..."
    end)

    UserInputService.InputBegan:Connect(function(input, processed)
        if checking then
            if input.KeyCode ~= Enum.KeyCode.Unknown then
                local splitMsg = string.split(tostring(input.KeyCode), ".")
                local newKey = splitMsg[#splitMsg]
                current = newKey
                keyLabel.Text = newKey
                checking = false
                callback(newKey)
            end
        else
            if input.KeyCode == Enum.KeyCode[current] and not processed then
                callback(current, true)
            end
        end
    end)

    return {
        Set = function(k) current = k; keyLabel.Text = k end,
        Get = function() return current end,
    }
end

function NovaUI:CreateLabel(section, text)
    return Create("TextLabel", {
        Size = UDim2.new(1, 0, 0, 28),
        BackgroundTransparency = 1,
        Text = text,
        TextColor3 = self.Theme.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, section.Tab.Page)
end

function NovaUI:CreateParagraph(section, options)
    local title = options.Title or "Paragraph"
    local content = options.Content or ""

    local frame = Create("Frame", {
        Size = UDim2.new(1, 0, 0, 75),
        BackgroundColor3 = self.Theme.Background,
        BorderSizePixel = 0,
    }, section.Tab.Page)
    Corner(frame, 10)

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 22),
        Position = UDim2.new(0, 10, 0, 8),
        BackgroundTransparency = 1,
        Text = title,
        TextColor3 = self.Theme.Text,
        TextSize = 14,
        Font = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Right,
    }, frame)

    Create("TextLabel", {
        Size = UDim2.new(1, -20, 0, 38),
        Position = UDim2.new(0, 10, 0, 32),
        BackgroundTransparency = 1,
        Text = content,
        TextColor3 = self.Theme.SubText,
        TextSize = 12,
        Font = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextWrapped = true,
    }, frame)

    return frame
end

function NovaUI:CreateDivider(section)
    return Create("Frame", {
        Size = UDim2.new(1, -30, 0, 1),
        Position = UDim2.new(0, 15, 0, 5),
        BackgroundColor3 = self.Theme.Border,
        BorderSizePixel = 0,
    }, section.Tab.Page)
end

return NovaUI
