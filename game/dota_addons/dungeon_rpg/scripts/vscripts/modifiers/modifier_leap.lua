modifier_leap = class({})

function modifier_leap:DeclareFunctions()
    local funcs = {
    	MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
    	MODIFIER_PROPERTY_OVERRIDE_ANIMATION_RATE
    }
    return funcs
end

function modifier_leap:OnCreated(event)
	if IsServer() then
		self.time = 0
		self.height = 0
		self.leap_duration = event.duration
		self.max_height = event.height
		self.original_z = self:GetParent():GetAbsOrigin().z

		self:StartIntervalThink(FrameTime())
	end
end

function modifier_leap:OnIntervalThink()
	self:VerticalMotion(self:GetParent(), FrameTime())
end

function modifier_leap:OnDestroy(event)
	if IsServer() then
		self:GetParent():SetAbsOrigin(GetGroundPosition(self:GetParent():GetAbsOrigin(), self:GetParent()))
	end
end

function modifier_leap:IgnoreTenacity() 
	return true 
end

function modifier_leap:IsMotionController() 
	return true 
end
function modifier_leap:GetMotionControllerPriority() 
	return DOTA_MOTION_CONTROLLER_PRIORITY_MEDIUM 
end

function modifier_leap:VerticalMotion(hUnit, fInterval)
	if IsServer() then
		-- Calculate height as a parabula
		local t = self.time / self.leap_duration
		self.height = self.height + FrameTime() * self.max_height * (4-8*t)

		-- Set the new height
		self:GetParent():SetAbsOrigin(GetGroundPosition(self:GetParent():GetAbsOrigin(), self:GetParent()) + Vector(0,0,self.height))

		-- Increase the time elapsed
		self.time = self.time + fInterval
	end
end

function modifier_leap:GetOverrideAnimation()
	return ACT_DOTA_FLAIL
end

function modifier_leap:GetOverrideAnimationRate()
	return 1.2
end

function modifier_leap:CheckState()
	local state = {
	}
	return state
end

function modifier_leap:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT + MODIFIER_ATTRIBUTE_IGNORE_INVULNERABLE
end

function modifier_leap:IsHidden()
    return false
end