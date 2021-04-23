
-- ABILITY WHIRLWIND SVEN

ability_whirlwind_sven = class({})

function ability_whirlwind_sven:Spawn()
	if IsServer() then
	end
end

function ability_whirlwind_sven:GetBehavior()
	return DOTA_ABILITY_BEHAVIOR_NO_TARGET + DOTA_ABILITY_BEHAVIOR_IMMEDIATE
end

function ability_whirlwind_sven:GetCooldown()
	return 0
end

function ability_whirlwind_sven:GetManaCost()
	return 0
end

function ability_whirlwind_sven:OnUpgrade()
end

function ability_whirlwind_sven:OnSpellStart()
	local caster = self:GetCaster()
	local base_damage = self:GetSpecialValueFor("base_damage")
	local radius = self:GetSpecialValueFor("radius")
	local pos = caster:GetAbsOrigin()
	local origin_angle = caster:GetAngles()
	--local forwardPoint = pos + caster:GetForwardVector() * radius
	--DebugDrawCircle(forwardPoint, Vector(0,255,0), 1, radius, false, 5.0)

	caster:StartGestureWithPlaybackRate(ACT_DOTA_ATTACK, 1.0)

	local vpcf = ParticleManager:CreateParticle("particles/sven_base_attack.vpcf", PATTACH_POINT_FOLLOW, caster)
	ParticleManager:SetParticleControlEnt( vpcf, 0, caster, PATTACH_POINT_FOLLOW, "attach_sword_end", caster:GetOrigin(), true )
	ParticleManager:ReleaseParticleIndex(vpcf)

	--caster:StartRotate()
	local new_angle = RotateOrientation(origin_angle, QAngle(0,180,0))
    caster:SetAngles(new_angle[1],new_angle[2],new_angle[3])

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
	--caster:TestUnit()
end