#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {QGVAR(B), QGVAR(O), QGVAR(I)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        authors[] = {"SzwedzikPL", "ACE3 Team"};
        AUTHOR_CONFIG;
        VERSION_CONFIG;
    };
};

#include "CfgMovesBasic.hpp"
#include "CfgVehicles.hpp"
