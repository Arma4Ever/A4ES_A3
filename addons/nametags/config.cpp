#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "A3_3DEN", "a4es_editor", "a4es_modules"};
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
