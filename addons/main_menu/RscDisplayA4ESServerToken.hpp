class RscDisplayA4ESServerToken: RscStandardDisplay {
    idd = -1;
    onLoad = QUOTE(_this call (uiNamespace getVariable QQFUNC(onLoadDisplayToken)));
    onUnload = QUOTE(_this call (uiNamespace getVariable QQFUNC(onUnloadDisplayToken)));

    class controlsbackground {
        class Vignette: RscVignette {
            idc = 114998;
        };
        class TileGroup: RscControlsGroupNoScrollbars {
            idc = 115099;
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
            class Controls {
                class Background: RscText {
                    idc = 114999;
                    x = 0;
                    y = 0;
                    w = "safezoneWAbs";
                    h = "safezoneH";
                    colorBackground[]={0,0,0,0.8};
                };
            };
        };
        class TitleBackground: RscText {
            idc = 1080;
            x = "(1 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(15 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
            };
        };
        class MainBackground: RscText {
            idc = 1081;
            x = "(1 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(16.1 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "6.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {0,0,0,0.69999999};
        };
    };
    class controls {
        delete B_OK;
        delete B_Cancel;

        class Title: RscTitle {
            style = 0;
            idc = 1000;
            text = CSTRING(VerifyWithToken);
            x = "(1 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(15 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class TextToken: RscText {
            idc = 1002;
            text = "Token";
            x = "(1.5 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(18 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "5 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class ValueToken: RscEdit {
            idc = 101;
            x = "(6.5 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(18 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "31 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class TextLoading: RscStructuredText {
            idc = 1004;
            shadow = 0;
            text = "";
            x = "(1.5 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(18 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "31 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class SubTextToken: RscStructuredText {
            idc = 1003;
            shadow = 0;
            text = "";
            x = "(1.5 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(19.5 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "31 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class ButtonOk: RscButtonMenuOK {
            idc = 102;
            x = "(32.75 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(23 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "6.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class ButtonCancel: RscButtonMenuCancel {
            idc = 103;
            x = "(1 + 20) * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
            y = "(23 - 18) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "6.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
    };
};