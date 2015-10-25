
class RscText;
class RscStructuredText;
class RscButton;
class RscButtonArsenal;
class RscListbox;
class RscEdit;
class RscPicture;

//edytor skrzynek
class a3cs_mm_boxEditorGUI_loading {
	idd = 7801;
	movingEnable = 0;
	class controlsBackground {
		class RscText_1000: RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.5 };
			x = 0.3 * safezoneW + safezoneX;
			y = 0.46666 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.046027 * safezoneH;
		};
	};
	class objects {};
	class controls {
		class RscText_1000: RscStructuredText {
			idc = 1000;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Loading";
			class Attributes {
			    align = "center";
			    valign = "middle";
			    size = "1.8";
			};
			x = 0.3 * safezoneW + safezoneX;
			y = 0.46666 * safezoneH + safezoneY;
			w = 0.4 * safezoneW;
			h = 0.066027 * safezoneH;
		};
	};
};
class a3cs_mm_boxEditorGUI {
	idd = 7800;
	movingEnable = 0;
	class controlsBackground {
		class RscText_1004: RscText {
			idc = -1;
			colorBackground[] = { 0, 0, 0, 0.5 };
			x = 0.284469 * safezoneW + safezoneX;
			y = 0.150057 * safezoneH + safezoneY;
			w = 0.429 * safezoneW;
			h = 0.682279 * safezoneH;
		};
	};
	class objects {};
	class controls {
		class RscText_1000: RscText {
			idc = 1000;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Count";
			x = 0.667058 * safezoneW + safezoneX;
			y = 0.273307 * safezoneH + safezoneY;
			w = 0.0371251 * safezoneW;
			h = 0.0374153 * safezoneH;
		};
		class RscText_1001: RscText {
			idc = 1001;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_AvailableElements0";
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.229289 * safezoneH + safezoneY;
			w = 0.140654 * safezoneW;
			h = 0.0374153 * safezoneH;
		};
		class RscText_1002: RscText {
			idc = 1002;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Elementsinbox0";
			x = 0.531968 * safezoneW + safezoneX;
			y = 0.229289 * safezoneH + safezoneY;
			w = 0.149623 * safezoneW;
			h = 0.0374153 * safezoneH;
		};
		class RscText_1003: RscText {
			idc = 1003;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Code";
			style = 0x01; //ST_RIGHT
			x = 0.295813 * safezoneW + safezoneX;
			y = 0.713487 * safezoneH + safezoneY;
			w = 0.0371251 * safezoneW;
			h = 0.0374153 * safezoneH;
		};
		class RscText_1004: RscStructuredText
		{
			idc = 1004;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Boxtitle";
			class Attributes {
			    align = "center";
			    valign = "middle";
			    size = "2";
			};
			x = 0.295812 * safezoneW + safezoneX;
			y = 0.16666 * safezoneH + safezoneY;
			w = 0.408375 * safezoneW;
			h = 0.066027 * safezoneH;
		};
		/*
		class RscText_1005: RscStructuredText
		{
			idc = 1005;
			text = "<img image='a3clogo.paa'/>";
			x = 0.284469 * safezoneW + safezoneX;
			y = 0.160057 * safezoneH + safezoneY;
			w = 0.218375 * safezoneW;
			h = 0.066027 * safezoneH;
			class Attributes {
			    align = "center";
			    valign = "middle";
			    size = "2.8";
			};
		};
		*/
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = ">>";
			action = "0 call a3cs_fnc_boxEditorGUI_buttonAddItem;";
			x = 0.479371 * safezoneW + safezoneX;
			y = 0.268905 * safezoneH + safezoneY;
			w = 0.0412501 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_Additem_desc";
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "<<";
			action = "0 call a3cs_fnc_boxEditorGUI_buttonRemoveItem;";
			x = 0.479371 * safezoneW + safezoneX;
			y = 0.334932 * safezoneH + safezoneY;
			w = 0.0412501 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_Removeitem_desc";
		};
		class RscButton_1602: RscButtonArsenal
		{
			idc = 1602;
			text = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\primaryweapon_ca.paa";
			action = "['weapons'] call a3cs_fnc_boxEditorGUI_buttonChangeCategory;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.268905 * safezoneH + safezoneY;
			w = 0.0412499 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_Category_weapon";
		};
		class RscButton_1603: RscButtonArsenal
		{
			idc = 1603;
			text = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargomag_ca.paa";
			action = "['magazines'] call a3cs_fnc_boxEditorGUI_buttonChangeCategory;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.334932 * safezoneH + safezoneY;
			w = 0.0412499 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_Category_ammo";
		};
		class RscButton_1604: RscButtonArsenal
		{
			idc = 1604;
			text = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\Watch_ca.paa";
			action = "['items'] call a3cs_fnc_boxEditorGUI_buttonChangeCategory;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.400959 * safezoneH + safezoneY;
			w = 0.0412499 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_Category_items";
		};
		class RscButton_1605: RscButtonArsenal
		{
			idc = 1605;
			text = "\a3\ui_f\data\gui\Rsc\RscDisplayArsenal\Vest_ca.paa";
			action = "['gear'] call a3cs_fnc_boxEditorGUI_buttonChangeCategory;";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.466985 * safezoneH + safezoneY;
			w = 0.0412499 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_Category_gear";
		};
		class RscButton_1606: RscButton
		{
			idc = 1606;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Close";
			action = "closeDialog 0";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.775113 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_CloseDesc";
		};
		class RscButton_1607: RscButton
		{
			idc = 1607;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Copycode";
			action = "0 call a3cs_fnc_boxEditorGUI_buttonCopyCode;";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.709085 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_CopycodeDesc";
		};
		class RscButton_1608: RscButton
		{
			idc = 1608;
			text = "$STR_A3CS_MM_EditBoxGUI_FNC_Generate";
			action = "0 call a3cs_fnc_boxEditorGUI_buttonGenCode;";
			x = 0.34531 * safezoneW + safezoneX;
			y = 0.775113 * safezoneH + safezoneY;
			w = 0.309374 * safezoneW;
			h = 0.044018 * safezoneH;
			tooltip = "$STR_A3CS_MM_EditBoxGUI_FNC_GenerateDesc";
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			colorBackground[] = { 0, 0, 0, 0.5 };
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.711287 * safezoneH + safezoneY;
			w = 0.309375 * safezoneW;
			h = 0.0418171 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.345312 * safezoneW + safezoneX;
			y = 0.268905 * safezoneH + safezoneY;
			w = 0.124781 * safezoneW;
			h = 0.418171 * safezoneH;
		};
		class RscListbox_1501: RscListbox
		{
			idc = 1501;
			x = 0.531968 * safezoneW + safezoneX;
			y = 0.268905 * safezoneH + safezoneY;
			w = 0.122718 * safezoneW;
			h = 0.418171 * safezoneH;
			onLBSelChanged = "0 call a3cs_fnc_boxEditorGUI_clickBoxElement";
		};
		class RscListbox_1502: RscListbox
		{
			idc = 1502;
			style = "0x00 + 0x10";
			x = 0.665 * safezoneW + safezoneX;
			y = 0.312923 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.376353 * safezoneH;
			onLBSelChanged = "0 call a3cs_fnc_boxEditorGUI_clickItemCount";
		};
	};
};

//rozmowa z AI

class a3cs_mm_dialogQueryGUI {
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class RscPicture_1200: RscPicture
		{
			idc = -1;
			text = "#(argb,8,8,3)color(0,0,0,0.8)";
			x = 0.262812 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.474375 * safezoneW;
			h = 0.55 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.319688 * safezoneW;
			h = 0.198 * safezoneH;
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = PATHTOF(data\default_avatar.jpg);
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.139219 * safezoneW;
			h = 0.242 * safezoneH;
		};
		class RscListbox_1501: RscText
		{
			style = 0x10; //ST_MULTI
			idc = 1501;
			x = 0.267969 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.464062 * safezoneW;
			h = 0.275 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = -1;
			x = 0.412344 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.033 * safezoneH;
			text = "Zadaj pytanie";
			action = QUOTE(0 spawn DFUNC(dialogQuery));
		};
		class RscButton_1602: RscButton
		{
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
