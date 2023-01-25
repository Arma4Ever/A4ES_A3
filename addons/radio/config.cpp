#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "tfar_core",
            "tfw_radios_main",
            "tfw_radios_ilbe",
            "tfw_radios_rf3080"
        };
        author = ECSTRING(main,Author);
        authors[] = {"diwako", "ACRE2Team", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgMovesBasic.hpp"
#include "CfgGesturesMale.hpp"
