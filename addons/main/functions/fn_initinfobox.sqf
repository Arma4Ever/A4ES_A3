/*
	Author: SzwedzikPL

	Description:
	Init A3C infobox
*/
if (missionNamespace getVariable ["A3C_infoBoxInited", false]) exitWith {};
A3C_infoBoxInited = true;

["mods"] call a3c_infobox_fnc_infobox;