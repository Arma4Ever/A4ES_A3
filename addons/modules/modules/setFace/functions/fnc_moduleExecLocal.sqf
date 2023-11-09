#include "script_component.hpp"
/*
 * Author: Krzyciu
 * setFace module local exec function
 */

params ["_origin"];

LOG('Starting execution of EXEC_MODULE_NAME local exec function.');

private _faces = [];
hint "xd";
switch (_origin) do {
	case 0: {
		// White
		_faces = [
            "LivonianHead_1",
            "LivonianHead_2",
            "LivonianHead_3",
            "LivonianHead_4",
            "LivonianHead_5",
            "LivonianHead_6",
            "LivonianHead_7",
            "LivonianHead_8",
            "LivonianHead_9",
            "LivonianHead_10", 
            "RussianHead_1",
            "RussianHead_2",
            "RussianHead_3",
            "RussianHead_4",
            "RussianHead_5",
			"WhiteHead_01",
            "WhiteHead_02",
            "WhiteHead_03",
            "WhiteHead_04",
            "WhiteHead_05",
            "WhiteHead_06",
            "WhiteHead_07",
            "WhiteHead_08",
            "WhiteHead_09",
            "WhiteHead_10", 
            "WhiteHead_11",
            "WhiteHead_12",
            "WhiteHead_13",
            "WhiteHead_14",
            "WhiteHead_15",
            "WhiteHead_16",
            "WhiteHead_17",
            "WhiteHead_18",
            "WhiteHead_19",
            "WhiteHead_20",
            "WhiteHead_21",
            "WhiteHead_22",
            "WhiteHead_23",
            "WhiteHead_24",
            "WhiteHead_25",
            "WhiteHead_26",
            "WhiteHead_27",
            "WhiteHead_28",
            "WhiteHead_29",
            "WhiteHead_30",
            "WhiteHead_31",
            "WhiteHead_32",
			"Jay",
			"Ivan",
			"Pettka",
			"Dwarden",
			"Hladas"
        ];
	};
	// Black
	case 1: {
		_faces = [
			"AfricanHead_01",
			"AfricanHead_02",
			"AfricanHead_03",
            "TanoanHead_A3_01",
            "TanoanHead_A3_02",
            "TanoanHead_A3_03",
            "TanoanHead_A3_04",
            "TanoanHead_A3_05",
            "TanoanHead_A3_06",
            "TanoanHead_A3_07",
            "TanoanHead_A3_08",
            "TanoanBossHead"
        ];
	};
	// Asian
	case 2: {
		_faces = [
            "AsianHead_A3_01",   
            "AsianHead_A3_02",
            "AsianHead_A3_03",
            "AsianHead_A3_04",
            "AsianHead_A3_05",
            "AsianHead_A3_06",
            "AsianHead_A3_07",
        ];
	};
	// Arabic
	case 3: {
		_faces = [
            "PersianHead_A3_01",
            "PersianHead_A3_02",
            "PersianHead_A3_03",
            "GreekHead_A3_01",
            "GreekHead_A3_02",
            "GreekHead_A3_03",
            "GreekHead_A3_04",
            "GreekHead_A3_05",
            "GreekHead_A3_06",
            "GreekHead_A3_07", 
            "GreekHead_A3_08",
            "GreekHead_A3_09",
			"GreekHead_A3_11",
			"GreekHead_A3_12",
			"GreekHead_A3_13",
			"GreekHead_A3_14"
        ];
	};
	// Camo White
	case 4: {
		_faces = [
            "CamoHead_White_01_F",
            "CamoHead_White_02_F",
            "CamoHead_White_03_F",
            "CamoHead_White_04_F",
            "CamoHead_White_05_F",
            "CamoHead_White_06_F",
			"CamoHead_White_07_F",
            "CamoHead_White_08_F",
            "CamoHead_White_09_F",
            "CamoHead_White_10_F",
            "CamoHead_White_11_F",
            "CamoHead_White_12_F",
			"CamoHead_White_13_F",
            "CamoHead_White_14_F",
            "CamoHead_White_15_F",
            "CamoHead_White_16_F",
            "CamoHead_White_17_F",
            "CamoHead_White_18_F",
			"CamoHead_White_19_F",
            "CamoHead_White_20_F",
            "CamoHead_White_21_F",
            "WhiteHead_22_a",
            "WhiteHead_22_l",
            "WhiteHead_22_sa"
        ];
	};
	default {};
};

private _count = count _faces;

private _idx = round (ceil (((parseNumber getPlayerUID ace_player) random [_count, _count]) * 10000) random _count);
private _face = _faces select _idx;

[ace_player, _face] remoteExec ["setFace", 0, true];