
-- BASE DEFENCE SVEN

ability_base_defence_sven = class({})

function ability_base_defence_sven:Spawn()
	if IsServer() then
	end
end

function ability_base_defence_sven:GetBehavior()
	return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE
end

function ability_base_defence_sven:GetCooldown()
	return 0
end

function ability_base_defence_sven:GetManaCost()
	return 0
end

function ability_base_defence_sven:OnUpgrade()
end

function ability_base_defence_sven:OnSpellStart()
	local caster = self:GetCaster()

	caster:StartGestureWithPlaybackRate(ACT_DOTA_CAST_ABILITY_1, 2)

	local vpcf = ParticleManager:CreateParticle("particles/sven_base_defence.vpcf", PATTACH_POINT_FOLLOW, caster)
	ParticleManager:SetParticleControlEnt( vpcf, 0, caster, PATTACH_POINT_FOLLOW, "attach_hitloc", caster:GetOrigin(), true )
	ParticleManager:SetParticleControl(vpcf, 1, Vector(0.75,0,0))
	ParticleManager:ReleaseParticleIndex(vpcf)
end