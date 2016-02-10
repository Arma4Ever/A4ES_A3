class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
        };
    };
    class ACE_Module;
    //#include "hidden_modules.hpp"

    class A3C_Module: Module_F {
        scope = 0;
        scopeCurator = 0;
        functionPriority = 10; // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
        isGlobal = 0; // 0 for server only execution
        isTriggerActivated = 1; // 1 for module waiting until all synced triggers are activated
        isDisposable = 0; //BUGGED
        disposable = 1;
        is3DEN = 1; // // 1 to run init function in Eden Editor as well
        class AttributesBase: AttributesBase {
            class Default: Default {};
            class EditMulti3: Default {
                control = "EditMulti3";
            };
            class EditMulti5: Default {
                control = "EditMulti5";
            };
        };
        class ModuleDescription {};
    };

    //----- AI
    class GVAR(module_cacheSettings): A3C_Module {
        scope = 2;
        author = ECSTRING(common,A3C);
        displayName = CSTRING(Module_CacheSettings_DisplayName);
        category = "a3cs_modules_ai";
        function = QUOTE(DFUNC(module_cacheSettings));

        class Attributes: AttributesBase {
            class enable: CheckboxNumber {
                displayName = CSTRING(Module_CacheSettings_Enable_DisplayName);
                tooltip = CSTRING(Module_CacheSettings_Enable_Description);
                property = QGVAR(module_cacheSettings_enable);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class distanceLand: Edit {
                displayName = CSTRING(Module_CacheSettings_DistanceLand_DisplayName);
                tooltip = CSTRING(Module_CacheSettings_DistanceLand_Description);
                property = QGVAR(module_cacheSettings_distanceLand);
                typeName = "NUMBER";
                defaultValue = 2000;
            };
            class distanceHelicopter: Edit {
                displayName = CSTRING(Module_CacheSettings_DistanceHelicopter_DisplayName);
                tooltip = CSTRING(Module_CacheSettings_DistanceHelicopter_Description);
                property = QGVAR(module_cacheSettings_distanceHelicopter);
                typeName = "NUMBER";
                defaultValue = 3000;
            };
            class distancePlane: Edit {
                displayName = CSTRING(Module_CacheSettings_DistancePlane_DisplayName);
                tooltip = CSTRING(Module_CacheSettings_DistancePlane_Description);
                property = QGVAR(module_cacheSettings_distancePlane);
                typeName = "NUMBER";
                defaultValue = 0;
            };
            class ModuleDescription: ModuleDescription {};
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(Module_CacheSettings_Description);
        };
    };
    class GVAR(module_genSoldiers): A3C_Module {
        scope = 2;
        author = ECSTRING(common,A3C);
        displayName = CSTRING(Module_GenSoldiers_DisplayName);
        category = "a3cs_modules_ai";
        function = QUOTE(DFUNC(module_genSoldiers));

        class Attributes: AttributesBase {
            class place: Edit {
                displayName = CSTRING(Module_GenSoldiers_Place_DisplayName);
                tooltip = CSTRING(Module_GenSoldiers_Place_Description);
                property = QGVAR(module_genSoldiers_place);
                validate = "variable";
            };
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
                defaultValue = 1;
                class values {
                    class blufor {name = CSTRING(Side_Blufor); value = "west"; default = 1;};
                    class opfor {name = CSTRING(Side_Opfor); value = "east"; default = 0;};
                    class indep {name = CSTRING(Side_Indep); value = "independent"; default = 0;};
                    class civ {name = CSTRING(Side_Civilian); value = "civilian"; default = 0;};
                };
            };
            class classes: EditMulti5 {
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
                defaultValue = 3;
                class values {
                    class militia {name = CSTRING(Module_GenSoldiers_Training_Militia_DisplayName); value = "militia"; default = 0;};
                    class guards {name = CSTRING(Module_GenSoldiers_Training_Guards_DisplayName); value = "guards"; default = 0;};
                    class conscripts {name = CSTRING(Module_GenSoldiers_Training_Conscripts_DisplayName); value = "conscripts"; default = 1;};
                    class professional {name = CSTRING(Module_GenSoldiers_Training_Professional_DisplayName); value = "professional"; default = 0;};
                    class elite {name = CSTRING(Module_GenSoldiers_Training_Elite_DisplayName); value = "elite"; default = 0;};
                };
            };
            class behaviour: Combo {
                displayName = CSTRING(Module_GenSoldiers_Behaviour_DisplayName);
                tooltip = CSTRING(Module_GenSoldiers_Behaviour_Description);
                property = QGVAR(module_genSoldiers_behaviour);
                defaultValue = 1;
                class values {
                    class patrol {name = CSTRING(Module_GenSoldiers_Behaviour_Patrol_DisplayName); value = "patrol"; default = 1;};
                    class defend {name = CSTRING(Module_GenSoldiers_Behaviour_Defend_DisplayName); value = "defend"; default = 0;};
                    class base {name = CSTRING(Module_GenSoldiers_Behaviour_Base_DisplayName); value = "base"; default = 0;};
                };
            };
            class script: EditMulti3 {
                displayName = CSTRING(Module_GenSoldiers_Script_DisplayName);
                tooltip = CSTRING(Module_GenSoldiers_Script_Description);
                property = QGVAR(module_genSoldiers_script);
                defaultValue = "''";
            };
            class ignore: EditMulti3 {
                displayName = CSTRING(Module_GenSoldiers_Ignore_DisplayName);
                tooltip = CSTRING(Module_GenSoldiers_Ignore_Description);
                property = QGVAR(module_genSoldiers_ignore);
                defaultValue = "'[]'";
            };
            class ModuleDescription: ModuleDescription {};
        };
        class ModuleDescription: ModuleDescription {
            description = CSTRING(Module_GenSoldiers_Description);
        };
    };

    /*
    class Module_F;
    class A3C_Module: Module_F {
        class ModuleDescription;
    };
    class GVAR(module_cacheSettings): A3C_Module {
        scope = 2;
        author = "Arma3Coop.pl";
        displayName = "Ustawienia cache";
        category = "a3cs_modules_settings";
        function = QUOTE(DFUNC(module_cacheSettings));
        isTriggerActivated = 0;

        class Arguments {
            class enabled {
                displayName = "$STR_A3CS_Cache_module_cacheSettings_enabled_displayName";
                description = "$STR_A3CS_Cache_module_cacheSettings_enabled_description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class distance {
                displayName = "$STR_A3CS_Cache_module_cacheSettings_distance_displayName";
                description = "$STR_A3CS_Cache_module_cacheSettings_distance_description";
                typeName = "NUMBER";
                defaultValue = 2000;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "";
            sync[] = {};
        };
    };
    */




