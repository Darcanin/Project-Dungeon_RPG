modifier_int_base = class({})

function modifier_int_base:DeclareFunctions()
    local funcs = {
    }
    return funcs
end

function modifier_int_base:OnCreated(event)
	if IsServer() then
		self:StartIntervalThink(FrameTime())
	end
end

function modifier_int_base:OnIntervalThink(event)
	if IsServer() then
		self:SetStackCount(math.floor(self:GetParent().stats.int[1]))
	end
end

function modifier_int_base:OnDestroy(event)
	if IsServer() then
		self:StartIntervalThink(-1)
	end
end

function modifier_int_base:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_int_base:IsHidden()
    return false
end