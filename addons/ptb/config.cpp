#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {"ACE_IR_Strobe_Item"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common", "ace_attach"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    class ACE_IR_Strobe_Effect {
        class GVAR(thermalStrobeEffect) {
            init = QUOTE(_this spawn FUNC(thermalStrobeEffect));
        };
    };
};

class CfgWeapons {
    class ACE_ItemCore;
    class ACE_IR_Strobe_Item: ACE_ItemCore {
        displayName = CSTRING(StrobeItem_DisplayName);
        descriptionShort = CSTRING(StrobeItem_Description);
    };
};
