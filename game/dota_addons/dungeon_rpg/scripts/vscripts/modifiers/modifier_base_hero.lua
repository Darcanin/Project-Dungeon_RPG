modifier_base_hero = class({})

function modifier_base_hero:DeclareFunctions()
    local funcs = {
    	MODIFIER_PROPERTY_TURN_RATE_OVERRIDE
    }
    return funcs
end

function modifier_base_hero:OnCreated(event)
	if IsServer() then
	end
end

function modifier_base_hero:GetModifierTurnRateOverride()
	return 999999
end

function modifier_base_hero:OnDestroy(event)
	if IsServer() then
	end
end

function modifier_base_hero:IgnoreTenacity() 
	return true 
end

function modifier_base_hero:CheckState()
	local state = {
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR]  = true,
	}
	return state
end

function modifier_base_hero:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_base_hero:IsHidden()
    return false
end