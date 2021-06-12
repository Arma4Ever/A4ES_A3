#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "A3_3DEN", "a3cs_editor", "a3cs_modules"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "ACE Team"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class ctrlStatic;
class ctrlCombo;

#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"
#include "ranks.hpp"
