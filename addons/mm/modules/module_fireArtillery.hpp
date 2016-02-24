class GVAR(module_fireArtillery): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_FireArtillery_DisplayName);
    category = "a3cs_modules_support";
    function = QUOTE(DFUNC(module_fireArtillery));

    class Attributes: AttributesBase {
        class place: Edit {
            displayName = CSTRING(Module_FireArtillery_Place_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_Place_Description);
            property = QGVAR(module_fireArtillery_place);
            defaultValue = "''";
        };
        class ammo: Combo {
            displayName = CSTRING(Module_FireArtillery_Ammo_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_Ammo_Description);
            property = QGVAR(module_fireArtillery_ammo);
            defaultValue = "'Sh_82mm_AMOS'";
            class values {
                class mortar {name = CSTRING(Module_FireArtillery_Ammo_Mortar_DisplayName); value = "Sh_82mm_AMOS"; default = 1;};
                class artillery {name = CSTRING(Module_FireArtillery_Ammo_Artillery_DisplayName); value = "ModuleOrdnanceHowitzer_F_Ammo"; default = 0;};
                //class smoke {name = CSTRING(Module_FireArtillery_Ammo_Smoke_DisplayName); value = "Smoke_120mm_AMOS_White"; default = 0;}; --fix particle
                class rocket {name = CSTRING(Module_FireArtillery_Ammo_Rocket_DisplayName); value = "Missile_AGM_01_F"; default = 0;};
                class rocketcluster {name = CSTRING(Module_FireArtillery_Ammo_RocketCluster_DisplayName); value = "ModuleOrdnanceRocket_F_Ammo"; default = 0;};
            };
        };
        class timeCondition: Edit {
            displayName = CSTRING(Module_FireArtillery_TimeCondition_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_TimeCondition_Description);
            property = QGVAR(module_fireArtillery_timeCondition);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class countCondition: Edit {
            displayName = CSTRING(Module_FireArtillery_CountCondition_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_CountCondition_Description);
            property = QGVAR(module_fireArtillery_countCondition);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class codeCondition: EditMulti3 {
            displayName = CSTRING(Module_FireArtillery_CodeCondition_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_CodeCondition_Description);
            property = QGVAR(module_fireArtillery_codeCondition);
            validate = "condition";
            defaultValue = "'true'";
        };
        class minDelay: Edit {
            displayName = CSTRING(Module_FireArtillery_MinDelay_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_MinDelay_Description);
            property = QGVAR(module_fireArtillery_minDelay);
            typeName = "NUMBER";
            defaultValue = 0.5;
        };
        class maxDelay: Edit {
            displayName = CSTRING(Module_FireArtillery_MaxDelay_DisplayName);
            tooltip = CSTRING(Module_FireArtillery_MaxDelay_Description);
            property = QGVAR(module_fireArtillery_maxDelay);
            typeName = "NUMBER";
            defaultValue = 2;
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_FireArtillery_Description);
    };
};
