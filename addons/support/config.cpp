#include "script_component.hpp"


class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "A3_Ui_F"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "Cfg3DEN.hpp"

/*
class RscText;
class RscTitle;
class RscListBox;
class RscControlsGroup;
class RscMapControl;
class RscButtonMenu;
class RscButtonMenuCancel;

class GVAR(RscSupportPanel) {
	onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(RscSupportPanel), _this select 0)];);
	onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(RscSupportPanel), displayNull)];);
	idd = -1;
    movingEnable = 1;
	enableSimulation = 1;
	enableDisplay = 1;
	class controlsBackground {
		class titleBackground: RscText {
            idc = IDC_RSCSUPPORTPANEL_TITLEBG;
			x = "-6.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "53 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R', 0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G', 0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B', 0.21])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_A', 0.8])"
			};
		};
		class mainBackground: RscText {
			idc = IDC_RSCSUPPORTPANEL_MAINBG;
			x = "-6.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "53 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "20.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {0, 0, 0, 0.69999999};
		};
	};
	class Controls {
		class title: RscTitle {
			idc = IDC_RSCSUPPORTPANEL_TITLE;
			text = CSTRING(Title);
			x = "-6.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
        class assetTitle: RscTitle {
			idc = IDC_RSCSUPPORTPANEL_ASSETTITLE;
			text = "";
			x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "24 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
        class assetsList: RscListBox {
			IDC = IDC_RSCSUPPORTPANEL_ASSETS;
			x = "-6.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "20.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
        class propertiesGroup: RscControlsGroup {
			IDC = IDC_RSCSUPPORTPANEL_PROPERTIES;
            x = "8.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "20.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class positionMap: RscMapControl {
			idc = IDC_RSCSUPPORTPANEL_MAP;
			x = "23.7 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "22.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "20.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {1, 1, 1, 1};
            showCountourInterval = 0;
			scaleDefault = 0.1;
            drawObjects = 0;
            showMarkers = 0;
            showTacticalPing = 0;
		};
		class sendMission: RscButtonMenu {
            idc = IDC_RSCSUPPORTPANEL_BUTTONSEND;
			text = CSTRING(SendMission);
			x = "38.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "8 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class cancelDialog: RscButtonMenuCancel {
			text = ECSTRING(Common,Close);
			x = "-6.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
*/
