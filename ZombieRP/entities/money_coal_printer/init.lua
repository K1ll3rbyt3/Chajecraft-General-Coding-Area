-- RRPX Money Printer reworked for DarkRP by philxyz
-- Modified by Koolaidmini
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

-- [ ALTER THESE VALUES ] ---- 
local printTime			= 4								--	How long the printer takes to generate money.
local minPrint 			= 5								-- 	The minimum amount the printer can generate.
local maxPrint			= 7								-- 	The maximum amount the printer can generate.
local upgradedExtra 	= maxPrint * 0.5				-- 	If the printer is upgraded, how much extra will they get?
local printerColor 		= Color( 255, 255, 255, 255 )	--  The color of the actual printer prop.
local coolantSystem 	= false							-- 	Toggles if the coolant system is enabled for this printer.
local coolantLoss 		= 0.2							--	Percentage of Coolant lost for each print.
------------------------------ 

ENT.SeizeReward = 950

local PrintMore
function ENT:Initialize()
	self:SetModel("models/props_lab/reciever01a.mdl")
	self:SetColor( printerColor )
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	phys:Wake()

	self.sparking = false
	self.damage = 500
	self.IsMoneyPrinter = true
	self:SetNWInt("PrintA",0)
	self:SetNWInt("PrintB",500)
	self:SetNWBool("Upgraded", false)
	if coolantSystem then
		self:SetNWInt("Coolant",100)
		self:SetNWBool("CoolantToggle", true)
	end
	timer.Simple(0.1, function() PrintMore(self) end)
end

function ENT:OnTakeDamage(dmg)
	if self.burningup then return end
	self.damage = (self.damage or 500) - math.ceil(dmg:GetDamage())
	self:SetNWInt("PrintB",self.damage)
	if self.damage <= 0 then
		self:SetNWInt("PrintB", 0)
		local rnd = math.random(1, 10)
		if rnd < 6 then
			self:BurstIntoFlames()
		else
			self:Destruct()
			self:Remove()
		end
	end
end

function ENT:StartTouch(hitEnt)
	if self:GetNWBool("CoolantToggle") then
		if hitEnt.IsCoolant then
			self.Coolant = hitEnt
			local CoolantLevels = self:GetNWInt("Coolant")
			local amount = CoolantLevels + 100
			if amount > 100 then
				amount = 100
			end
			self:SetNWInt("Coolant", amount) 
			self.Coolant:Remove()
		end
	end
	if hitEnt.IsUpgrade then
		self.Upgrade = hitEnt
		if self:GetNWBool("Upgraded") then return end
		self:SetNWBool("Upgraded", true)
		self.Upgrade:Remove()
	end
end

function ENT:Use(activator)
	if ( activator:IsPlayer() and self:GetNWInt("PrintA") >= 1 ) then
		activator:AddMoney( self:GetNWInt("PrintA") );
		GAMEMODE:Notify(activator, 0, 4, "You have collected $" .. self:GetNWInt("PrintA").. " from a Coal Printer." )
		self:SetNWInt("PrintA",0)
	end
end

function ENT:Destruct()
	local vPoint = self:GetPos()
	local effectdata = EffectData()
	effectdata:SetStart(vPoint)
	effectdata:SetOrigin(vPoint)
	effectdata:SetScale(1)
	util.Effect("Explosion", effectdata)
	DarkRP.notify(self:Getowning_ent(), 1, 4, DarkRP.getPhrase("money_printer_exploded"))
end

function ENT:BurstIntoFlames()
	DarkRP.notify(self:Getowning_ent(), 0, 4, DarkRP.getPhrase("money_printer_overheating"))
	self.burningup = true
	local burntime = math.random(8, 18)
	self:Ignite(burntime, 0)
	timer.Simple(burntime, function() self:Fireball() end)
end

function ENT:Fireball()
	if not self:IsOnFire() then self.burningup = false return end
	local dist = math.random(20, 280) -- Explosion radius
	self:Destruct()
	for k, v in pairs(ents.FindInSphere(self:GetPos(), dist)) do
		if not v:IsPlayer() and not v:IsWeapon() and v:GetClass() ~= "predicted_viewmodel" and not v.IsMoneyPrinter then
			v:Ignite(math.random(5, 22), 0)
		elseif v:IsPlayer() then
			local distance = v:GetPos():Distance(self:GetPos())
			v:TakeDamage(distance / dist * 100, self, self)
		end
	end
	self:Remove()
end

PrintMore = function(ent)
	if not IsValid(ent) then return end

	timer.Simple(printTime / 2, function()
		if not IsValid(ent) then return end
		ent:CreateMoneybag()
	end)
end

function ENT:CreateMoneybag()
	if not IsValid(self) then return end
	if self:IsOnFire() then return end
	local Y = math.random(minPrint, maxPrint)
	if self:GetNWBool("Upgraded") then
		Y = Y + math.floor(upgradedExtra)
	end
	local amount = self:GetNWInt("PrintA") + Y
	self:SetNWInt("PrintA",amount)
	
	local coolantLeft = self:GetNWInt("Coolant") - coolantLoss
	if coolantLeft <= 0 then
		coolantLeft = 0
	end
	self:SetNWInt("Coolant", coolantLeft)
	
	if self:GetNWBool("CoolantToggle") then
		timer.Simple(printTime / 2, function() if coolantLeft <= 0 then self.damage = self.damage - 5 self:SetNWInt("PrintB",self.damage) end end)
	end
	
	timer.Simple(printTime / 2, function() PrintMore(self) end)
	timer.Simple(printTime / 2, function() if self.damage <= 499 then self.damage = self.damage + 1 self:SetNWInt("PrintB",self.damage) end end)
end

function ENT:Think()

	if self:WaterLevel() > 0 then
		self:Destruct()
		self:Remove()
		return
	end

	if not self.sparking then return end

	local effectdata = EffectData()
	effectdata:SetOrigin(self:GetPos())
	effectdata:SetMagnitude(1)
	effectdata:SetScale(1)
	effectdata:SetRadius(2)
	util.Effect("Sparks", effectdata)
end

function ENT:OnRemove()
	if self.sound then
		self.sound:Stop()
	end
end
