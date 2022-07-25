#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "a3cs_editor",
            "A3_Weapons_F",
            "ace_frag",
            "A3_Modules_F_Curator_Curator",
            "A3_Modules_F_ObjectModifiers",
            "ace_missionmodules",
            "A3_Modules_F_Curator_Animals",
            "A3_Modules_F_Sites",
            "cba_modules",
            "A3_Modules_F_Curator_Multiplayer",
            "A3_Modules_F_Tacops",
            "A3_Modules_F_GroupModifiers",
            "A3_Modules_F_Patrol",
            "A3_Modules_F_Curator_Misc",
            "A3_Modules_F_Intel",
            "A3_Modules_F_Events",
            "A3_Missions_F_Beta",
            "A3_Missions_F_Curator",
            "A3_Modules_F_MP_Mark",
            "ace_fortify",
            "A3_Modules_F_Misc",
            "ace_respawn",
            "A3_Modules_F_Hc",
            "cba_xeh",
            "A3_Modules_F_LiveFeed",
            "ace_common",
            "ace_map_gestures",
            "A3_Modules_F_Marta",
            "A3_Missions_F_Oldman",
            "A3_Modules_F_Curator_Effects",
            "A3_Modules_F_EPB_Misc",
            "A3_Modules_F_Kart",
            "cba_main",
            "A3_Modules_F_Curator_Intel",
            "A3_Missions_F_Gamma",
            "A3_Modules_F_Skirmish",
            "ace_slideshow",
            "A3_Modules_F_Heli_Misc",
            "A3_Missions_F_Heli",
            "A3_Modules_F_Supports",
            "lambs_wp",
            "A3_Modules_F_Tank",
            "ace_vehiclelock",
            "A3_Modules_F_Warlords",
            "A3_Modules_F_Curator_Lightning",
            "A3_Modules_F_Beta_FiringDrills",
            "A3_Modules_F_Kart_TimeTrials",
            "A3_expEden"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};
#include "defines.hpp"
#include "display3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFactionClasses.hpp"
#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"
#include "Cfg3DEN.hpp"
