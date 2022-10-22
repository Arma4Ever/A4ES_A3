class RscText;
class RscTitle;
class RscControlsGroup;
class RscStructuredText;
class RscListBox;
class RscButtonMenu;

#define DIALOGUE_UI_BASE_Y 12

class GVAR(ui) {
	idd = -1;
	movingEnable = 0;
	onLoad = QUOTE(_this call FUNC(ui_onLoad));
	onUnload = QUOTE(_this call FUNC(ui_onUnload));
	class controlsBackground {
		class DialogueUIBackground: RscText {
			idc = IDC_DIALOGUE_UI_BG;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
			y = QUOTE(DIALOGUE_UI_BASE_Y * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "16.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 0.76};
		};
	};
	class controls {
		delete ButtonClose;
		class Title: RscTitle {
			shadow = 0;
			idc = IDC_DIALOGUE_UI_TITLE;
			text = "Stefan Batory";
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
			y = QUOTE(DIALOGUE_UI_BASE_Y * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0, 0, 0, 1};
		};
		class DialogueTextControlsGroup: RscControlsGroup {
			idc = IDC_DIALOGUE_UI_TEXTCTRLGRP;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
			y = QUOTE((DIALOGUE_UI_BASE_Y + 1.5) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
			w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "7.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			class controls {
				class DialogueText: RscStructuredText {
					shadow = 0;
					idc = IDC_DIALOGUE_UI_TEXT;
                    text = "";
					x = "0.25 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w = "37 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
				};
			};
		};
        class ListOptionsLabel: RscStructuredText {
            idc = IDC_DIALOGUE_UI_LISTOPTIONS_LABEL;
            x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
            y = QUOTE((DIALOGUE_UI_BASE_Y + 9.5) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
            w = "38 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[] = {0, 0, 0, 0.65};
        };
        class ListOptions: RscListBox {
			idc = IDC_DIALOGUE_UI_LISTOPTIONS;
            x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
			y = QUOTE((DIALOGUE_UI_BASE_Y + 11) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
			w = "29.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
        class ConfirmLabel: RscStructuredText {
            shadow = 0;
            idc = IDC_DIALOGUE_UI_CONFIRM_LABEL;
            x = "31.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
            y = QUOTE((DIALOGUE_UI_BASE_Y + 11.5) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
            w = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

            class Attributes {
        		font = "RobotoCondensed";
        		color = "#ffffff";
        		colorLink = "#D09B43";
        		align = "center";
        		shadow = 0;
        	};
        };
        class ConfirmButton: RscButtonMenu {
            idc = IDC_DIALOGUE_UI_CONFIRM_BTN;
            text = "Wybierz opcję";
			x = "31.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2)) / 2)";
			y = QUOTE((DIALOGUE_UI_BASE_Y + 14.9) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2)) / 2));
			w = "7 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};
