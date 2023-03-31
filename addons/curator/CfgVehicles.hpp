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

    // Restore ace suppresive fire module - hidden by zen ace compat addon
    class ace_zeus_moduleSuppressiveFire: ace_zeus_moduleBase {
        scopeCurator = 2;
    };

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

    #include "modules\moveHeadlessClients\module.hpp"
    #include "modules\setLogicFlagValue\module.hpp"
    #include "modules\setTaskState\module.hpp"

    // #include "modules\lockWeather\module.hpp"
    // #include "modules\toggleDynamicSimulation\module.hpp"
    // #include "modules\addIcon\module.hpp"
    // #include "modules\showFPS\module.hpp"
    // #include "modules\spawnGeneratorComposition\module.hpp"

    #include "hiddenModules.hpp"
};
