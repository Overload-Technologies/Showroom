local Scene_Switcher =
{
}

function Scene_Switcher:OnUpdate(deltaTime)
    if Inputs.GetKeyDown(Key.ALPHA_1) then
        Scenes.Load("1_Sponza/Sponza.ovscene")
    end
    
    if Inputs.GetKeyDown(Key.ALPHA_2) then
        Scenes.Load("2_ShadingModels/ShadingModels.ovscene")
    end
    
    if Inputs.GetKeyDown(Key.ALPHA_3) then
        Scenes.Load("3_PBR/PBR.ovscene")
    end
end

return Scene_Switcher
