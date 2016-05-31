#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"a3cs_dummyVest"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        author = "SzwedzikPL, ACE3 Team";
        authorUrl = "http://arma3coop.pl";
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
