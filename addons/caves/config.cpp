#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[]={};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "rspncave"};
        author = ECSTRING(main,Author);
        authors[] = {"Liv2Die", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgEditorSubcategories.hpp"
#include "CfgVehicles.hpp"
