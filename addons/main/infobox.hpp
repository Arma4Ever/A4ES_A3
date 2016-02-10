class CfgCommands {
    allowedHTMLLoadURIs[] += {"http://arma3coop.pl/a3.php*"};
};
class CfgFunctions {
    class A3C_infobox {
        class A3C_infobox {
            class infobox {
                file = "\z\a3cs\addons\main\functions\fn_infobox.sqf";
            };
            class initinfobox {
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
class RscDisplayMain: RscStandardDisplay {
    onMouseMoving = "_this call A3C_infobox_fnc_initinfobox";
    class controls {
        class GameLogo: RscPicture {
            idc = 1202;
            text = PATHTOF(data\a3c_splash_logo.paa);
            x = "1 *            (           ((safezoneW / safezoneH) min 1.2) / 40) +           (safezoneX)";
            y = "10.4 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +            (safezoneY + safezoneH -            (           ((safezoneW / safezoneH) min 1.2) / 1.2))";
            w = "7.5 *          (           ((safezoneW / safezoneH) min 1.2) / 40)";
            h = "3.75 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
        class News: RscControlsGroupNoScrollbars {
            x = "safezoneX + safezoneW - (16 *          (           ((safezoneW / safezoneH) min 1.2) / 40))";
            y = "safezoneY + (1 *           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
            idc = 2300;
            w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
            h = "21.5 *             (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            class controls {
                class A3C_Infobox_fake: RscHTML {
                    idc = 19000;
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                /*
                class A3CS_Infobox_VerifyButton: RscButtonMenu {
                    idc = 19001;
                    x = "8 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    text = "Mody";
                    action = "[""mods""] call a3c_infobox_fnc_infobox";
                };
                class A3CS_Infobox_MissionButton: RscButtonMenu {
                    idc = 19002;
                    x = "0 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    text = "Misje";
                    action = "[""missions""] call a3c_infobox_fnc_infobox";
                };
                */
                class A3CS_Infobox_Boxtitle: RscText {
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
                    idc = 19003;
                    x = "0 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "1.1 *          (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *            (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    text = "ARMA3COOP.pl";
                };
                class A3CS_Infobox_Background: RscText {
                    idc = 19004;
                    x = "0 *            (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "2.1 *          (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "20 *           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    colorBackground[] = {0,0,0,0.4};
                };
                class A3CS_Infobox_Text: RscHTML {
                    idc = 19005;
                    x = "0.2 *          (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "2.1 *          (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *           (           ((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "21 *           (           (           ((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    shadow = 0;
                    class H1 {
                        font = "PuristaMedium";
                        fontBold = "PuristaLight";
                        sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
                    };
                    class H2: H1 {
                        sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
                        font = "PuristaLight";
                    };
                    class P: H1 {
                        sizeEx = "( ( ( ((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        fontBold = "PuristaLight";
                    };
                    colorBold[] = {0.6,0.6,0.6,1};
                    colorLink[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
                    colorLinkActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",1};
                };
                class NewsTitle: RscText {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                class NewsBackgroundDate: RscText {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                class NewsBackground: RscText {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
                class NewsText: RscHTML {
                    x = "0";
                    y = "0";
                    w = "0";
                    h = "0";
                };
            };
        };
    };
};
