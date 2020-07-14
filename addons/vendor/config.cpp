#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "A3_Weapons_F_Mark_LongRangeRifles_DMR_02",
            "vurtual_seat",
            "vurtual_ship"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class Mode_SemiAuto;

#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
#include "CfgFunctions.hpp"
#include "CfgLights.hpp"
#include "CfgMagazines.hpp"
#include "CfgSoundEffects.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "effects.hpp"
