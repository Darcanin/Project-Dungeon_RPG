modifier_int_bonus = class({})

function modifier_int_bonus:DeclareFunctions()
    local funcs = {
    }
    return funcs
end

function modifier_int_bonus:OnCreated(event)
	if IsServer() then
		self:StartIntervalThink(FrameTime())
	end
end

function modifier_int_bonus:OnIntervalThink(event)
	if IsServer() then
		local baseValue = self:GetParent().stats.int[1]
		local bonusValue = self:GetParent().stats.int[2]
		local bonusPercent = self:GetParent().stats.int[3]
		local value = baseValue * bonusPercent * 0.01 + bonusValue 
		self:SetStackCount(math.floor(value))
	end
end

function modifier_int_bonus:OnDestroy(event)
	if IsServer() then
		self:StartIntervalThink(-1)
	end
end

function modifier_int_bonus:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_int_bonus:IsHidden()
    return false
end