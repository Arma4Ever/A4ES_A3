#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            QGVAR(NVGoggles)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "a3cs_modules",
            "A3_Data_F",
            "A3_3DEN",
            "lambs_wp",
            "lambs_rpg"
        };
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class ctrlStatic;
class ctrlXSliderH;
class ctrlEdit;
class ctrlStructuredText;

#include "CfgEventHandlers.hpp"
#include "CfgSurfaces.hpp"
#include "Cfg3DEN.hpp"
#include "CfgWeapons.hpp"
#include "CfgAmmo.hpp"
#include "CfgAILevelPresets.hpp"
#include "CfgAISkill.hpp"
#include "skillLevels.hpp"
