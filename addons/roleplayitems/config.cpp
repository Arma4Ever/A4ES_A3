#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            "A4ES_RPItems_antibiotics",
            "A4ES_RPItems_gasCanister",
            "A4ES_RPItems_matches",
            "A4ES_RPItems_keys",
            "A4ES_RPItems_phone",
            "A4ES_RPItems_knife",
            "A4ES_RPItems_vodka",
            "A4ES_RPItems_money",
            "A4ES_RPItems_uSB",
            "A4ES_RPItems_milID",
            "A4ES_RPItems_ID",
            "A4ES_RPItems_passport",
            "A4ES_RPItems_drivingLicense",
            "A4ES_RPItems_gunLicense",
            "A4ES_RPItems_cigarettes",
            "A4ES_RPItems_camera",
            "A4ES_RPItems_policeBadge",
            "A4ES_RPItems_pass",
            "A4ES_RPItems_alcoholConcession",
            "A4ES_RPItems_narcotics"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a4es_common",
            "ace_arsenal",
            "A3_structures_f",
            "A3_structures_f_epa",
            "A3_structures_f_heli",
            "A3_missions_f_oldman",
            "A3_props_f_oldman",
            "A3_weapons_f",
            "A3_weapons_f_orange"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL, Krzyciu"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"