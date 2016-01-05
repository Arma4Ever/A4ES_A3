#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {"a3cs_dummyVest"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common"};
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

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class ADDON {
            killed = QUOTE(call FUNC(removeDummyVest));
        };
    };
};

class ACE_Settings {
    class GVAR(enableColorCorrectionsEffect) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_A3CS_MM_Settings_displayName_enableColorCorrectionsEffect";
        category = "$STR_A3CS_MM_Settings_category_effects";
    };
};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class a3cs_modules: NO_CATEGORY
    {
        displayName = "A3CS";
    };
    class a3cs_modules_supplies: NO_CATEGORY
    {
        displayName = "Zaopatrzenie";
    };
    class a3cs_modules_support: NO_CATEGORY
    {
        displayName = "Wsparcie";
    };
    class a3cs_modules_interactions: NO_CATEGORY
    {
        displayName = "Interakcje";
    };
    class a3cs_modules_tasks: NO_CATEGORY
    {
        displayName = "Zadania";
    };
    class a3cs_modules_effects: NO_CATEGORY
    {
        displayName = "Efekty";
    };
    class a3cs_modules_ai: NO_CATEGORY
    {
        displayName = "AI";
    };
    class a3cs_modules_settings: NO_CATEGORY
    {
        displayName = "Ustawienia";
    };
};

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
#include "CfgSounds.hpp"

#include "dialogs.hpp"
