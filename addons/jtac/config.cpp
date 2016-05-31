#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        authors[] = {"SzwedzikPL", "ACE3 Team"};
        AUTHOR_CONFIG;
        VERSION_CONFIG;
    };
};
class a3cs_jtac_settings {
    class support_providers {

    };
    class support_types {
        class air_gunrun {
            displayName = "Ostrzał bezpośredni";
            guidance = "laser";
        };
        class air_precision_bomb {
            displayName = "Bomba kierowana";
            guidance = "laser";
        };
        class cruise_missile {
            displayName = "Pocisk manewrujący";
            guidance = "laser";
        };
        class mortar_barrage {
            displayName = "Ostrzał obszarowy";
        };
        class artillery_barrage {
            displayName = "Ostrzał obszarowy";
        };
        class smoke_artillery_barrage {
            displayName = "Ostrzał obszarowy (dymny)";
        };
        class 120mm_missiles_barrage {

        };
    };
};
