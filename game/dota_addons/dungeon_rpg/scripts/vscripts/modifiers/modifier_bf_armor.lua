modifier_bf_armor = class({})

function modifier_bf_armor:DeclareFunctions()
    local funcs = {
    }
    return funcs
end

function modifier_bf_armor:OnCreated(event)
	local owner = self:GetParent()
end

function modifier_bf_armor:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_bf_armor:IsHidden()
    return true
end