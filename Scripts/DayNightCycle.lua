local DayNightCycle =
{
    timeOfDay = 0.5, -- 0 to 1, where 0 is midnight and 1 is the next midnight
    dayDurationInSeconds = 20, -- Duration of a full day in seconds
    transform = nil, -- Transform component of the entity
    light = nil,
    dayLengthRatio = 1.0
}

function DayNightCycle:OnStart()
    self.transform = self.owner:GetTransform()
    self.light = self.owner:GetLight()
    self.initialIntensity = self.light:GetIntensity()
end

function DayNightCycle:OnUpdate(deltaTime)
    local sunRisePoint = 0.25
    local sunSetPoint = 0.75
    local noonPoint = 0.5
    local speed = 1.0

    if Inputs.GetKey(Key.W) or Inputs.GetKey(Key.D) or Inputs.GetKey(Key.SPACE) then
        speed = speed * 4.0
    end

    if Inputs.GetKey(Key.S) or Inputs.GetKey(Key.A) or Inputs.GetKey(Key.LEFT_SHIFT) then
        speed = speed * 0.25
    end

    if self.timeOfDay < sunRisePoint or self.timeOfDay > sunSetPoint then
        speed = speed * self.dayDurationInSeconds -- Speed up the night time so that it always last 1 second 
    end

    self.timeOfDay = (self.timeOfDay + (deltaTime * speed) / self.dayDurationInSeconds) % 1
    
    local intensityFactor = 0
    
    if self.timeOfDay >= sunRisePoint and self.timeOfDay <= sunSetPoint then
        if self.timeOfDay <= noonPoint then
            -- Rising from 0 to 1 between sunrise (0.25) and noon (0.5)
            intensityFactor = (self.timeOfDay - sunRisePoint) / (noonPoint - sunRisePoint)
        else
            -- Falling from 1 to 0 between noon (0.5) and sunset (0.75)
            intensityFactor = 1 - ((self.timeOfDay - noonPoint) / (sunSetPoint - noonPoint))
        end
    end

    self.light:SetIntensity(self.initialIntensity * intensityFactor)
    
    -- Calculate the directional light rotation based on the time of day.
    -- At noon (0.5), the light should be at its highest point (looking down).
    local angle = self.timeOfDay * 360 - 90
    self.transform:SetRotation(Quaternion.new(Vector3.new(angle, 0, 25)))
end

return DayNightCycle
