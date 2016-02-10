
class RscText;
class RscStructuredText;
class RscButton;
class RscButtonArsenal;
class RscListbox;
class RscEdit;
class RscPicture;

//rozmowa z AI
class a3cs_mm_dialogQueryGUI {
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
