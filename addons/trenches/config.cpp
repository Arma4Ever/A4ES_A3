#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_trenches", "grad_trenches_functions"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_trenches_fnc_removeTrench = QPATHTOF(functions\fnc_ace_removeTrench.sqf);
    grad_trenches_functions_fnc_trenchesEntireVehicleSuccess = QPATHTOF(functions\fnc_grad_removeTrench.sqf);
};

#include "CfgEventHandlers.hpp"
