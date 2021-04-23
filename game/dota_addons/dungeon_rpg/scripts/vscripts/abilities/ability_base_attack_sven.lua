
-- BASE ATTACK SVEN

ability_base_attack_sven = class({})

function ability_base_attack_sven:Spawn()
	if IsServer() then
	end
end

function ability_base_attack_sven:GetBehavior()
	return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE
end

function ability_base_attack_sven:GetCooldown()
	return 0
end

function ability_base_attack_sven:GetManaCost()
	return 0
end

function ability_base_attack_sven:OnUpgrade()
end

function ability_base_attack_sven:OnSpellStart()
	local caster = self:GetCaster()
	local base_damage = self:GetSpecialValueFor("base_damage")
	local radius = self:GetSpecialValueFor("radius")
	local pos = caster:GetAbsOrigin()
	local forwardPoint = pos + caster:GetForwardVector() * radius
	--DebugDrawCircle(forwardPoint, Vector(0,255,0), 1, radius, false, 5.0)

	caster:StartGestureWithPlaybackRate(ACT_DOTA_ATTACK, 2)

	local vpcf = ParticleManager:CreateParticle("particles/sven_base_attack.vpcf", PATTACH_POINT_FOLLOW, caster)
	ParticleManager:SetParticleControlEnt( vpcf, 0, caster, PATTACH_POINT_FOLLOW, "attach_sword_end", caster:GetOrigin(), true )
	ParticleManager:ReleaseParticleIndex(vpcf)

	local enemies = GetEnemiesAround(caster, radius, forwardPoint)
	if #enemies > 0 then
		for _,enemy in pairs(enemies) do
			if enemy and enemy:IsAlive() then
				if caster:CanDamageEnemy_Melee(enemy) then
					Damage_Physical(caster, enemy, base_damage, self)
				end
			end
		end
	end
	caster:TestUnit()
end