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
    };
};

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101
#define CT_LISTNBOX         102

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0C

#define ST_TYPE           0xF0
#define ST_SINGLE         0x00
#define ST_MULTI          0x10
#define ST_TITLE_BAR      0x20
#define ST_PICTURE        0x30
#define ST_FRAME          0x40
#define ST_BACKGROUND     0x50
#define ST_GROUP_BOX      0x60
#define ST_GROUP_BOX2     0x70
#define ST_HUD_BACKGROUND 0x80
#define ST_TILE_PICTURE   0x90
#define ST_WITH_RECT      0xA0
#define ST_LINE           0xB0

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define ST_TITLE          ST_TITLE_BAR + ST_CENTER

// Slider styles
#define SL_DIR            0x400
#define SL_VERT           0
#define SL_HORZ           0x400

#define SL_TEXTURES       0x10

// progress bar
#define ST_VERTICAL       0x01
#define ST_HORIZONTAL     0

// Listbox styles
#define LB_TEXTURES       0x10
#define LB_MULTI          0x20

// Tree styles
#define TR_SHOWROOT       1
#define TR_AUTOCOLLAPSE   2

// MessageBox styles
#define MB_BUTTON_OK      1
#define MB_BUTTON_CANCEL  2
#define MB_BUTTON_USER    4

class w_RscText {

    idc = -1;
    type = CT_STATIC;
    style = ST_LEFT;
    colorBackground[] = { 1 , 1 , 1 , 0 };
    colorText[] = { 1 , 1 , 1 , 1 };
    font = "PuristaSemibold";
    sizeEx = 0.025;
    h = 0.25;
    text = "";
};

class RscTitles
{
    #define hud_status_idc 3600

    class NameTag {
        idd = -1;
        fadeout = 0.25;
        fadein = 0;
        duration = 0.5;
        name= "NameTag";
        onLoad = "uiNamespace setVariable ['NameTag', _this select 0]";

        class controlsBackground {
            class NameTag_Status:w_RscText
            {
                idc = hud_status_idc;
                type = CT_STRUCTURED_TEXT;
                size = 0.040;
                x = 0.45;
                y = 0.50;
                w = 0.60;
                h = 0.20;
                colorText[] = {1,1,1,1};
                lineSpacing = 0;
                colorBackground[] = {0,0,0,0};
                shadow = 2;
                class Attributes {
                    align = "left";
                };
            };
        };
    };
    class PlayerTag {
        idd = -1;
        fadeout=0;
        fadein=0;
        duration = 43200;
        name= "PlayerTag";
        onLoad = "uiNamespace setVariable ['PlayerTag', _this select 0]";

        class controlsBackground {
            class PlayerTag_Status:w_RscText
            {
                idc = hud_status_idc;
                type = CT_STRUCTURED_TEXT;
                size = 0.040;
                x = safeZoneX + (safeZoneW * (1 - (0.35 / SafeZoneW)));
                y = safeZoneY + (safeZoneH * (1 - (0.097 / SafeZoneH)));
                w = 0.35; h = 0.50;
                colorText[] = {1,1,1,1};
                lineSpacing = 3;
                colorBackground[] = {0,0,0,0};
                text = "";
                shadow = 2;
                class Attributes {
                    align = "right";
                };
            };
        };
    };
    class A3CS_GPS
    {
        idd = -1;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        duration = 2147483647;
        fadein = 0;
        fadeout = 0;
        onLoad = "uiNamespace setVariable ['a3cs_gps', _this select 0]";
        class RscPicture;
        class RscStructuredText;
        class controls
        {
            class A3CS_GPS_BG: RscPicture
            {
                idc = 0;
                type = 0;
                style = 48;
                text = "\a3cs_c_weapons\data\gpsbg.paa";
                x = 0.89 * safezoneW + safezoneX;
                y = 0.74 * safezoneH + safezoneY;
                w = 0.14 * safezoneH;
                h = 0.185 * safezoneH;
                colorText[] = {1,1,1,1};
                colorBackground[] = {0, 0, 0, 0};
                font = "TahomaB";
                sizeEx = 0;
                lineSpacing = 0;
                fixedWidth = 0;
                shadow = 0;
            };
            class A3CS_GPS_INFO: RscStructuredText
            {
                idc = 1;
                type = 13;
                style = 0x00;
                colorBackground[] = {0,0,0,0};
                x = 0.89 * safezoneW + safezoneX;
                y = 0.78 * safezoneH + safezoneY;
                w = 0.14 * safezoneH;
                h = 0.14 * safezoneH;
                SizeEx = 0.040000;
                Size = 0.025 * safezoneH;
                text = "";
                class Attributes {
                    font = "TahomaB";
                    color = "#1e2112";
                    align = "center";
                    valign = "middle";
                    shadow = false;
                    shadowColor = "#1e2112";
                    size = "1";
                };
            };
        };
    };
    class a3cs_dialog_progbar
    {
        idd = -1;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;
        onLoad = "a3cs_dialog_progressbar = _this";
        duration = 9999;
        fadein = 0;
        fadeout = 0;
        class RscText
        {
            x = 0;
            y = 0;
            h = 0.037;
            w = 0.3;
            type = CT_STATIC;
            style = ST_CENTER;
            shadow = 1;
            colorShadow[] = {0,0,0,0.5};
            font = "PuristaMedium";
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
            colorText[] = {1,1,1,1.0};
            colorBackground[] = {0,0,0,0};
            linespacing = 1;
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            tooltipColorShade[] = {0,0,0,0.65};
        };
        class RscXSliderH
        {
            type = CT_XSLIDER;
            style = "0x400  + 0x10";
            shadow = 0;
            x = 0;
            y = 0;
            h = 0.029412;
            w = 0.4;
            color[] = {1,1,1,0.6};
            colorActive[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,0.2};
            arrowEmpty = "\a3cs_main\data\empty.paa";
            arrowFull = "\a3cs_main\data\empty.paa";
            border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
            thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            tooltipColorShade[] = {0,0,0,0.65};
        };
        class controls
        {
            class RscSlider_1900: RscXSliderH
            {
                idc = 1900;
                x = 0.378232 * safezoneW + safezoneX;
                y = 0.706242 * safezoneH + safezoneY;
                w = 0.25695 * safezoneW;
                h = 0.040333 * safezoneH;
            };
            class RscText_1002: RscText
            {
                idc = 1902;
                text = "Akcja";
                x = 0.378232 * safezoneW + safezoneX;
                y = 0.736242 * safezoneH + safezoneY;
                w = 0.25695 * safezoneW;
                h = 0.040333 * safezoneH;
            };
        };
    };
};