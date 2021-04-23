modifier_dash = class({})

function modifier_dash:DeclareFunctions()
    local funcs = {
    	MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
    	MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE
    }
    return funcs
end

function modifier_dash:OnCreated(event)
	if IsServer() then
		self.distance = 0
		self.max_distance = event.distance

		self:StartIntervalThink(FrameTime())
	end
end

function modifier_dash:OnIntervalThink()
	self:HorizontalMotion(self:GetParent(), FrameTime())
end

function modifier_dash:OnDestroy(event)
	if IsServer() then
	end
end

function modifier_dash:IgnoreTenacity() 
	return true 
end

function modifier_dash:IsMotionController() 
	return true 
end
function modifier_dash:GetMotionControllerPriority() 
	return DOTA_MOTION_CONTROLLER_PRIORITY_MEDIUM 
end

function modifier_dash:HorizontalMotion(hUnit, fInterval)
	if IsServer() then
		local step_distance = self.max_distance / 0.1 * FrameTime()
		if self:GetParent():GetAngles().y > 0 then
			self:GetParent():SetAbsOrigin(self:GetParent():GetAbsOrigin() - Vector(1,0,0) * step_distance)
		else
			self:GetParent():SetAbsOrigin(self:GetParent():GetAbsOrigin() + Vector(1,0,0) * step_distance)
		end

		self.distance = self.distance + step_distance

		if self.distance >= self.max_distance then
			self:Destroy()
		end
	end
end

function modifier_dash:GetOverrideAnimation()
	return ACT_DOTA_FLAIL
end

function modifier_dash:GetOverrideAnimationRate()
	return 1.2
end

function modifier_dash:CheckState()
	local state = {
		[MODIFIER_STATE_STUNNED] = true,
	}
	return state
end

function modifier_dash:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_dash:IsHidden()
    return false
end