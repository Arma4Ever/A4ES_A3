#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "a3_ui_f"};
        author = CSTRING(Author);
        authors[] = {"veteran29", "SzwedzikPL"};
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgMainMenuSpotlight.hpp"
#include "gui.hpp"
