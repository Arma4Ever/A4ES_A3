#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "a4es_squads",
            "a4es_nametags",
            "A3_3DEN"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class ctrlCombo;

class a4es_functions_overrides {
    ace_interaction_fnc_joinTeam = QPATHTOF(functions\fnc_ace_joinTeam.sqf);
};

#include "CfgEventHandlers.hpp"
#include "RscTitles.hpp"
#include "Cfg3DEN.hpp"
#include "iconClasses.hpp"
