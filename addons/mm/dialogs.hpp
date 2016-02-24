
#include "\z\a3cs\addons\common\ui\define.hpp"
#include "ui\idcRscA3CSIntroEffect.hpp"

class RscText;
class RscStructuredText;
class RscButton;
class RscButtonArsenal;
class RscListbox;
class RscEdit;
class RscPicture;
class RscPictureKeepAspect;
class RscControlsGroupNoScrollbars;

class RscTitles {
    class RscA3CSIntroEffect {
        idd = -1;
        duration = 25;
        fadeIn = 2;
        fadeOut = 2;
        onload = QUOTE(uiNamespace setVariable [ARR_2('RscA3CSIntroEffect', _this select 0)];0 call DFUNC(onLoadIntroEffect));
        onUnload = QUOTE(uiNamespace setVariable [ARR_2('RscA3CSIntroEffect', nil)];);
        class controls {
            class Picture: RscPicture {
                idc = IDC_RSCA3CINTROEFFECT_PICTURE;
                x = "14.2 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "12 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "12 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorText[] = {0,0.3,0.6,1};
                //18 5.5 4 4
            };
            class Title: RscText {
                style = ST_CENTER;
                idc = IDC_RSCA3CINTROEFFECT_TITLE;
                text = "";
                x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "11 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "26 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0,0,0,1};
                sizeEx = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class Subtitle1: RscText {
                style = ST_LEFT;
                idc = IDC_RSCA3CINTROEFFECT_SUBTITLE1;
                x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "11.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0,0,0,1};
                sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class Subtitle2: RscText {
                style = ST_LEFT;
                idc = IDC_RSCA3CINTROEFFECT_SUBTITLE2;
                x = "20.70 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "13.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "11.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0,0,0,1};
                sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class Subtitle3: RscText {
                style = ST_LEFT;
                idc = IDC_RSCA3CINTROEFFECT_SUBTITLE3;
                x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "11.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0,0,0,1};
                sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class Subtitle4: RscText {
                style = ST_LEFT;
                idc = IDC_RSCA3CINTROEFFECT_SUBTITLE4;
                x = "20.70 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "11.75 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0,0,0,1};
                sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
            class Subtitle5: RscText {
                style = ST_CENTER;
                idc = IDC_RSCA3CINTROEFFECT_SUBTITLE5;
                x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
                y = "16.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2)";
                w = "24 * (((safezoneW / safezoneH) min 1.2) / 40)";
                h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                colorBackground[] = {0,0,0,1};
                sizeEx = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            };
        };
    };
};

//rozmowa z AI
class A3CS_ui_dialogQuery {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    controlsBackground[] = {};
    objects[] = {};
    class controls {
        class RscPicture_1200: RscPicture {
            idc = -1;
            text = "#(argb,8,8,3)color(0,0,0,0.8)";
            x = 0.262812 * safezoneW + safezoneX;
            y = 0.225 * safezoneH + safezoneY;
            w = 0.474375 * safezoneW;
            h = 0.55 * safezoneH;
            colorBackground[] = {0,0,0,1};
            colorActive[] = {0,0,0,1};
        };
        class RscListbox_1500: RscListbox {
            idc = 1500;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.319688 * safezoneW;
            h = 0.198 * safezoneH;
        };
        class RscPicture_1201: RscPicture {
            idc = 1201;
            text = PATHTOF(data\default_avatar.jpg);
            x = 0.267969 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.139219 * safezoneW;
            h = 0.242 * safezoneH;
        };
        class RscListbox_1501: RscText {
            style = 0x10; //ST_MULTI
            idc = 1501;
            x = 0.267969 * safezoneW + safezoneX;
            y = 0.489 * safezoneH + safezoneY;
            w = 0.464062 * safezoneW;
            h = 0.275 * safezoneH;
        };
        class RscButton_1601: RscButton {
            idc = -1;
            x = 0.412344 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            text = "Zadaj pytanie";
            action = QUOTE(0 spawn DFUNC(dialogQuery));
        };
        class RscButton_1602: RscButton {
            idc = -1;
            x = 0.639219 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.033 * safezoneH;
            text = "Zakończ rozmowę";
            action = "closeDialog 0";
        };
    };
};
