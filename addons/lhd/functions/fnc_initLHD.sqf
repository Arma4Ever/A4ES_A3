/*
 * Author: SzwedzikPL
 *
 * Create A3MP LHD on server
 */
#include "script_component.hpp"

params ["_object"];

if(!isServer) exitWith {};
if(!isClass (configFile >> "CfgVehicles" >> "Land_LHD_1")) exitWith {systemChat (localize "STR_A3CS_LHD_error_noa3mp");};

_LHDdir = getDir _object;
_LHDpos = getPos _object;

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
        //init lights on all clients
        private "_jipid";
        _jipid = [_LHDpart] remoteExec [QFUNC(initLights), 0, true];

        //gen floor on level 0
        {
            for "_i" from 1 to 24 do {
                private ["_floorPos", "_floor"];
                _floorPos = AGLToASL (_LHDpart modelToWorld [_x, (144.8 - (10*(_i-1))), -0.94]); //-0.91 - debug h
                _floor = createVehicle ["Land_Podesta_10", _floorPos, [], 0, "CAN_COLLIDE"];
                _floor setPosASL _floorPos;
                _floor setDir (getDir _LHDpart);
            };
        } foreach [-7, 2, 12, 18.6];

        //gen floor on level -1
        {
            for "_i" from 1 to 5 do {
                private ["_floorPos", "_floor"];
                _floorPos = AGLToASL (_LHDpart modelToWorld [_x, (35.5 - (10*(_i-1))), -7.69]); //-7.66 - debug h
                _floor = createVehicle ["Land_Podesta_10", _floorPos, [], 0, "CAN_COLLIDE"];
                _floor setPosASL _floorPos;
                _floor setDir (getDir _LHDpart);
            };
        } foreach [-4.5, 4, 11.5];

        /*
        //Enter - top>bottom
        private "_topSign";
    	_topSign = createVehicle ["SignAd_SponsorS_ARMEX_F", _LHDpos, [], 0, "CAN_COLLIDE"];
    	_topSign attachTo [_LHDpart, [11.9,-17.9,-0.2]];
    	_topSign setDir 90;
    	_topSign setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];

        //Enter bottom>top
        private "_bottomSign";
    	_bottomSign = createVehicle ["SignAd_SponsorS_ARMEX_F", _LHDpos, [], 0, "CAN_COLLIDE"];
    	_bottomSign attachTo [_LHDpart, [-4.88,-9.435,-7]];
    	_bottomSign setDir 180;
    	_bottomSign setObjectTextureGlobal [0, "#(rgb,8,8,3)color(0,0,0,0)"];

        //Enter bottom>ship1
        private "_bottomSignShip";

        //Enter botom>ship2
        private "_bottomSignShip2";

        //Ship1
        private ["_attachPoint", "_ship", "_shipRopes"];
        _attachPoint = createVehicle ["Land_Flush_Light_green_F", _LHDpos, [], 0, "CAN_COLLIDE"];
        _attachPoint setPosASL AGLToASL (_LHDpart modelToWorld [24,-69,-3]);
        _attachPoint setDir _LHDdir;

        _shipFloorPos = AGLToASL (_LHDpart modelToWorld [16.12, -70, -9.85]);
        _shipFloor = createVehicle ["Land_Podesta_10", _shipFloorPos, [], 0, "CAN_COLLIDE"];
        _shipFloor setPosASL _shipFloorPos;
        _shipFloor setDir (getDir _LHDpart);

        _ship = createVehicle ["B_Boat_Armed_01_minigun_F", (_attachPoint modelToworld [0,0,-5]), [], 0, "CAN_COLLIDE"];
        _ship setPos (_attachPoint modelToworld [0,0,-5]);
        _ship setDir _LHDdir;
        _shipRopes = [];

        {
            private "_rope";
            _rope = ropeCreate [_ship, _x, _attachPoint, [0,0,0], 5];
            _shipRopes pushBack _rope;
        } foreach [[-1.2,-3,-1.5],[1.2,-3,-1.5],[-1.2,3,-1.5],[1.2,3,-1.5]];
        _ship setVariable [QGVAR(shipRopes), _shipRopes];

        _attachPoint setPosASL AGLToASL (_LHDpart modelToWorld [25.5,-69,-3]);

        [_ship, _attachPoint] spawn {sleep 0.1;params ["_ship", "_attachPoint"];_ship attachTo [_attachPoint, [0,0,-5]];};

        _ship addAction ["Odetnij", {
            params ["_ship", "_player", "_id"];
            _ship removeAction _id;
            {ropeDestroy _x;} foreach (_ship getVariable [QGVAR(shipRopes), []]);
            detach _ship;
        }];

        boat = _ship;

        //Ship2
        */
    };


    nil
} count _parts;

_object setVariable [QGVAR(parts), _LHDparts];
