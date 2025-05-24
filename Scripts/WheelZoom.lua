local WheelZoom =
{
}

function WheelZoom:OnStart()
end

function WheelZoom:OnUpdate(deltaTime)
    scroll = Inputs.GetMouseScroll()
    if scroll.y ~= 0 then
        transform = self.owner:GetTransform()
        newPosition = transform:GetLocalPosition() + transform:GetLocalForward() * scroll.y
        self.owner:GetTransform():SetLocalPosition(newPosition)
    end
end

return WheelZoom
