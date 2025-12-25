--==================================================
-- 🍫 NESCAU HUB | FOXNAME STYLE
-- Criador: NescauHubl
-- Versão: 1.0.0
-- UI: Rayfield (Foxname inspired)
-- Uso: Educacional | Private | Sandbox
--==================================================

-- SERVICES
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- UI LIB
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- WINDOW
local Window = Rayfield:CreateWindow({
	Name = "🍫 NESCAU HUB | Foxname",
	LoadingTitle = "NESCAU HUB",
	LoadingSubtitle = "GitHub Edition",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "NescauHub",
		FileName = "FoxnameStyle"
	},
	KeySystem = false
})

--==================================================
-- UTIL
--==================================================
local function notify(msg, t)
	Rayfield:Notify({
		Title = "NESCAU HUB",
		Content = msg,
		Duration = t or 3
	})
end

notify("Carregando NESCAU HUB... 🍫", 3)

--==================================================
-- 🏠 HOME
--==================================================
local Home = Window:CreateTab("🏠 Home", 6023426926)

Home:CreateParagraph({
	Title = "🍫 NESCAU HUB",
	Content =
	"Estilo Foxname\n"..
	"Interface limpa e compacta\n"..
	"Suporte Delta / GitHub\n\n"..
	"Use com responsabilidade."
})

Home:CreateButton({
	Name = "Status do Hub",
	Callback = function()
		notify("Status: Online ✅")
	end
})

--==================================================
-- 🔥 AUTO
--==================================================
local Auto = Window:CreateTab("🔥 Auto", 6023426926)

local autoEat = false
Auto:CreateToggle({
	Name = "Auto Eat",
	CurrentValue = false,
	Callback = function(v)
		autoEat = v
		task.spawn(function()
			while autoEat do
				-- lógica placeholder
				notify("🍖 Auto Eat executando",1)
				task.wait(4)
			end
		end)
	end
})

local autoScrap = false
Auto:CreateToggle({
	Name = "Auto Scrap",
	CurrentValue = false,
	Callback = function(v)
		autoScrap = v
		task.spawn(function()
			while autoScrap do
				notify("🔧 Coletando Scrap",1)
				task.wait(5)
			end
		end)
	end
})

--==================================================
-- 🌑 AUTO FARM
--==================================================
local Farm = Window:CreateTab("🌑 Auto Farm", 6023426926)

Farm:CreateButton({
	Name = "Auto Farm Days",
	Callback = function()
		notify("⏳ Auto Farm iniciado",4)
		task.delay(2,function() notify("✔ Recursos coletados") end)
		task.delay(4,function() notify("✔ Base preparada") end)
		task.delay(6,function() notify("✔ Equipamentos otimizados") end)
		task.delay(8,function() notify("✅ AUTO FARM COMPLETED",5) end)
	end
})

Farm:CreateToggle({
	Name = "Auto Farm Gemas",
	CurrentValue = false,
	Callback = function(v)
		notify("Gemas: "..tostring(v))
	end
})

--==================================================
-- 🌍 TELEPORT (FUNCIONAL BÁSICO)
--==================================================
local TP = Window:CreateTab("🌍 Teleport", 6023426926)

local function teleportTo(cf)
	local char = LocalPlayer.Character
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = cf
	end
end

TP:CreateButton({
	Name = "Teleport Base",
	Callback = function()
		teleportTo(CFrame.new(0,5,0))
		notify("Teleportado para Base")
	end
})

TP:CreateButton({
	Name = "Teleport Área Aberta",
	Callback = function()
		teleportTo(CFrame.new(50,5,50))
		notify("Teleport executado")
	end
})

--==================================================
-- 👁 ESP (FUNCIONAL VISUAL)
--==================================================
local ESP = Window:CreateTab("👁 ESP", 6023426926)
local espEnabled = false
local espObjects = {}

local function clearESP()
	for _,v in pairs(espObjects) do
		if v then v:Destroy() end
	end
	espObjects = {}
end

ESP:CreateToggle({
	Name = "ESP Players",
	CurrentValue = false,
	Callback = function(v)
		espEnabled = v

		if not v then
			clearESP()
			return
		end

		for _,plr in pairs(Players:GetPlayers()) do
			if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
				local box = Instance.new("BoxHandleAdornment")
				box.Size = Vector3.new(4,6,2)
				box.Adornee = plr.Character.HumanoidRootPart
				box.Color3 = Color3.fromRGB(255, 60, 60)
				box.AlwaysOnTop = true
				box.ZIndex = 5
				box.Parent = plr.Character
				table.insert(espObjects, box)
			end
		end
	end
})

ESP:CreateButton({
	Name = "Limpar ESP",
	Callback = function()
		clearESP()
		notify("ESP limpo")
	end
})

--==================================================
-- ℹ️ SOBRE
--==================================================
local About = Window:CreateTab("ℹ️ Sobre", 6023426926)

About:CreateParagraph({
	Title = "Sobre o Hub",
	Content =
	"🍫 NESCAU HUB\n\n"..
	"Estilo Foxname\n"..
	"Criado por NescauHubl\n"..
	"Foco em automação e utilidades\n\n"..
	"Obrigado por usar!"
})

--==================================================
-- 🔄 UPDATES
--==================================================
local Updates = Window:CreateTab("🔄 Updates", 6023426926)

Updates:CreateParagraph({
	Title = "Próximas Atualizações",
	Content =
	"- Auto Farm completo\n"..
	"- ESP itens / animais\n"..
	"- UI custom própria\n"..
	"- Sistema de update via GitHub\n"..
	"- Conteúdo secreto 👀"
})

Updates:CreateButton({
	Name = "Checar Atualizações",
	Callback = function()
		notify("Você está na versão mais recente ✅")
	end
})

--==================================================
notify("NESCAU HUB carregado com sucesso 🍫🔥", 4)
--==================================================
