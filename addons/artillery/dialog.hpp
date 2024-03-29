
class RscVignette;
class RscControlsGroupNoScrollbars;
class RscText;
class RscTitle;
class RscListNBox;
class RscButtonMenu;
class RscButtonMenuCancel;

class GVAR(artilleryRadarDialog) {
    idd = -1;
    movingEnable = 0;
	onLoad = QUOTE(_this call FUNC(onRadarDialogLoad));
	onUnload = QUOTE(_this call FUNC(onRadarDialogUnload));
	class controlsBackground {
		class RscTitleBackground: RscText {
			colorBackground[] = {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
			};
			idc = 1080;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) +(safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +(safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class MainBackground: RscText {
			colorBackground[] = {0,0,0,0.69999999};
			idc = 1081;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) +(safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +(safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "20.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
	class controls {
		class Title: RscTitle {
			idc = 101;
			text = CSTRING(MobileArtilleryRadarItem_displayName);
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "25 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GVAR(status): RscText {
			idc = IDC_RADARDIALOG_STATUS;
			text = "STATUS";
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "3.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "37 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0,0,0,1};
		};
		class GVAR(list): RscListNBox {
			idc = IDC_RADARDIALOG_LIST;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) +(safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "4.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +(safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "37 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "18 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorSelect[] = {1, 1, 1, 1};
            colorSelect2[] = {1, 1, 1, 1};
            colorSelectBackground[] = {0, 0, 0, 0.5};
            colorSelectBackground2[] = {0, 0, 0, 0.5};
            colorBackground[] = {0, 0, 0, 0.5};
            columns[] = {0.0, 0.1, 0.3, 0.5, 0.8};
            sizeEx="1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            onLBSelChanged = "";
		};
		class GVAR(refresh): RscButtonMenu {
			idc = IDC_RADARDIALOG_REFRESH;
			text = CSTRING(Refresh);
			x = "32.75 * (((safezoneW / safezoneH) min 1.2) / 40) +(safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +(safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class GVAR(cancel): RscButtonMenuCancel {
			default = 1;
            text = ECSTRING(common,Close);
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) +(safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) +(safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "6.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
