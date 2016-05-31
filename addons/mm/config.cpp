#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"a3cs_dummyVest"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        authors[] = {"SzwedzikPL", "ACE3 Team"};
        AUTHOR_CONFIG;
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"
#include "Cfg3den.hpp"
#include "CfgFactionClasses.hpp"
#include "ACE_Settings.hpp"
#include "dialogs.hpp"
