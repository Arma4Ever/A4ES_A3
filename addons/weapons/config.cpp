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
            "A3_Weapons_F",
            "A3_Weapons_F_Acc",
            "A3_Weapons_F_Mark_Acc",
            "a4es_common",
            "ace_advanced_ballistics",
            "ace_reload",
            "ace_overheating",
            "ace_nightvision"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "Krzyciu", "Cyruz143"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"

class CfgSounds {
    class GVAR(nvg_on) {
        name = "nvg_on";
        sound[] = {QPATHTOF(sounds\nvg_on.ogg), 0.75, 1, 1};
        titles[] = {};
    };

    class GVAR(nvg_off): GVAR(nvg_on) {
        name = "nvg_off";
        sound[] = {QPATHTOF(sounds\nvg_off.ogg), 0.75, 1, 1};
    };
};