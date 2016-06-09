/*
 * Author: SzwedzikPL
 * Create A3MP LHD on server or in eden
 */
#include "script_component.hpp"

params ["_LHDObject"];

if (!isServer) exitWith {};
if (!isClass (configFile >> "CfgVehicles" >> "Land_LHD_1")) exitWith {systemChat (localize LSTRING(NoA3MP));};

private _LHDDir = getDir _LHDObject;
private _LHDPosition = getPosASL _LHDObject;
private _LHDParts = [];

private _LHDArray = [
    ["Land_LHD_house_1", [-2.64648, 17.9055, 0], []],
    ["Land_LHD_house_2", [-5.85498, -22.894, 0], ["dveremale", "dverevelkeL", "dverevelkeR"]],
    ["Land_LHD_elev_R", [3.09619, -92.0864, 0], []],
    ["Land_LHD_1", [-0.00537109, 108.5, 0], []],
    ["Land_LHD_2", [-0.604492, 47.0452, 0], []],
    ["Land_LHD_3", [0.623047, 24.0347, 0], ["dveremale1", "dveremale"]],
    ["Land_LHD_4", [-1.44629, -20.9797, 0], ["dveremale"]],
    ["Land_LHD_5", [-1.83203, -65.94, 0], []],
    ["Land_LHD_6", [-1.44141, -107.012, 0], []]
];

{
    _x params ["_class", "_offset" ,"_doors"];
    private _LHDPart = createVehicle [_class, _LHDPosition, [], 0, "CAN_COLLIDE"];
    _LHDPart setDir _LHDDir;
    _LHDPart setPosASL AGLToASL (_LHDObject modelToWorld _offset);
    _LHDParts pushback _LHDPart;

    {_LHDPart animate [_x, 1];} forEach _doors;

    if (_class == "Land_LHD_house_2") then {
        //init lights on all clients
        private "_jipid";
        _jipid = [_LHDpart] remoteExec [QFUNC(initLights), 0, true];

        if (!is3DEN) then {
            //gen floor on level 0
            {
                private _floorOffset = _x;
                private _floorIndex = 0;
                for "_floorIndex" from 1 to 24 do {
                    private _floorPos = AGLToASL (_LHDpart modelToWorld [_floorOffset, (144.8 - (10*(_floorIndex-1))), -0.94]); //-0.91 - debug h
                    private _floor = createVehicle ["Land_Podesta_10", _floorPos, [], 0, "CAN_COLLIDE"];
                    _floor setPosASL _floorPos;
                    _floor setDir (getDir _LHDpart);
                };
            } foreach [-7, 2, 12, 18.6];

            //gen floor on level -1
            {
                private _floorOffset = _x;
                private _floorIndex = 0;
                for "_floorIndex" from 1 to 5 do {
                    private _floorPos = AGLToASL (_LHDpart modelToWorld [_floorOffset, (35.5 - (10*(_floorIndex-1))), -7.69]); //-7.66 - debug h
                    private _floor = createVehicle ["Land_Podesta_10", _floorPos, [], 0, "CAN_COLLIDE"];
                    _floor setPosASL _floorPos;
                    _floor setDir (getDir _LHDpart);
                };
            } foreach [-4.5, 4, 11.5];
        };
    };
} forEach _LHDArray;

_LHDObject setVariable [QGVAR(parts), _LHDParts];

//3DEN support
if (is3DEN) then {
    _LHDObject removeAllEventHandlers "AttributesChanged3DEN";
    _LHDObject removeAllEventHandlers "RegisteredToWorld3DEN";
    _LHDObject removeAllEventHandlers "ConnectionChanged3DEN";
    _LHDObject removeAllEventHandlers "UnregisteredFromWorld3DEN";
    private _onChangeFunction = {
        params ["_object"];
        private _LHDParts = _object getVariable [QGVAR(parts), []];
        private _nullCount = count (_LHDParts select {isNull _x});
        if (count _LHDParts == 0 || _nullCount > 0) exitWith {_object call FUNC(initLHD);};

        private _LHDPartsArray = [
            "Land_LHD_house_1","Land_LHD_house_2","Land_LHD_elev_R","Land_LHD_1",
            "Land_LHD_2","Land_LHD_3","Land_LHD_4","Land_LHD_5","Land_LHD_6"
        ];
        private _LHDOffsetsArray = [
            [-2.64648, 17.9055, 0],[-5.85498, -22.894, 0],[3.09619, -92.0864, 0],
            [-0.00537109, 108.5, 0],[-0.604492, 47.0452, 0],[0.623047, 24.0347, 0],
            [-1.44629, -20.9797, 0],[-1.83203, -65.94, 0],[-1.44141, -107.012, 0]
        ];
        private _LHDDir = getDir _object;
        {
            private _offset = _LHDOffsetsArray select (_LHDPartsArray find (typeof _x));
            _x setPosASL AGLToASL (_object modelToWorld _offset);
            _x setDir _LHDDir;
        } forEach _LHDParts;
    };
    _LHDObject addEventHandler ["AttributesChanged3DEN", _onChangeFunction];
    _LHDObject addEventHandler ["RegisteredToWorld3DEN", _onChangeFunction];
    _LHDObject addEventHandler ["ConnectionChanged3DEN", _onChangeFunction];
    _LHDObject addEventHandler ["UnregisteredFromWorld3DEN", {
        params ["_object"];
        private _LHDParts = _object getVariable [QGVAR(parts), []];
        {deleteVehicle _x} forEach _LHDParts;
    }];
};
