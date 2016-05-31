#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        authors[] = {"SzwedzikPL"};
        AUTHOR_CONFIG;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
