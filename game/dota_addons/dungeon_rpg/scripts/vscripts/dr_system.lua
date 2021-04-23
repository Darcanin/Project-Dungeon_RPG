
LinkLuaModifier( "modifier_leap", "modifiers/modifier_leap.lua", LUA_MODIFIER_MOTION_VERTICAL )
LinkLuaModifier( "modifier_dash", "modifiers/modifier_dash.lua", LUA_MODIFIER_MOTION_VERTICAL )

LinkLuaModifier( "modifier_str_base", "modifiers/stats/modifier_str_base.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_str_bonus", "modifiers/stats/modifier_str_bonus.lua", LUA_MODIFIER_MOTION_NONE )

LinkLuaModifier( "modifier_agi_base", "modifiers/stats/modifier_agi_base.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_agi_bonus", "modifiers/stats/modifier_agi_bonus.lua", LUA_MODIFIER_MOTION_NONE )

LinkLuaModifier( "modifier_int_base", "modifiers/stats/modifier_int_base.lua", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_int_bonus", "modifiers/stats/modifier_int_bonus.lua", LUA_MODIFIER_MOTION_NONE )

function CDOTA_BaseNPC_Hero:ApplyCustomStats()

	if not self.stats then
		self.stats = {}
	end

	self.stats.str = {0,0,0}			-- {Base STR Value, Bonus STR Value, Bonus STR Percent}
	self.stats.agi = {0,0,0}			-- {Base AGI Value, Bonus AGI Value, Bonus AGI Percent}
	self.stats.int = {0,0,0}			-- {Base INT Value, Bonus INT Value, Bonus INT Percent}

	self:AddNewModifier(self, nil, "modifier_str_base", {duration=-1})
	self:AddNewModifier(self, nil, "modifier_str_bonus", {duration=-1})

	self:AddNewModifier(self, nil, "modifier_agi_base", {duration=-1})
	self:AddNewModifier(self, nil, "modifier_agi_bonus", {duration=-1})

	self:AddNewModifier(self, nil, "modifier_int_base", {duration=-1})
	self:AddNewModifier(self, nil, "modifier_int_bonus", {duration=-1})
end

------------------------------------------------------------------------------
							-- CUSTOM STRENGTH --
------------------------------------------------------------------------------

function CDOTA_BaseNPC_Hero:GetSTR_Base()
	if not self.stat.str then
		return 0
	end

	return self.stats.str[1]
end

function CDOTA_BaseNPC_Hero:GetSTR_BonusValue()
	if not self.stat.str then
		return 0
	end

	return self.stats.str[2]
end

function CDOTA_BaseNPC_Hero:GetSTR_BonusPercent()
	if not self.stat.str then
		return 0
	end

	return self.stats.str[3]
end

function CDOTA_BaseNPC_Hero:AddSTR_Base(fAmount, fDuration)
	if not self.stats.str then return end

	self.stats.str[1] = self.stats.str[1] + fAmount
	if fDuration and fDuration > 0 then
		self.stats.str[1] = self.stats.str[1] - fAmount
	end
end

function CDOTA_BaseNPC_Hero:AddSTR_BonusValue(fAmount, fDuration)
	if not self.stats.str then return end

	self.stats.str[2] = self.stats.str[2] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.str[2] = self.stats.str[2] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:AddSTR_BonusPercent(fAmount, fDuration)
	if not self.stats.str then return end

	self.stats.str[3] = self.stats.str[3] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.str[3] = self.stats.str[3] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveSTR_Base(fAmount, fDuration)
	if not self.stats.str then return end

	self.stats.str[1] = self.stats.str[1] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.str[1] = self.stats.str[1] + fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveSTR_BonusValue(fAmount, fDuration)
	if not self.stats.str then return end

	self.stats.str[2] = self.stats.str[2] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.str[2] = self.stats.str[2] + fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveSTR_BonusPercent(fAmount, fDuration)
	if not self.stats.str then return end

	self.stats.str[3] = self.stats.str[3] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.str[3] = self.stats.str[3] + fAmount
		end)
	end
end

------------------------------------------------------------------------------
							-- CUSTOM AGILITY --
------------------------------------------------------------------------------

function CDOTA_BaseNPC_Hero:GetAGI_Base()
	if not self.stat.agi then
		return 0
	end

	return self.stats.agi[1]
end

function CDOTA_BaseNPC_Hero:GetAGI_BonusValue()
	if not self.stat.agi then
		return 0
	end

	return self.stats.agi[2]
end

function CDOTA_BaseNPC_Hero:GetAGI_BonusPercent()
	if not self.stat.agi then
		return 0
	end

	return self.stats.agi[3]
end

