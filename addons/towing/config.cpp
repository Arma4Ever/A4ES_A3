#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_towing"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

/*
TODO: FIX

class a4es_functions_overrides {
    ace_towing_fnc_detach = QPATHTOF(functions\fnc_ace_detach.sqf);
    ace_towing_fnc_startTow = QPATHTOF(functions\fnc_ace_startTow.sqf);
};

#include "CfgEventHandlers.hpp"
*/