/*
    #include "modules\module_fireArtillery.hpp"
    +#include "modules\module_genSoldiers.hpp"
    #include "modules\module_genAttack.hpp"
    #include "modules\module_genMinefield.hpp"
    #include "modules\module_genCrapfield.hpp"
    #include "modules\module_switchLights.hpp"
    #include "modules\module_deadzone.hpp"
    #include "modules\module_addDialogQuery.hpp"
    #include "modules\module_createDialog.hpp"
    #include "modules\module_setTask.hpp"
    #include "modules\module_setTaskState.hpp"
    #include "modules\module_genCas.hpp"
    #include "modules\module_genHeliSupportdrop.hpp"
    #include "modules\module_genParadrop.hpp"
    #include "modules\module_genSupplydrop.hpp"
    #include "modules\module_breathFog.hpp"
    #include "modules\module_colorCorrections.hpp"
    #include "modules\module_fogEffect.hpp"
    #include "modules\module_forceGunLights.hpp"
    #include "modules\module_snowEffect.hpp"
    #include "modules\module_sandStorm.hpp"
    #include "modules\module_soundEffect.hpp"
    #include "modules\module_playSound.hpp"
    #include "modules\module_getInVehicle.hpp"
    #include "modules\module_assignMedic.hpp"
    #include "modules\module_assignEngineer.hpp"
    #include "modules\module_assignEod.hpp"
    #include "modules\module_assignMedicalVehicle.hpp"
    #include "modules\module_assignMedicalFacility.hpp"
    #include "modules\module_assignRepairFacility.hpp"
    #include "modules\module_assignRepairVehicle.hpp"
    #include "modules\module_surrenderUnit.hpp"
    #include "modules\module_handcuffUnit.hpp"
*/
};
