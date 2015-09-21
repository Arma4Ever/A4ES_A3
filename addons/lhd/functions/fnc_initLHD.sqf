/*
 * Author: SzwedzikPL
 *
 * Create A3MP LHD
 */
#include "script_component.hpp"

params ["_object"];

_LHDdir = getDir _object;
_LHDpos = getPos _object;

/*
	Land_LHD_3
	statement = "this animate ["dveremale1", 1]";
	statement = "this animate ["dveremale", 1]";

	Land_LHD_4
	statement = "this animate ["dveremale", 1]";

	Land_LHD_house_2
	statement = "this animate ["dveremale", 1]";
	statement = "this animate ["dverevelkeL", 1];this animate ["dverevelkeR", 1]";
*/


_LHDparts = [];

_parts = [
    ["Land_LHD_house_1", []],
    ["Land_LHD_house_2", ["dveremale", "dverevelkeL", "dverevelkeR"]],
    ["Land_LHD_elev_R", []],
    ["Land_LHD_1", []],
    ["Land_LHD_2", []],
    ["Land_LHD_3", ["dveremale1", "dveremale"]],
    ["Land_LHD_4", ["dveremale"]],
    ["Land_LHD_5", []],
    ["Land_LHD_6", []]
];

{
	_x params ["_class", "_doors"];
    _LHDpart = createVehicle [_class, _LHDpos, [], 0, "CAN_COLLIDE"];
    _LHDpart setDir _LHDdir;
    _LHDpart setPos _LHDpos;
    _LHDparts pushback _LHDpart;

    {_LHDpart animate [_x, 1];nil} count _doors;

    if(_class == "Land_LHD_house_2") then {
    	_topSign = createVehicle ["SignAd_SponsorS_ARMEX_F", _LHDpos, [], 0, "CAN_COLLIDE"];
    	_topSign attachTo [_LHDpart, [11.9,-17.9,-0.2]];
    	_topSign setDir 90;
    	_topSign setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];

    	_bottomSign = createVehicle ["SignAd_SponsorS_ARMEX_F", _LHDpos, [], 0, "CAN_COLLIDE"];
    	_bottomSign attachTo [_LHDpart, [-4.88,-9.435,-7]];
    	_bottomSign setDir 180;
    	_bottomSign setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];
    };

    nil
} count _parts;

_object setVariable ["a3cs_lhd_parts", _LHDparts];