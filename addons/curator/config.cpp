#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "ace_zeus",
            "zen_modules",
            "A3_Modules_F_Events",
            "A3_Modules_F_Curator_Curator",
            "A3_Modules_F_Curator_Objectives",
            "A3_Modules_F_Curator_Respawn",
            "A3_Modules_F_Curator_Multiplayer",
            "A3_Modules_F_Bootcamp_Misc",
            "A3_Data_F_Curator_Virtual"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "Cfg3DEN.hpp"
