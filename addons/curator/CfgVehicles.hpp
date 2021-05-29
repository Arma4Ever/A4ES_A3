class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
        };
        class ModuleDescription {
            class Anything;
            class AnyPlayer;
            class AnyObject;
            class EmptyDetector;
        };
    };
    class ace_zeus_moduleBase: Module_F {};
    class zen_modules_moduleBase: Module_F {};

    class ModuleCurator_F: Module_F {
        class Attributes: AttributesBase {
            class Addons: Combo {
                defaultValue = 3;
                class Values {
                    delete AllActive;
                    delete AllMission;
                    delete None;

                    class All {
                        name = "$STR_A3_CfgVehicles_ModuleCurator_F_Arguments_Addons_values_All";
                        value = 3;
                        default = 1;
                    };
                };
            };
        };
    };

    // #include "modules\addIcon\module.hpp"
    // #include "modules\createTask\module.hpp"
    // #include "modules\setLogicFlagValue\module.hpp"
    // #include "modules\setTaskState\module.hpp"
    // #include "modules\showFPS\module.hpp"
    // #include "modules\spawnGeneratorComposition\module.hpp"
    // #include "modules\toggleDynamicSimulation\module.hpp"

    #include "hide_modules.hpp"
};
