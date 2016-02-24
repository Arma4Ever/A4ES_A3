class GVAR(module_playSound): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_PlaySound_DisplayName);
    category = "a3cs_modules_effects";
    function = QUOTE(DFUNC(module_playSound));

    class Attributes: AttributesBase {
        class place: Edit {
            displayName = CSTRING(Module_PlaySound_Place_DisplayName);
            tooltip = CSTRING(Module_PlaySound_Place_Description);
            property = QGVAR(module_playSound_place);
            defaultValue = "''";
        };
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
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_PlaySound_Description);
    };
};
