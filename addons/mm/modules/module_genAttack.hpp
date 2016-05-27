class GVAR(module_genAttack): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenAttack_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_genAttack));
    canSetArea = 1;
    class AttributeValues {
        size3[] = {50,50,-1};
    };

    class Attributes: AttributesBase {
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
        class formation: Combo {
            displayName = CSTRING(Module_GenSoldiers_Formation_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Formation_Description);
            property = QGVAR(module_genAttack_formation);
            defaultValue = "'COLUMN'";
            class values {
                class column {name = CSTRING(Module_GenSoldiers_Formation_Column_DisplayName); value = "COLUMN"; default = 1;};
                class stagColumn {name = CSTRING(Module_GenSoldiers_Formation_StagColumn_DisplayName); value = "STAG COLUMN"; default = 0;};
                class wedge {name = CSTRING(Module_GenSoldiers_Formation_Wedge_DisplayName); value = "WEDGE"; default = 0;};
                class echLeft {name = CSTRING(Module_GenSoldiers_Formation_EchLeft_DisplayName); value = "ECH LEFT"; default = 0;};
                class echRight {name = CSTRING(Module_GenSoldiers_Formation_EchRight_DisplayName); value = "ECH RIGHT"; default = 0;};
                class vee {name = CSTRING(Module_GenSoldiers_Formation_Vee_DisplayName); value = "VEE"; default = 0;};
                class line {name = CSTRING(Module_GenSoldiers_Formation_Line_DisplayName); value = "LINE"; default = 0;};
                class file {name = CSTRING(Module_GenSoldiers_Formation_File_DisplayName); value = "FILE"; default = 0;};
                class diamond {name = CSTRING(Module_GenSoldiers_Formation_Diamond_DisplayName); value = "DIAMOND"; default = 0;};
            };
        };
        class vehicle: Edit {
            displayName = CSTRING(Module_GenAttack_Vehicle_DisplayName);
            tooltip = CSTRING(Module_GenAttack_Vehicle_Description);
            property = QGVAR(module_genAttack_vehicle);
            defaultValue = "''";
        };
        class script: EditMulti3 {
            displayName = CSTRING(Module_GenSoldiers_Script_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Script_Description);
            property = QGVAR(module_genAttack_script);
            defaultValue = "''";
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenAttack_Description);
    };
};
