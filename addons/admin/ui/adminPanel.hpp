class A3CS_adminPanel {
    idd = -1;
    movingEnable = false;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2('A3CS_adminPanel', _this select 0)];0 call FUNC(onLoadAdminPanel););
    onUnload = QUOTE(uiNamespace setVariable [ARR_2('A3CS_adminPanel', nil)];);
    class controlsBackground {
        class HeaderBackground: A3CS_ui_backgroundBase {
            idc = -1;
            type = CT_STATIC;
            x = X_PART(1);
            y = Y_PART(1);
            w = W_PART(38);
            h = H_PART(1);
            style = ST_LEFT + ST_SHADOW;
            font = "PuristaMedium";
            SizeEx = H_PART(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {"(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])", "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            text = "";
        };
        class CenterBackground: HeaderBackground {
            y = Y_PART(2.1);
            h = H_PART(2.5);
            text = "";
            colorText[] = {0, 0, 0, "(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
            colorBackground[] = {0,0,0,"(profilenamespace getVariable ['GUI_BCG_RGB_A',0.9])"};
        };
        class LeftBackground: CenterBackground {
            y = Y_PART(4.8);
            h = H_PART(17.4);
            w = W_PART(25);
        };
        class RightBackground: LeftBackground {
            x = X_PART(26.1);
            w = W_PART(12.9);
        };
        class RightBackgroundHeader: RightBackground {
            h = H_PART(1.4);
            colorBackground[] = {0,0,0,1};
        };
    };
    class controls {
        class HeaderName {
            idc = IDC_ADMINPANEL_HEADER;
            type = CT_STATIC;
            x = X_PART(1);
            y = Y_PART(1);
            w = W_PART(38);
            h = H_PART(1);
            style = ST_LEFT + ST_SHADOW;
            font = "PuristaMedium";
            SizeEx = H_PART(1);
            colorText[] = {0.95, 0.95, 0.95, 0.75};
            colorBackground[] = {0,0,0,0};
            text = "";
        };
        class LogsTypeLabel: A3CS_ui_staticBase {
            idc = IDC_ADMINPANEL_LOGSTYPELABEL;
            x = X_PART(1);
            y = Y_PART(3.4);
            w = W_PART(9.5);
            h = H_PART(1);
            style = ST_CENTER;
            text = "";
        };
        //wybor logow
        class LogsTypeSelection: A3CS_ui_comboBoxBase {
            idc = IDC_ADMINPANEL_LOGSTYPESELECTION;
            x = X_PART(10.5);
            y = Y_PART(3.4);
            w = W_PART(9);
            h = H_PART(1);
            text = "";
            onLBSelChanged = QUOTE(call FUNC(onPanelLogTypeChange));
            SizeEx = H_PART(0.9);
        };
        class PanelAction_1: A3CS_ui_buttonBase {
            idc = IDC_ADMINPANEL_PANELACTION_1;
            text = "";
            x = X_PART(1);
            y = Y_PART(2.1);
            w = W_PART(9.5);
            h = H_PART(1);
            animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.9)";
            animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.8)";
            animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
            animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
            color[] = {1, 1, 1, 1};
            color2[] = {0,0,0, 1};
            colorBackgroundFocused[] = {1,1,1,1};
            colorBackground[] = {1,1,1,1};
            colorbackground2[] = {1,1,1,1};
            colorDisabled[] = {1,1,1,1};
            colorFocused[] = {0,0,0,1};
            periodFocus = 1;
            periodOver = 1;
            action = "";
            SizeEx = H_PART(1);
            Size = H_PART(1);
        };
        class PanelAction_2: PanelAction_1 {
            idc = IDC_ADMINPANEL_PANELACTION_2;
            text = "";
            x = X_PART(10.5);
            action = "";
        };
        class PanelAction_3: PanelAction_1 {
            idc = IDC_ADMINPANEL_PANELACTION_3;
            text = "";
            x = X_PART(20);
            action = "";
        };
        class PanelAction_4: PanelAction_1 {
            idc = IDC_ADMINPANEL_PANELACTION_4;
            text = "";
            x = X_PART(29.5);
            action = "";
        };
        class LogList: A3CS_ui_listNBoxBase {
            idc = IDC_ADMINPANEL_LOGLIST;
            x = X_PART(2);
            y = Y_PART(5.5);
            w = W_PART(23);
            h = H_PART(15);
            SizeEx = H_ORIGINAL(0.8);
            colorBackground[] = {0, 0, 0, 0.9};
            colorSelectBackground[] = {0, 0, 0, 0.9};
            columns[] = {0.0, 0.45};
            onLBSelChanged = "";
        };
        class MissionDataLabel: A3CS_ui_staticBase {
            idc = IDC_ADMINPANEL_MISSIONDATALABEL;
            x = X_PART(26.5);
            y = Y_PART(5.1);
            w = W_PART(11.7);
            h = H_PART(1);
            text = "";
            SizeEx = H_PART(1);
        };
        class MissionDataText: A3CS_ui_listNBoxBase {
            idc = IDC_ADMINPANEL_MISSIONDATATEXT;
            x = X_PART(26.5);
            y = Y_PART(7);
            w = W_PART(11.7);
            h = H_PART(15);
            SizeEx = H_ORIGINAL(0.8);
            colorBackground[] = {0, 0, 0, 0};
            colorSelectBackground[] = {0, 0, 0, 0};
            columns[] = {0.0, 0.45};
            onLBSelChanged = "";
        };
        class PanelActionClose: A3CS_ui_buttonBase {
            idc = IDC_ADMINPANEL_PANELACTIONCLOSE;
            text = ECSTRING(Common,Close);
            x = X_PART(1);
            y = Y_PART(22.3);
            w = W_PART(7.5);
            h = H_PART(1);
            style = ST_LEFT;
            animTextureNormal = "#(argb,8,8,3)color(0,0,0,0.8)";
            animTextureDisabled = "#(argb,8,8,3)color(0,0,0,0.5)";
            animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
            animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
            animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
            color[] = {1, 1, 1, 1};
            color2[] = {0,0,0, 1};
            colorBackgroundFocused[] = {1,1,1,1};
            colorBackground[] = {1,1,1,1};
            colorbackground2[] = {1,1,1,1};
            colorDisabled[] = {0.5,0.5,0.5,0.8};
            colorFocused[] = {0,0,0,1};
            periodFocus = 1;
            periodOver = 1;
            action = "closeDialog 0";
            SizeEx = H_PART(1);
            Size = H_PART(1);
        };
        class PanelActionRefreshLogs: PanelActionClose {
            idc = IDC_ADMINPANEL_PANELACTIONREFRESHLOGS;
            text = CSTRING(RefreshLogs);
            x = X_PART(9.5);
            action = QUOTE(call FUNC(onPanelLogTypeChange));
        };
        /*
        class action_none2: actionClose {
            idc = 1102;
            text = "action_none2";
            x = X_PART(18);
            action = "";
        };
        */
        class PanelActionEndMission: PanelActionClose {
            idc = IDC_ADMINPANEL_PANELACTIONENDMISSION;
            text = "";
            x = X_PART(26.1);
            w = W_PART(12.9);
            action = "";
        };
        /*
        class action_none3: actionClose {
            idc = 1102;
            text = "action_none3";
            x = X_PART(34);
            w = W_PART(5);
            action = "";
            tooltip = CSTRING(headBugFixTooltip);
        };
        */
    };
};
