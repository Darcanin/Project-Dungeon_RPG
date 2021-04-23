modifier_str_base = class({})

function modifier_str_base:DeclareFunctions()
    local funcs = {
    }
    return funcs
end

function modifier_str_base:OnCreated(event)
	if IsServer() then
		self:StartIntervalThink(FrameTime())
	end
end

function modifier_str_base:OnIntervalThink(event)
	if IsServer() then
		self:SetStackCount(math.floor(self:GetParent().stats.str[1]))
	end
end

function modifier_str_base:OnDestroy(event)
	if IsServer() then
		self:StartIntervalThink(-1)
	end
end

function modifier_str_base:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_str_base:IsHidden()
    return false
end