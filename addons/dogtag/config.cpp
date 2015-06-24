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

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class A3CS_ShowDogtag {
                displayName = "$STR_A3CS_Dogtag_CheckDogtag";
                distance = 2;
                priority = 2;
                condition = QUOTE(!alive _target || _target getVariable [ARR_2(QUOTE(QUOTE(ACE_isUnconscious)), false)]); // QUOTE([ARR_4(_player, _target, 'body', 'BodyBag')] call DFUNC(canTreatCached));
                statement = QUOTE([_target] call DFUNC(showDogtag)); // QUOTE([ARR_4(_player, _target, 'body', 'BodyBag')] call DFUNC(treatment));
                exceptions[] = {};
            };
        };
    };
};

class RscPicture;
class RscStructuredText;

class RscTitles {
    class A3CS_RscDogtag {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QUOTE(A3CS_ctrlDogtag)), (_this select 0) displayCtrl 2)]);
        movingEnable = false;
        duration = 5;
        fadeIn = 0.2;
        fadeOut = 0.2;
        name = "A3CS_RscDogtag";

        class controls {
            class DogtagBG: RscPicture {
                idc = 1;
                text = PATHTOF(data\dogtag.paa);
                SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.175 * safezoneH;
                w = (8 *(((safezoneW / safezoneH) min 1.2) / 40));
                h = (4 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
            };
            class DogtagName: RscStructuredText {
                idc = 2;
                text = "";
                SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (8.4 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.2 * safezoneH;
                w = (5.9 *(((safezoneW / safezoneH) min 1.2) / 40));
                h = (4 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
                class Attributes {
                    font = "EtelkaMonospacePro";
                    color = "#FFFFFF";
                    align = "center";
                    valign = "middle";
                    shadow = 1;
                    shadowColor = "#3f4345";
                    size = "0.85";
                };
            };
        };
    };
};