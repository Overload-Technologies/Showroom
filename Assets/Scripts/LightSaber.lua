local RED = 0
local BLUE = 1

local LightSaber =
{
    elapsed = 0.0,
    transform = nil,
    side = 0, -- 0 for left, 1 for right
}

function LightSaber:OnStart()
    self.transform = self.owner:GetTransform()
    
    if self.owner:GetTag() == "Blue" then
        self.side = BLUE
    else
        self.side = RED
    end
end

function Cos01(x)
    return (math.cos(x) + 1.0) / 2.0
end

function LightSaber:OnUpdate(deltaTime)
    self.elapsed = self.elapsed + deltaTime

    local angle = math.cos(self.elapsed) * 180

    if self.side == BLUE then
        angle = -angle
    end

    self.transform:SetRotation(Quaternion.new(Vector3.new(angle, angle, angle)))
end

return LightSaber
