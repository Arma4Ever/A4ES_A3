#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "A3_Ui_F",
            "A3_Ui_F_Orange",
            "A3_Missions_F_Oldman",
            "a3_expEden",
            "ace_map",
            "plp_markers"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMarkers.hpp"