function CDOTA_BaseNPC_Hero:AddAGI_Base(fAmount, fDuration)
	if not self.stats.agi then return end

	self.stats.agi[1] = self.stats.agi[1] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.agi[1] = self.stats.agi[1] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:AddAGI_BonusValue(fAmount, fDuration)
	if not self.stats.agi then return end

	self.stats.agi[2] = self.stats.agi[2] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.agi[2] = self.stats.agi[2] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:AddAGI_BonusPercent(fAmount, fDuration)
	if not self.stats.agi then return end

	self.stats.agi[3] = self.stats.agi[3] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.agi[3] = self.stats.agi[3] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveAGI_Base(fAmount, fDuration)
	if not self.stats.agi then return end

	self.stats.agi[1] = self.stats.agi[1] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.agi[1] = self.stats.agi[1] + fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveAGI_BonusValue(fAmount, fDuration)
	if not self.stats.agi then return end

	self.stats.agi[2] = self.stats.agi[2] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.agi[2] = self.stats.agi[2] + fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveAGI_BonusPercent(fAmount, fDuration)
	if not self.stats.agi then return end

	self.stats.agi[3] = self.stats.agi[3] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.agi[3] = self.stats.agi[3] + fAmount
		end)
	end
end

------------------------------------------------------------------------------
							-- CUSTOM INTELLECT --
------------------------------------------------------------------------------

function CDOTA_BaseNPC_Hero:GetINT_Base()
	if not self.stat.int then
		return 0
	end

	return self.stats.int[1]
end

function CDOTA_BaseNPC_Hero:GetINT_BonusValue()
	if not self.stat.int then
		return 0
	end

	return self.stats.int[2]
end

function CDOTA_BaseNPC_Hero:GetINT_BonusPercent()
	if not self.stat.int then
		return 0
	end

	return self.stats.int[3]
end

function CDOTA_BaseNPC_Hero:AddINT_Base(fAmount, fDuration)
	if not self.stats.int then return end

	self.stats.int[1] = self.stats.int[1] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.int[1] = self.stats.int[1] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:AddINT_BonusValue(fAmount, fDuration)
	if not self.stats.int then return end

	self.stats.int[2] = self.stats.int[2] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.int[2] = self.stats.int[2] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:AddINT_BonusPercent(fAmount, fDuration)
	if not self.stats.int then return end

	self.stats.int[3] = self.stats.int[3] + fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.int[3] = self.stats.int[3] - fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveINT_Base(fAmount, fDuration)
	if not self.stats.int then return end

	self.stats.int[1] = self.stats.int[1] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.int[1] = self.stats.int[1] + fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveINT_BonusValue(fAmount, fDuration)
	if not self.stats.int then return end

	self.stats.int[2] = self.stats.int[2] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.int[2] = self.stats.int[2] + fAmount
		end)
	end
end

function CDOTA_BaseNPC_Hero:RemoveINT_BonusPercent(fAmount, fDuration)
	if not self.stats.int then return end

	self.stats.int[3] = self.stats.int[3] - fAmount
	if fDuration and fDuration > 0 then
		Timers:CreateTimer(fDuration, function()
			self.stats.int[3] = self.stats.int[3] + fAmount
		end)
	end
end

----------------------------------------------------------------------------
								-- LEAP --
----------------------------------------------------------------------------

