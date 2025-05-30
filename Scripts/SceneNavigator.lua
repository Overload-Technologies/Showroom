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

    if Inputs.GetKeyDown(Key.ALPHA_4) then
        Scenes.Load("4_Materials/Materials.ovscene")
    end

    if Inputs.GetKeyDown(Key.ALPHA_5) then
        Scenes.Load("5_Reflections/Reflections.ovscene")
    end

    if Inputs.GetKeyDown(Key.ALPHA_6) then
        Scenes.Load("6_TimeOfDay/TimeOfDay.ovscene")
    end

    if Inputs.GetKeyDown(Key.ALPHA_7) then
        Scenes.Load("7_Emissive/Emissive.ovscene")
    end
end

return Scene_Switcher
