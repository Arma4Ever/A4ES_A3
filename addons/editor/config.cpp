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
            "a3_expEden",
            "3denEnhanced",
            "armaContainersAndDecorations"
        };
        author = ECSTRING(main,Author);
        authors[] = {"3DEN Enhanced Team", "R3vo", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "defines.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"
#include "Cfg3DEN.hpp"
#include "CfgAddons.hpp"
#include "display3DEN.hpp"
#include "display3DENSave.hpp"

// Enable target debug
enableTargetDebug = 1;

delete ENH_3DENCamPositions;
delete ENH_ActionCreator;
delete ENH_BriefingEditor;
delete ENH_Extraction;
delete ENH_ModuleInformation;
delete ENH_ScenarioAttributesManager;
