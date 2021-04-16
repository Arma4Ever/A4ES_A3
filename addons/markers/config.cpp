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
            "ace_markers",
            "plp_markers"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "Cfg3DEN.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgMarkers.hpp"

class RscDisplayInsertMarker {
    onLoad = QUOTE(_this call DFUNC(initInsertMarkerACE););
    onUnload = QUOTE(_this call DFUNC(placeMarkerACE););
};
