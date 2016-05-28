#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main"};
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgRespawnTemplates.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgDebriefing.hpp"
#include "CfgFunctions.hpp"
#include "CfgDifficultyPresets.hpp"
#include "CfgAILevelPresets.hpp"
#include "CfgAmmo.hpp"
#include "dialogs.hpp"
