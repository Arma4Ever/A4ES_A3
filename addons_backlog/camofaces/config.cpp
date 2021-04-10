#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "jgkp_camofaces",
            "JgKp_Camofaces",
            "camofaces_items"
        };
        author = ECSTRING(main,Author);
        authors[] = {"[3. Jägerkompanie] Feldhobel, Sk3y, James", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgFunctions.hpp"

delete CamofacesDialog;
