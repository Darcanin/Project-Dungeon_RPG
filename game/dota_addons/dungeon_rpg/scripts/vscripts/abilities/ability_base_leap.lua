
-- LEAP

ability_base_leap = class({})

function ability_base_leap:Spawn()
	if IsServer() then
	end
end

function ability_base_leap:GetBehavior()
	return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE
end

function ability_base_leap:GetCooldown()
	return 0
end

function ability_base_leap:GetManaCost()
	return 0
end

function ability_base_leap:OnUpgrade()
end

function ability_base_leap:OnSpellStart()
	local caster = self:GetCaster()
	local height = self:GetSpecialValueFor("leap_height")
	local duration = self:GetSpecialValueFor("leap_duration")
	caster:Leap(height, duration, true)
end