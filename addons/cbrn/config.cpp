#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "A3_Characters_F",
            "A3_Characters_F_Exp",
            "A3_Characters_F_Enoch",
            "A3_Characters_F_Orange_Facewear",
            "A3_Characters_F_Enoch_Facewear",
            "A3_Characters_F_Enoch_Headgear",
            "A3_Characters_F_Exp_Headgear",
            "JSHK_contam_gear_suits",
            "JSHK_contam_gear_masks",
            "fm12_respirator"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgGlasses.hpp"
