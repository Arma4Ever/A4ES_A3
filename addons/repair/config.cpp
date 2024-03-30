#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_repair"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

/*

TODO: FIX

class a4es_functions_overrides {
    ace_repair_fnc_repair_success = QPATHTOF(functions\fnc_ace_repair_success.sqf);
};

#include "CfgEventHandlers.hpp"

*/
