class GVAR(module_genSoldiers): A3C_Module {
    scope = 2;
    author = ECSTRING(common,A3C);
    displayName = CSTRING(Module_GenSoldiers_DisplayName);
    category = "a3cs_modules_ai";
    function = QUOTE(DFUNC(module_genSoldiers));
    canSetArea = 1;
    class AttributeValues {
        size3[] = {50,50,-1};
    };

    class Attributes: AttributesBase {
        class parentUnit: Edit {
            displayName = CSTRING(Module_GenSoldiers_ParentUnit_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_ParentUnit_Description);
            property = QGVAR(module_genSoldiers_parentUnit);
            validate = "variable";
        };
        class unitCount: Edit {
            displayName = CSTRING(Module_GenSoldiers_UnitCount_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_UnitCount_Description);
            property = QGVAR(module_genSoldiers_unitCount);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class side: Combo {
            displayName = CSTRING(Module_GenSoldiers_Side_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Side_Description);
            property = QGVAR(module_genSoldiers_side);
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
            property = QGVAR(module_genSoldiers_classes);
            defaultValue = "'[]'";
        };
        class groupCount: Edit {
            displayName = CSTRING(Module_GenSoldiers_GroupCount_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_GroupCount_Description);
            property = QGVAR(module_genSoldiers_groupCount);
            typeName = "NUMBER";
            defaultValue = 0;
        };
        class training: Combo {
            displayName = CSTRING(Module_GenSoldiers_Training_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Training_Description);
            property = QGVAR(module_genSoldiers_training);
            defaultValue = "'conscripts'";
            class values {
                class militia {name = CSTRING(Module_GenSoldiers_Training_Militia_DisplayName); value = "militia"; default = 0;};
                class guards {name = CSTRING(Module_GenSoldiers_Training_Guards_DisplayName); value = "guards"; default = 0;};
                class conscripts {name = CSTRING(Module_GenSoldiers_Training_Conscripts_DisplayName); value = "conscripts"; default = 1;};
                class professional {name = CSTRING(Module_GenSoldiers_Training_Professional_DisplayName); value = "professional"; default = 0;};
                class elite {name = CSTRING(Module_GenSoldiers_Training_Elite_DisplayName); value = "elite"; default = 0;};
            };
        };
        class vehicle: Edit {
            displayName = CSTRING(Module_GenSoldiers_Vehicle_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Vehicle_Description);
            property = QGVAR(module_genSoldiers_vehicle);
            defaultValue = "''";
        };
        class behaviour: Combo {
            displayName = CSTRING(Module_GenSoldiers_Behaviour_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Behaviour_Description);
            property = QGVAR(module_genSoldiers_behaviour);
            defaultValue = "'patrol'";
            class values {
                class patrol {name = CSTRING(Module_GenSoldiers_Behaviour_Patrol_DisplayName); value = "patrol"; default = 1;};
                class defend {name = CSTRING(Module_GenSoldiers_Behaviour_Defend_DisplayName); value = "defend"; default = 0;};
                class defendAdvanced {name = CSTRING(Module_GenSoldiers_Behaviour_DefendAdvanced_DisplayName); value = "defendAdvanced"; default = 0;};
                class base {name = CSTRING(Module_GenSoldiers_Behaviour_Base_DisplayName); value = "base"; default = 0;};
            };
        };
        class patrolWaypointCount: Edit {
            displayName = CSTRING(Module_GenSoldiers_PatrolWaypointCount_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_PatrolWaypointCount_Description);
            property = QGVAR(module_genSoldiers_patrolWaypointCount);
            typeName = "NUMBER";
            defaultValue = 4;
        };
        class patrolWaypoints: EditMulti3 {
            displayName = CSTRING(Module_GenSoldiers_PatrolWaypoints_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_PatrolWaypoints_Description);
            property = QGVAR(module_genSoldiers_patrolWaypoints);
            defaultValue = "'[]'";
        };
        class formation: Combo {
            displayName = CSTRING(Module_GenSoldiers_Formation_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Formation_Description);
            property = QGVAR(module_genSoldiers_formation);
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
        class cache: Combo {
            displayName = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_DisplayName);
            tooltip = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_Description);
            property = QGVAR(module_genSoldiers_cache);
            defaultValue = "'noifleader'";
            class values {
                class patrol {name = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_Yes_DisplayName); value = "always"; default = 0;};
                class defend {name = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_NoLeader_DisplayName); value = "noifleader"; default = 1;};
                class base {name = CSTRING(ObjectAttribute_CacheSettings_CacheUnit_No_DisplayName); value = "never"; default = 0;};
            };
        };
        class cacheModule: CheckboxNumber {
            displayName = CSTRING(Module_GenSoldiers_CacheModule_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_CacheModule_Description);
            property = QGVAR(module_genSoldiers_cacheModule);
            typeName = "NUMBER";
            defaultValue = 1;
        };
        class script: EditMulti3 {
            displayName = CSTRING(Module_GenSoldiers_Script_DisplayName);
            tooltip = CSTRING(Module_GenSoldiers_Script_Description);
            property = QGVAR(module_genSoldiers_script);
            defaultValue = "''";
        };
        class ModuleDescription: ModuleDescription {};
    };
    class ModuleDescription: ModuleDescription {
        position = 1;
        description = CSTRING(Module_GenSoldiers_Description);
    };
};
