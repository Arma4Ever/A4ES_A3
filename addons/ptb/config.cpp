#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {"ACE_IR_Strobe_Item"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "ace_attach"};
        author = "SzwedzikPL, ACE3 Team";
        authorUrl = "http://arma3coop.pl";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgWeapons.hpp"
#include "CfgCloudlets.hpp"
