/*
    Author: SzwedzikPL
    Init A3C infobox
*/
if (missionNamespace getVariable ["A3C_infoBoxInited", false]) exitWith {};
missionNamespace setVariable ["A3C_infoBoxInited", true];

["log"] call a3c_infobox_fnc_infobox;
["mods"] call a3c_infobox_fnc_infobox;
