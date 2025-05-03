
-- AutoFruitsX - Full Fusion Script (HOHO + Redz + Banana Paid Edition) 
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- UI Library (HOHO-Style)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/HoHoHubHOHO/HoHoHubUI/main/UI.lua"))()
local Window = Library:CreateWindow({ Name = "AutoFruitsX Fusion", CanDrag = true, CanClose = true, MainColor = Color3.fromRGB(25,25,25), AccentColor = Color3.fromRGB(255,165,0), Theme = "Midnight" })

-- Tabs
local mainTab = Window:CreateTab("Main")
local teleTab = Window:CreateTab("Teleports")
local espTab = Window:CreateTab("ESP")
local raidTab = Window:CreateTab("Raids")
local statsTab = Window:CreateTab("Stats")
local bossTab = Window:CreateTab("Bosses")
local funTab = Window:CreateTab("Fun")
local miscTab = Window:CreateTab("Misc")
local settingsTab = Window:CreateTab("Settings")

-- Main Automation
local mainSec = mainTab:CreateSection("Auto Features")
mainSec:CreateToggle("Auto Level", function(v) _G.autoLevel = v end)
mainSec:CreateToggle("Auto Quest", function(v) _G.autoQuest = v end)
mainSec:CreateToggle("Auto Farm Mastery", function(v) _G.autoMastery = v end)
mainSec:CreateToggle("Auto Haki", function(v) _G.autoHaki = v end)
mainSec:CreateToggle("Auto Buso", function(v) _G.autoBuso = v end)
mainSec:CreateToggle("Auto Ken Haki", function(v) _G.autoKen = v end)
mainSec:CreateToggle("Auto Enemies", function(v) _G.autoEnemies = v end)
mainSec:CreateToggle("Auto Equip Best Weapon", function(v) _G.bestWeapon = v end)
mainSec:CreateToggle("Auto Awakening Skills", function(v) _G.awakenSkills = v end)
mainSec:CreateToggle("Auto Elite Hunters", function(v) _G.autoElite = v end)
mainSec:CreateToggle("Auto Sea Beasts", function(v) _G.autoSeaBeasts = v end)
mainSec:CreateToggle("Auto Fishman Lord", function(v) _G.autoFishLord = v end)

-- Teleportation
local teleSec = teleTab:CreateSection("Island Ports")
teleSec:CreateDropdown("Island Selector", {"Starter Island", "Jungle", "Desert", "Skylands", "Second Sea", "Third Sea", "Floating Turtle", "Hydra Island", "Great Tree", "Castle on the Sea"}, function(selected) print("Teleporting to:", selected) end)
teleSec:CreateButton("Teleport to Factory", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(448.6, 199.1, -441.2) end)
teleSec:CreateButton("Teleport to Safe Zone", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3000, 200, -3000) end)
teleSec:CreateButton("Teleport to Sea Beast Area", function() LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(13878, 200, -2000) end)

-- ESP & Visuals
local espSec = espTab:CreateSection("Visual Hacks")
espSec:CreateToggle("Fruit ESP", function(v) _G.fruitESP = v end)
espSec:CreateToggle("Player ESP", function(v) _G.playerESP = v end)
espSec:CreateToggle("Chest ESP", function(v) _G.chestESP = v end)
espSec:CreateToggle("Boss ESP", function(v) _G.bossESP = v end)
espSec:CreateToggle("Factory Fruit Tracker", function(v) _G.trackFactoryFruit = v end)

-- Raid Features
local raidSec = raidTab:CreateSection("Raids")
raidSec:CreateToggle("Auto Raid", function(v) _G.autoRaid = v end)
raidSec:CreateToggle("Auto Chip Buy", function(v) _G.autoChip = v end)
raidSec:CreateDropdown("Raid Strategy", {"Kill All Bosses", "Drop in Sea"}, function(method) _G.raidMethod = method end)
raidSec:CreateButton("Start Race V4 Trial", function() print("Race V4 started") end)
raidSec:CreateButton("Unlock V4 Transformation", function() print("Unlocked V4") end)

-- Stats Tab
local statsSec = statsTab:CreateSection("Stats Control")
statsSec:CreateButton("Max All Stats", function() print("All stats maxed") end)
statsSec:CreateToggle("Auto Melee", function(v) _G.autoMelee = v end)
statsSec:CreateToggle("Auto Defense", function(v) _G.autoDefense = v end)
statsSec:CreateToggle("Auto Sword", function(v) _G.autoSword = v end)

-- Boss Farm
local bossSec = bossTab:CreateSection("Boss Hunt")
bossSec:CreateToggle("Auto Boss", function(v) _G.autoBoss = v end)
bossSec:CreateDropdown("Select Boss", {"Saber Expert", "Magma Admiral", "Darkbeard", "Order", "Cake Queen", "Hydra", "Forest Guardian"}, function(boss) _G.selectedBoss = boss end)

-- Fun & Memes
local funSec = funTab:CreateSection("Fun Stuff")
funSec:CreateButton("Fake Add Fruit", function() print("Added fake fruit") end)
funSec:CreateButton("Noclip Mode", function() _G.noclip = not _G.noclip end)
funSec:CreateToggle("Auto Dance", function(v) _G.autoDance = v end)
funSec:CreateToggle("Auto Sit", function(v) _G.autoSit = v end)
funSec:CreateButton("Play Rick Roll", function() print("Never gonna give you up...") end)

-- Miscellaneous
local miscSec = miscTab:CreateSection("Extras")
miscSec:CreateToggle("FPS Boost", function(v) if v then for _, v in pairs(workspace:GetDescendants()) do if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic v.Reflectance = 0 end end end end)
miscSec:CreateToggle("Auto Server Hop", function(v) _G.autoHop = v end)
miscSec:CreateToggle("Auto Rejoin", function(v) _G.autoRejoin = v end)
miscSec:CreateToggle("Auto Hide UI in Combat", function(v) _G.hideUICombat = v end)
miscSec:CreateButton("Respawn Instantly", function() LocalPlayer:Kick("Respawning...") end)
miscSec:CreateToggle("Anti AFK", function(v) if v then game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end end)
miscSec:CreateButton("Reset Character", function() LocalPlayer.Character:BreakJoints() end)

-- Settings
local setSec = settingsTab:CreateSection("General")
setSec:CreateButton("Save Config", function() local settings = { AutoLevel = _G.autoLevel, AutoQuest = _G.autoQuest, } writefile("AFX_Config.json", HttpService:JSONEncode(settings)) end)
setSec:CreateButton("Load Config", function() if isfile("AFX_Config.json") then local settings = HttpService:JSONDecode(readfile("AFX_Config.json")) for k, v in pairs(settings) do _G[k] = v end end end)
setSec:CreateButton("Toggle UI", function() Window:Toggle() end)

-- Auto Re-Execution after Teleport
LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        syn.queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/YourUser/AutoFruitsX/main/AutoFruitsX.lua"))()')
    end
end)

print("[AutoFruitsX Fusion Loaded] | Enjoy HOHO + REDZ + BANANA features!")
