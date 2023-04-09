#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_fortify"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_fortify_fnc_canFortify = QPATHTOF(functions\fnc_ace_canFortify.sqf);
    ace_fortify_fnc_updateBudget = QPATHTOF(functions\fnc_ace_updateBudget.sqf);
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"