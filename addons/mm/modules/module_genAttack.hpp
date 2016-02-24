class GVAR(module_genAttack): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenAttack_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_genAttack));

    class Attributes: AttributesBase {
        class place: Edit {
            displayName = CSTRING(Module_GenSoldiers_Place_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Place_Description);
            property = QGVAR(module_genAttack_place);
            validate = "variable";
        };
        class attackTarget: Edit {
            displayName = CSTRING(Module_GenAttack_AttackTarget_DisplayName);
            tooltip = CSTRING(Module_GenAttack_AttackTarget_Description);
            property = QGVAR(module_genAttack_attackTarget);
            defaultValue = "''";
        };
        class timeCondition: Edit {
            displayName = CSTRING(Module_GenAttack_TimeCondition_DisplayName);
            tooltip = CSTRING(Module_GenAttack_TimeCondition_Description);
            property = QGVAR(module_genAttack_timeCondition);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class countCondition: Edit {
            displayName = CSTRING(Module_GenAttack_CountCondition_DisplayName);
            tooltip = CSTRING(Module_GenAttack_CountCondition_Description);
            property = QGVAR(module_genAttack_countCondition);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class codeCondition: EditMulti3 {
            displayName = CSTRING(Module_GenAttack_CodeCondition_DisplayName);
            tooltip = CSTRING(Module_GenAttack_CodeCondition_Description);
            property = QGVAR(module_genAttack_codeCondition);
            validate = "condition";
            defaultValue = "'true'";
        };
        class side: Combo {
            displayName = CSTRING(Module_GenSoldiers_Side_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Side_Description);
            property = QGVAR(module_genAttack_side);
            defaultValue = "'west'";
            class values {
                class blufor {name = CSTRING(Side_Blufor); value = "west"; default = 1;};
                class opfor {name = CSTRING(Side_Opfor); value = "east"; default = 0;};
                class indep {name = CSTRING(Side_Indep); value = "independent"; default = 0;};
                class civ {name = CSTRING(Side_Civilian); value = "civilian"; default = 0;};
            };
        };
        class classes: EditMulti3 {
            displayName = CSTRING(Module_GenSoldiers_Classes_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Classes_Description);
            property = QGVAR(module_genAttack_classes);
            defaultValue = "'[]'";
        };
        class waveCount: Edit {
            displayName = CSTRING(Module_GenAttack_WaveCount_DisplayName);
            tooltip = CSTRING(Module_GenAttack_WaveCount_Description);
            property = QGVAR(module_genAttack_waveCount);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class groupCount: Edit {
            displayName = CSTRING(Module_GenSoldiers_GroupCount_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_GroupCount_Description);
            property = QGVAR(module_genAttack_groupCount);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class training: Combo {
            displayName = CSTRING(Module_GenSoldiers_Training_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Training_Description);
            property = QGVAR(module_genAttack_training);
            defaultValue = "'conscripts'";
            class values {
                class militia {name = CSTRING(Module_GenSoldiers_Training_Militia_DisplayName); value = "militia"; default = 0;};
                class guards {name = CSTRING(Module_GenSoldiers_Training_Guards_DisplayName); value = "guards"; default = 0;};
                class conscripts {name = CSTRING(Module_GenSoldiers_Training_Conscripts_DisplayName); value = "conscripts"; default = 1;};
                class professional {name = CSTRING(Module_GenSoldiers_Training_Professional_DisplayName); value = "professional"; default = 0;};
                class elite {name = CSTRING(Module_GenSoldiers_Training_Elite_DisplayName); value = "elite"; default = 0;};
            };
        };
        class groupVehicle: Edit {
            displayName = CSTRING(Module_GenAttack_GroupVehicle_DisplayName);
            tooltip = CSTRING(Module_GenAttack_GroupVehicle_Description);
            property = QGVAR(module_genAttack_groupVehicle);
            defaultValue = "''";
        };
        class script: EditMulti3 {
            displayName = CSTRING(Module_GenSoldiers_Script_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Script_Description);
            property = QGVAR(module_genAttack_script);
            defaultValue = "''";
        };
        class ignore: EditMulti3 {
            displayName = CSTRING(Module_GenSoldiers_Ignore_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Ignore_Description);
            property = QGVAR(module_genAttack_ignore);
            defaultValue = "'[]'";
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        description = CSTRING(Module_GenAttack_Description);
    };
};
