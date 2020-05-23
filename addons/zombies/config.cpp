#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "Ryanzombies",
            "Ryanzombiesanims",
            "Ryanzombiesfaces",
            "ryanzombiesfunctions"
        };
        author = ECSTRING(main,Author);
        authors[] = {"Ryan", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgGroups.hpp"
#include "CfgFunctions.hpp"
