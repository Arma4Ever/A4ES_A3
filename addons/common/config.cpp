#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_main", "cba_xeh", "A3_Data_F", "ace_common"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_common_fnc_setVolume = QPATHTOF(functions\fnc_ace_setVolume.sqf);
    ace_common_fnc_setHearingCapability = QPATHTOF(functions\fnc_ace_setHearingCapability.sqf);
};

#include "CfgEventHandlers.hpp"
#include "CfgDifficultyPresets.hpp"
#include "CfgFunctions.hpp"