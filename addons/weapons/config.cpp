#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            "optic_AMS_NVG",
            "optic_KHS_blk_NVG",
            "optic_LRPS_NVG",
            "optic_DMS_NVG",
            "optic_SOS_NVG"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "A3_Weapons_F"
            "A3_Weapons_F_Acc",
            "A3_Weapons_F_Mark_Acc",
            "a4es_common",
            "ace_advanced_ballistics",
            "ace_reload",
            "ace_overheating"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"
