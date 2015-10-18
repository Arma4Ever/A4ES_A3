#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

class ACE_settingsMenu {
    class controls {
        class HeaderName {
            text = "$STR_A3CS_OptionsMenu_OpenConfigMenu";
        };
    };
};
class ACE_serverSettingsMenu {
    class controls {
        class HeaderName {
            text = "$STR_A3CS_OptionsMenu_OpenConfigMenu";
        };
    };
};

class ACE_Open_SettingsMenu_BtnBase {
    text = "$STR_A3CS_OptionsMenu_OpenConfigMenu";
};

class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
    class controls {
        delete ACE_news;
    };
};
