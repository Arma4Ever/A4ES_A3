#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Map_Stratis", "A3_Map_Altis"};
        authors[] = {"SzwedzikPL"};
        AUTHOR_CONFIG;
        VERSION_CONFIG;
    };
};

#include "CfgWorlds.hpp"
