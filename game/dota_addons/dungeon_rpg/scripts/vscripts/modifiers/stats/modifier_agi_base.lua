modifier_agi_base = class({})

function modifier_agi_base:DeclareFunctions()
    local funcs = {
    }
    return funcs
end

function modifier_agi_base:OnCreated(event)
	if IsServer() then
		self:StartIntervalThink(FrameTime())
	end
end

function modifier_agi_base:OnIntervalThink(event)
	if IsServer() then
		self:SetStackCount(math.floor(self:GetParent().stats.agi[1]))
	end
end

function modifier_agi_base:OnDestroy(event)
	if IsServer() then
		self:StartIntervalThink(-1)
	end
end

function modifier_agi_base:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_agi_base:IsHidden()
    return false
end