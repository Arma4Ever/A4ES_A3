//class RscDisplayInventory

class RscText;
class RscPicture;
class RscListBox;

class GVAR(unitGear) {
	idd = -1;
	enableSimulation = 1;

	class controls {
		class Background: RscText {
			idc = 1241;
			x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "23 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorBackground[] = {0.050000001, 0.050000001, 0.050000001, 0.69999999};
		};
		class ListBackground: RscPicture {
			colorText[] = {1, 1, 1, 0.1};
			idc = 1242;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "14 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "21.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class Tab: RscText {
			idc = 1002;
			color[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 1};
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "14 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
		class List: RscListBox {
			idc = 1003;
			sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			sizeEx2 = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			rowHeight = "2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
			colorText[] = {1, 1, 1, 1};
			colorBackground[] = {0, 0, 0, 0};
			itemBackground[] = {1, 1, 1, 0.1};
			itemSpacing = 0.001;
			x = "1.5 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX + (safezoneW - ((safezoneW / safezoneH) min 1.2))/2)";
			y = "2.6 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2)";
			w = "14 * (((safezoneW / safezoneH) min 1.2) / 40)";
			h = "21.4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		};
	};
};