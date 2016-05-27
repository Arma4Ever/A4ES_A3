class GVAR(module_playSound): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_PlaySound_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_playSound));
    disposable = 0;

    class Attributes: AttributesBase {
        class sound: Combo {
            displayName = CSTRING(Module_PlaySound_Sound_DisplayName);
            tooltip = CSTRING(Module_PlaySound_Sound_Description);
            property = QGVAR(module_playSound_sound);
            defaultValue = "['own',0]";
            class values {
                class own {name = CSTRING(Module_PlaySound_Sound_Own_DisplayName); value = "['own',0]"; default = 1;};
                class allahuakbar {name = CSTRING(Module_PlaySound_Sound_Allahuakbar_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\allahuakbar.ogg))),7)]); default = 0;};
                class radiochatter {name = CSTRING(Module_PlaySound_Sound_Radiochatter_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\radiochatter.ogg))),578)]); default = 0;};
                class arabmarker1 {name = CSTRING(Module_PlaySound_Sound_Arabmarket1_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\arabmarket_1.wss))),11)]); default = 0;};
                class arabmarker2 {name = CSTRING(Module_PlaySound_Sound_Arabmarket2_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\arabmarket_2.wss))),15)]); default = 0;};
                class arabmarker3 {name = CSTRING(Module_PlaySound_Sound_Arabmarket3_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\arabmarket_3.wss))),29)]); default = 0;};
                class arabmarker4 {name = CSTRING(Module_PlaySound_Sound_Arabmarket4_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\arabmarket_4.wss))),29)]); default = 0;};
                class arabmarker5 {name = CSTRING(Module_PlaySound_Sound_Arabmarket5_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\arabmarket_5.wss))),18)]); default = 0;};
                class muslimpray1 {name = CSTRING(Module_PlaySound_Sound_Muslimpray1_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\muslimpray_1.wss))),12)]); default = 0;};
                class muslimpray2 {name = CSTRING(Module_PlaySound_Sound_Muslimpray2_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\muslimpray_2.wss))),13)]); default = 0;};
                class muslimpray3 {name = CSTRING(Module_PlaySound_Sound_Muslimpray3_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\muslimpray_3.wss))),14)]); default = 0;};
                class muslimpray4 {name = CSTRING(Module_PlaySound_Sound_Muslimpray4_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\muslimpray_4.wss))),25)]); default = 0;};
                class battlefield1 {name = CSTRING(Module_PlaySound_Sound_Battlefield1_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\battlefield_1.ogg))),609)]); default = 0;};
                class battlefield2 {name = CSTRING(Module_PlaySound_Sound_Battlefield2_DisplayName); value = QUOTE([ARR_2(QUOTE(QUOTE(PATHTOF(sounds\battlefield_2.ogg))),854)]); default = 0;};
                class battlefieldexplosions1 {name = CSTRING(Module_PlaySound_Sound_BattlefieldExplosions1_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_explosions1.wss',10]"; default = 0;};
                class battlefieldexplosions2 {name = CSTRING(Module_PlaySound_Sound_BattlefieldExplosions2_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_explosions2.wss',12]"; default = 0;};
                class battlefieldexplosions3 {name = CSTRING(Module_PlaySound_Sound_BattlefieldExplosions3_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_explosions3.wss',11]"; default = 0;};
                class battlefieldexplosions4 {name = CSTRING(Module_PlaySound_Sound_BattlefieldExplosions4_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_explosions4.wss',7]"; default = 0;};
                class battlefieldexplosions5 {name = CSTRING(Module_PlaySound_Sound_BattlefieldExplosions5_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_explosions5.wss',13]"; default = 0;};
                class battlefieldfirefight1 {name = CSTRING(Module_PlaySound_Sound_BattlefieldFirefight1_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_firefight1.wss',8]"; default = 0;};
                class battlefieldfirefight2 {name = CSTRING(Module_PlaySound_Sound_BattlefieldFirefight2_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_firefight2.wss',7]"; default = 0;};
                class battlefieldfirefight3 {name = CSTRING(Module_PlaySound_Sound_BattlefieldFirefight3_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_firefight3.wss',9]"; default = 0;};
                class battlefieldjet1 {name = CSTRING(Module_PlaySound_Sound_BattlefieldJet1_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_jet1.wss',14]"; default = 0;};
                class battlefieldjet2 {name = CSTRING(Module_PlaySound_Sound_BattlefieldJet2_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_jet2.wss',14]"; default = 0;};
                class battlefieldjet3 {name = CSTRING(Module_PlaySound_Sound_BattlefieldJet3_DisplayName); value = "['\a3\sounds_f\environment\ambient\battlefield\battlefield_jet3.wss',27]"; default = 0;};
            };
        };
        class soundPath: Edit {
            displayName = CSTRING(Module_PlaySound_SoundPath_DisplayName);
            tooltip = CSTRING(Module_PlaySound_SoundPath_Description);
            property = QGVAR(module_playSound_soundPath);
            defaultValue = "''";
        };
        class missionPath: CheckboxNumber {
            displayName = CSTRING(Module_PlaySound_MissionPath_DisplayName);
            tooltip = CSTRING(Module_PlaySound_MissionPath_Description);
            property = QGVAR(module_playSound_missionPath);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class soundDuration: Edit {
            displayName = CSTRING(Module_PlaySound_SoundDuration_DisplayName);
            tooltip = CSTRING(Module_PlaySound_SoundDuration_Description);
            property = QGVAR(module_playSound_soundDuration);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class volume: Edit {
            displayName = CSTRING(Module_PlaySound_Volume_DisplayName);
            tooltip = CSTRING(Module_PlaySound_Volume_Description);
            property = QGVAR(module_playSound_volume);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class distance: Edit {
            displayName = CSTRING(Module_PlaySound_Distance_DisplayName);
            tooltip = CSTRING(Module_PlaySound_Distance_Description);
            property = QGVAR(module_playSound_distance);
            typeName = "NUMBER";
            defaultValue = 100;
        };
        class loop: CheckboxNumber {
            displayName = CSTRING(Module_PlaySound_Loop_DisplayName);
            tooltip = CSTRING(Module_PlaySound_Loop_Description);
            property = QGVAR(module_playSound_loop);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class loopCondition: EditMulti3 {
            displayName = CSTRING(Module_PlaySound_LoopCondition_DisplayName);
            tooltip = CSTRING(Module_PlaySound_LoopCondition_Description);
            property = QGVAR(module_playSound_loopCondition);
            validate = "condition";
            defaultValue = "'true'";
        };
        class playDelay: Edit {
            displayName = CSTRING(Module_PlaySound_PlayDelay_DisplayName);
            tooltip = CSTRING(Module_PlaySound_PlayDelay_Description);
            property = QGVAR(module_playSound_playDelay);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_PlaySound_Description);
    };
};
