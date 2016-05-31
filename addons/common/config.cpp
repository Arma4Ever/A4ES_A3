#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main"};
        authors[] = {"SzwedzikPL", "ACE3 Team"};
        AUTHOR_CONFIG;
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
