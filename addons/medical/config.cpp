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

#include "CfgEventHandlers.hpp"
#include "ACE_Medical_Treatments.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
