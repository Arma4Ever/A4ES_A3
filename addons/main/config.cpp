#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            #include "\z\a3cs\addons\main\required_addons.hpp"
            "cba_main"
        };
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "Alduric", "Chris", "Wodzu", "Samsung1702", "ACE3 Team"};
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
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
    };
};

class CfgMods
{
    class Mod_Base;
    class A3CS: Mod_Base
    {
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

class CfgVehicleClasses
{
    class a3cs_common
    { 
        displayname = "[A3CS] Obiekty";
    };
    class a3cs_boxes
    { 
        displayname = "[A3CS] Skrzynie";
    };
};

class CfgVehicles 
{
    class Module_F;
    class ACE_Module;
    #include "\z\a3cs\addons\main\hidden_modules.hpp"
};

/*
class CfgHints
{
    class Default{};
    class A3C
    {
        displayName = "A3C";
        class A3CS
        {
            displayName = "Arma 3 Combat System";
            description = "$STR_A3CS_Main_CfgModsOverview";
            tip = "Osoba odpowiedzialna: SzwedzikPL";
            arguments[] = {};
            image = PATHTOF(data\a3cs_hint_icon.paa);

        };
    };
};
*/

//########## InfoBox ##########//
class CfgFunctions
{
    class A3C_infobox
    {
        class A3C_infobox
        {
            class infobox
            {
                file = "\z\a3cs\addons\main\functions\fn_infobox.sqf";
            };
            class initinfobox
            {
                file = "\z\a3cs\addons\main\functions\fn_initinfobox.sqf";
            };
        };
    };
};
class RscStandardDisplay;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscText;
class RscButtonMenu;
class RscHTML;
class RscPicture;
class RscVignette;
class RscPictureKeepAspect;
class RscDisplayMain: RscStandardDisplay
{
    onMouseMoving = "_this call A3C_infobox_fnc_initinfobox";
    class controls
    {
        class GameLogo: RscPicture
        {
            idc = 1202;
            text = PATHTOF(data\a3c_splash_logo.paa);
            x = "1 *            (           ((safezoneW / safezoneH) min 1.2) / 40) +           (safezoneX)";
            y = "10.4 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +            (safezoneY + safezoneH -            (           ((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "7.5 *          (           ((safezoneW / safezoneH) min 1.2) / 40)";
            h = "3.75 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class News: RscControlsGroupNoScrollbars
        {
            x = "safezoneX + safezoneW - (16 *          (           ((safezoneW / safezoneH) min 1.2) / 40))";
            y = "safezoneY + (1 *           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
            idc = 2300;
            w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
            h = "21.5 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            class controls
            {
                class A3C_Infobox_fake: RscHTML
                {
                    idc = 19000;
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                /*
                class A3CS_Infobox_VerifyButton: RscButtonMenu
                {
                    idc = 19001;
                    x = "8 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    text = "Mody";
                    action = "[""mods""] call a3c_infobox_fnc_infobox";
                };
                class A3CS_Infobox_MissionButton: RscButtonMenu
                {
                    idc = 19002;
                    x = "0 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    text = "Misje";
                    action = "[""missions""] call a3c_infobox_fnc_infobox";
                };
                */
                class A3CS_Infobox_Boxtitle: RscText
                {
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
                    idc = 19003;
                    x = "0 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "1.1 *          (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    text = "ARMA3COOP.pl";
                };
                class A3CS_Infobox_Background: RscText
                {
                    idc = 19004;
                    x = "0 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "2.1 *          (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "20 *           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    colorBackground[] = {0,0,0,0.4};
                };
                class A3CS_Infobox_Text: RscHTML
                {
                    idc = 19005;
                    x = "0.2 *          (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "2.1 *          (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "21 *           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    shadow = 0;
                    class H1
                    {
                        font = "PuristaMedium";
                        fontBold = "PuristaLight";
                        sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
                    };
                    class H2: H1
                    {
                        sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
                        font = "PuristaLight";
                    };
                    class P: H1
                    {
                        sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        fontBold = "PuristaLight";
                    };
                    colorBold[] = {0.6,0.6,0.6,1};
                    colorLink[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
                    colorLinkActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
                };
                class NewsTitle: RscText
                {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                class NewsBackgroundDate: RscText
                {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                class NewsBackground: RscText
                {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                class NewsText: RscHTML
                {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
            };
        };
    };
};
//########## InfoBox ##########//
//########## Intro ##########//
class RscDisplayStart: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
class RscDisplayLoadMission: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
class RscDisplayNotFreeze: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
class RscDisplayClient: RscStandardDisplay
{
    class controlsBackground
    {
        class Black: RscText
        {
            colorBackground[] = {0,0,0,1};
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class Map: RscPicture
        {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.42};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class CA_Vignette: RscVignette
        {
            colorText[] = {0,0,0,1};
        };
        class Noise: RscPicture
        {
            text = "\A3\Ui_f\data\GUI\Cfg\LoadingScreens\LoadingNoise_ca.paa";
            colorText[] = {1,1,1,1};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls
    {
        class LoadingStart: RscControlsGroupNoScrollbars
        {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls
            {
                class Black: RscText
                {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture
                {
                    idc = 1201;
                    text = "\A3\Ui_f\data\IGUI\RscTitles\SplashArma3\arma3_splashNoise_ca.paa";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
                class Logo: RscPictureKeepAspect
                {
                    idc = 1200;
                    text = PATHTOF(data\a3c_splash_logo.paa);
                    x = "0.25 * safezoneW";
                    y = "0.3125 * safezoneH";
                    w = "0.5 * safezoneW";
                    h = "0.25 * safezoneH";
                };

                class Logo_a3: RscPictureKeepAspect
                {
                    idc = 1207;
                    text = "\A3\Ui_f\data\Logos\arma3_expansion_ca.paa";
                    x = "(1 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_bi: RscPictureKeepAspect
                {
                    idc = 1208;
                    text = "\A3\Ui_f\data\Logos\bi_white_ca.paa";
                    x = "(12 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (8.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_a3cs: RscPictureKeepAspect
                {
                    idc = 1209;
                    text = PATHTOF(data\a3cs_logo.paa);
                    x = "1 * safezoneW - (21 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Logo_pam: RscPictureKeepAspect
                {
                    idc = 1210;
                    text = PATHTOF(data\pam_logo.paa);
                    x = "1 * safezoneW - (11 * (((safezoneW / safezoneH) min 1.2) / 40))";
                    y = "1 * safezoneH - (10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
                    w = "10 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
    };
};
//########## Intro ##########//