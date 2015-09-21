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

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class ace_microdagr_simpleGpsOn {
                    displayName = "Włącz nadajnik GPS";
                    condition = QUOTE([0] call ace_microdagr_fnc_simpleGps);
                    statement = QUOTE([1] call ace_microdagr_fnc_simpleGps);
                    showDisabled = 0;
                    priority = 0.3;
                    icon = QUOTE(\z\a3cs\addons\common\data\icon_simpleGPS.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
                class ace_microdagr_simpleGpsOff {
                    displayName = "Wyłącz nadajnik GPS";
                    condition = QUOTE([2] call ace_microdagr_fnc_simpleGps);
                    statement = QUOTE([3] call ace_microdagr_fnc_simpleGps);
                    showDisabled = 0;
                    priority = 0.3;
                    icon = QUOTE(\z\a3cs\addons\common\data\icon_simpleGPS.paa);
                    exceptions[] = {"notOnMap", "isNotInside"};
                };
            };
        };
    };
};

class CfgWeapons {
    class ACE_ItemCore;
    class InventoryItem_Base_F;

    class ACE_simpleGPS: ACE_ItemCore {
        author = "Arma3Coop.pl";
        scope = 2;
        displayName = "Prosty nadajnik GPS";
        descriptionShort = "Prosty nadajnik GPS";
        picture = QUOTE(\z\a3cs\addons\common\data\icon_simpleGPS.paa);
        class ItemInfo: InventoryItem_Base_F {
            mass = 1;
        };
    };
};
