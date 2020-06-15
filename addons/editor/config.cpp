#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "a3cs_common",
            "ace_arsenal",
            "Eden_Extended_Objects",
            "A3_3DEN",
            "A3_Data_F_Sams_Loadorder",
            "a3_expEden"
        };
        author = ECSTRING(main,Author);
        authors[] = {"3DEN Enhanced Team", "R3vo", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

// Enable target debug
enableTargetDebug = 1;

#include "defines.hpp"

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "CfgVehicles.hpp"
#include "Cfg3DEN.hpp"
#include "CfgAddons.hpp"
#include "display3DEN.hpp"
#include "display3DENSave.hpp"

// 3DEN Enhanced
#include "ENH\gui\nameObjects.hpp"
#include "ENH\gui\textureFinder.hpp"
#include "ENH\gui\batchReplace.hpp"
#include "ENH\gui\functionsViewer.hpp"
#include "ENH\gui\placementTools.hpp"
#include "ENH\gui\garrison.hpp"
