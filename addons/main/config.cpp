#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            #include "required_addons.hpp"
            "cba_main"
        };
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "Alduric", "Chris", "Wodzu", "Samsung1702", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};
class CfgSettings {
    class CBA {
        class Versioning {
            class a3cs {
                main_addon = "a3cs_main";
                level = -1;
                //handler = "a3cs_common_fnc_mismatch";
                //removed[] = {"a3cs_oldaddon"};
            };
        };

        //enable_auto_xeh
        class XEH
        {
            supportMonitor = 1;
        };
    };
};
class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_post_initClient));
        serverInit = QUOTE(call COMPILE_FILE(XEH_post_initServer));
    };
};

class a3c_mods {
    modlist[] += {"CBA","TFAR","A3CS","PAM","A3MP","A3AP"};
};
class CfgMods {
    class Mod_Base;
    class A3CS: Mod_Base {
        name = "Arma 3 Combat System";
        picture = PATHTOF(data\logo_a3cs_ca.paa);
        actionName = "Forum";
        action = "http://forum.arma3coop.pl";
        description = "Arma 3 Combat System";
        logo = PATHTOF(data\logo_a3cs_ca.paa);
        logoOver = PATHTOF(data\logo_a3cs_ca.paa);
        tooltip = "Arma 3 Combat System";
        tooltipOwned = "Arma 3 Combat System Owned";
        overview = "$STR_A3CS_Main_CfgModsOverview";
        author = "Arma3Coop.pl & ACE3 Team";
        overviewPicture = PATHTOF(data\logo_a3cs_ca.paa);
        fieldManualTopicAndHint[] = {"A3C", "A3CS"};
        mod_code = "A3CS";
        mod_version = A3CS_VERSION;
        mod_version_ar[] = A3CS_VERSION_ARRAY;
    };
};

class CfgVehicleClasses {
    class a3cs_objects {
        displayname = "$STR_A3CS_Main_VehicleClasses_displayname_objects";
    };
    class a3cs_crates {
        displayname = "$STR_A3CS_Main_VehicleClasses_displayname_crates";
    };
    class a3cs_crates_empty {
        displayname = "$STR_A3CS_Main_VehicleClasses_displayname_crates_empty";
    };
};

//ACE

#include "ace_options.hpp"
#include "ace_medical_treatments.hpp"

class CfgVehicles {
    class Module_F;
    class ACE_Module;
    #include "hidden_modules.hpp"
    #include "ace_actions.hpp"
};

//Infobox
#include "infobox.hpp"
#include "intro.hpp"