function CDOTA_BaseNPC:Leap(fHeight, fDuration, bUseEffect)
	if self:HasModifier("modifier_leap") then
		return
	end

	if bUseEffect then
		local leapParticle = ParticleManager:CreateParticle("particles/custom_leap_particle.vpcf", PATTACH_ABSORIGIN_FOLLOW, self)
		ParticleManager:SetParticleControl(leapParticle, 0, self:GetAbsOrigin())
		ParticleManager:SetParticleControl(leapParticle, 3, self:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(leapParticle)
	end

	self:AddNewModifier(self, nil, "modifier_leap", {height=fHeight, duration=fDuration})
end

----------------------------------------------------------------------------
								-- DASH --
----------------------------------------------------------------------------

function CDOTA_BaseNPC:Dash(fDistance, bUseEffect)
	if self:HasModifier("modifier_dash") then
		return
	end

	if bUseEffect then
		local leapParticle = ParticleManager:CreateParticle("particles/custom_leap_particle.vpcf", PATTACH_ABSORIGIN_FOLLOW, self)
		ParticleManager:SetParticleControl(leapParticle, 0, self:GetAbsOrigin())
		ParticleManager:SetParticleControl(leapParticle, 3, self:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(leapParticle)
	end

	self:AddNewModifier(self, nil, "modifier_dash", {distance=fDistance})
end

-- Get enemy units in AOE
function GetEnemiesAround(npc, aoe, point)
    local units = FindUnitsInRadius(npc:GetTeamNumber(), 
            point or npc:GetAbsOrigin(), 
            nil, 
            aoe, 
            DOTA_UNIT_TARGET_TEAM_ENEMY, 
            DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 
            DOTA_UNIT_TARGET_FLAG_NONE, 
            FIND_ANY_ORDER, 
            false)
    return units
end

-- Get friend units in AOE
function GetFriendsAround(npc, aoe, point)
    local units = FindUnitsInRadius(npc:GetTeamNumber(), 
            point or npc:GetAbsOrigin(), 
            nil, 
            aoe, 
            DOTA_UNIT_TARGET_TEAM_FRIENDLY, 
            DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 
            DOTA_UNIT_TARGET_FLAG_NONE, 
            FIND_ANY_ORDER, 
            false)
    return units
end

-- Get random enemy in AOE
function GetRandomEnemy(npc, aoe, point)
    local units = FindUnitsInRadius(npc:GetTeamNumber(), 
            point or npc:GetAbsOrigin(), 
            nil, 
            aoe, 
            DOTA_UNIT_TARGET_TEAM_ENEMY, 
            DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 
            DOTA_UNIT_TARGET_FLAG_NONE, 
            FIND_ANY_ORDER, 
            false)
    local randomUnit = units[RandomInt(1,#units)]
    return randomUnit
end

-- Get random friend in AOE
function GetRandomFriend(npc, aoe, point)
    local units = FindUnitsInRadius(npc:GetTeamNumber(), 
            point or npc:GetAbsOrigin(), 
            nil, 
            aoe, 
            DOTA_UNIT_TARGET_TEAM_FRIENDLY, 
            DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_HERO, 
            DOTA_UNIT_TARGET_FLAG_NONE, 
            FIND_ANY_ORDER, 
            false)
    local randomUnit = units[RandomInt(1,#units)]
    return randomUnit
end

-- Deal physical damage function
function Damage_Physical(attacker, target, damageAmount, ability)
    local damageTable = {}
    damageTable.damage = damageAmount
    damageTable.damage_type = DAMAGE_TYPE_PHYSICAL
    damageTable.victim = target
    damageTable.attacker = attacker
    damageTable.ability = ability or nil
    ApplyDamage(damageTable)
end

-- Deal magic damage function
function Damage_Magic(attacker, target, damageAmount, ability)
    local damageTable = {}
    damageTable.damage = damageAmount
    damageTable.damage_type = DAMAGE_TYPE_MAGICAL
    damageTable.victim = target
    damageTable.attacker = attacker
    damageTable.ability = ability or nil
    ApplyDamage(damageTable)
end

function CDOTA_BaseNPC:TestUnit(enemy)
	local center_pos = self:GetCenter()
	local abs_origin = self:GetAbsOrigin()
	local eye_pos = self:EyePosition()
	local scale = self:GetAbsScale()
	local bound_min = self:GetBoundingMins()
	local bound_max = self:GetBoundingMaxs()
	local t = {}
	table.insert(t,center_pos)
	table.insert(t,abs_origin)
	table.insert(t,eye_pos)
	table.insert(t,scale)
	table.insert(t,bound_min)
	table.insert(t,bound_max)
	PrintTable(t)

	local center_point = center_pos
	local abs_point = abs_origin
	local point = Vector(center_point.x,center_point.y,center_point.z + bound_max.z)

	DebugDrawCircle(center_point, Vector(255,0,0), 10, 100, false, 5.0)
	DebugDrawCircle(abs_point, Vector(0,0,255), 10, 100, false, 5.0)
	DebugDrawCircle(point, Vector(0,255,0), 10, 100, false, 5.0)
end

function CDOTA_BaseNPC:CanDamageEnemy_Melee(hEnemy)
    local attackerHeight = self:GetAbsOrigin().z
    local enemyHeight = hEnemy:GetAbsOrigin().z

    local attackerModelScale = self:GetAbsScale()
    local enemyModelScale = hEnemy:GetAbsScale()

    local attackerModelHeight = self:GetBoundingMaxs().z * attackerModelScale * 2
    local enemyModelHeight = hEnemy:GetBoundingMaxs().z * enemyModelScale * 2

    local attackerCenterHeight = self:GetCenter().z
    local enemyCenterHeight = hEnemy:GetCenter().z

    local height_distance = enemyHeight - attackerHeight

    if height_distance < 0 then
    	if attackerCenterHeight - attackerModelHeight <= enemyCenterHeight + enemyModelHeight then
    		--print("HERO HEIGHT < ENEMY HEIGHT")
    		--print(attackerCenterHeight - attackerModelHeight)
    		--print(enemyCenterHeight + enemyModelHeight)
    		return true
    	end
    else
    	if attackerCenterHeight + attackerModelHeight >= enemyCenterHeight - enemyModelHeight then
    		--print("HERO HEIGHT > ENEMY HEIGHT")
    		--print(attackerCenterHeight + attackerModelHeight)
    		--print(enemyCenterHeight - enemyModelHeight)
    		return true
    	end	
    end

    return false
end

-- Force Rotate
function CDOTA_BaseNPC:StartRotate()
    self.rotate = true
    self:Rotate()
end

function CDOTA_BaseNPC:StopRotate()
    self.rotate = nil
end

function CDOTA_BaseNPC:Rotate(fDuration)
    local interval = FrameTime()
    local angle = self:GetAngles()
    Timers:CreateTimer(function()
        local new_angle = RotateOrientation(angle, QAngle(0,40,0))
        self:SetAngles(new_angle[1],new_angle[2],new_angle[3])
        angle = new_angle
        if fDuration and fDuration > 0 then
            fDuration = fDuration - interval
            if fDuration <= 0 then
            return nil
        end
    end

    if not self.rotate then
        return nil
    end

    return interval
    end)
end