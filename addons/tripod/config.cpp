#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_tripod"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_tripod_fnc_pickup = QPATHTOF(functions\fnc_ace_pickup.sqf);
    ace_tripod_fnc_place = QPATHTOF(functions\fnc_ace_place.sqf);
};

#include "CfgEventHandlers.hpp"
