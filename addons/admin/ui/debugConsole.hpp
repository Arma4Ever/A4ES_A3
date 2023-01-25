class A4ES_debugConsole {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2('A4ES_debugConsole', _this select 0)];);
    onUnload = QUOTE(uiNamespace setVariable [ARR_2('A4ES_debugConsole', nil)];);
    class controlsBackground {};
    class controls {
        class DebugConsole: RscControlsGroupNoScrollbars {
            idc = -1;
            x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
            y = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
            w = "22 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "21.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            class controls {
                class Title: RscTitle {
                    idc = IDC_DEBUGCONSOLE_TITLE;
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "22 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ExpressionBackground: RscText {
                    idc = IDC_DEBUGCONSOLE_EXPRESSIONBACKGROUND;
                    colorBackground[] = {0,0,0,0.7};
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "22 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ExpressionText: RscText {
                    idc = IDC_DEBUGCONSOLE_EXPRESSIONTEXT;
                    text = "Execute";
                    x = "0.2 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "22 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class Expression: RscEdit {
                    idc = IDC_DEBUGCONSOLE_EXPRESSION;
                    style = 16;
                    autocomplete = "scripting";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "1.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonExecuteServer: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONEXECUTESERVER;
                    text = "SERVER EXEC";
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "9.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonExecuteGlobal: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONEXECUTEGLOBAL;
                    text = "GLOBAL EXEC";
                    x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "9.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonExecuteLocal: RscButtonMenuOK {
                    idc = IDC_DEBUGCONSOLE_BUTTONEXECUTELOCAL;
                    default = 0;
                    action = "";
                    text = "LOCAL EXEC";
                    x = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "9.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchBackground: RscText {
                    idc = IDC_DEBUGCONSOLE_WATCHBACKGROUND;
                    colorBackground[] = {0,0,0,0.7};
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "10.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "22 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "8.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchText: RscText {
                    idc = IDC_DEBUGCONSOLE_WATCHTEXT;
                    text = "Watch:";
                    x = "0.2 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "10.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "22 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchInput1: RscEdit {
                    idc = IDC_DEBUGCONSOLE_WATCHINPUT1;
                    autocomplete = "scripting";
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "11 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutputBackground1: RscText {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUTBACKGROUND1;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "12 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    colorBackground[] = {0,0,0,0.75};
                };
                class WatchOutput1: RscEdit {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUT1;
                    lineSpacing = 1;
                    style = 512;
                    shadow = 0;
                    font = "EtelkaMonospacePro";
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "12 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    colorBackground[] = {0,0,0,0.75};
                    sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchInput2: WatchInput1 {
                    idc = IDC_DEBUGCONSOLE_WATCHINPUT2;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "13 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutputBackground2: WatchOutputBackground1 {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUTBACKGROUND2;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "14 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutput2: WatchOutput1 {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUT2;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "14 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchInput3: WatchInput1 {
                    idc = IDC_DEBUGCONSOLE_WATCHINPUT3;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutputBackground3: WatchOutputBackground1 {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUTBACKGROUND3;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "16 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutput3: WatchOutput1 {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUT3;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "16 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchInput4: WatchInput1 {
                    idc = IDC_DEBUGCONSOLE_WATCHINPUT4;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "17 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutputBackground4: WatchOutputBackground1 {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUTBACKGROUND4;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class WatchOutput4: WatchOutput1 {
                    idc = IDC_DEBUGCONSOLE_WATCHOUTPUT4;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "21 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonAction1: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONACTION1;
                    text = "";
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "19.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonAction2: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONACTION2;
                    text = "";
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "20.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonAction3: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONACTION3;
                    text = "";
                    x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "19.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonAction4: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONACTION4;
                    text = "";
                    x = "7.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "20.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonAction5: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONACTION5;
                    text = "";
                    x = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "19.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ButtonAction6: RscButtonMenu {
                    idc = IDC_DEBUGCONSOLE_BUTTONACTION6;
                    text = "";
                    x = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "20.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
            };
        };
        class ButtonCancel: RscButtonMenuCancel {
            x = "9 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
            y = "23.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
            w = "7.4 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };
    };
};
