#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(coverMap)
/*
 * Author: Bohemia Interavtive, SzwedzikPL
 * coverMap module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || !(_mode isEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

  if (CBA_missionTime < 30) then {
    sleep 1;
  };

LOG_1('Starting execution of EXEC_MODULE_NAME (isActivated: %1).',str _isActivated);

if (_isActivated) then {
    private _mode = _logic getVariable [QGVAR(mode), 0];
    private _planesClassesData = [];
    private _planesCount = 0;
    private _randomWeighted = false;
    private _posStart = [];
    private _posEnd = [];
    private _classListMode = _logic getVariable [QGVAR(classListMode), 0];
    private _classList = call compile (_logic getVariable [QGVAR(classList), "[]"]);
    private _delay = _logic getVariable [QGVAR(timeInterval), 0];
    private _speed = _logic getVariable [QGVAR(flightSpeed), 0];

    // Exit if classList is not array or array is empty
    if (!(_classList isEqualType []) || (count _classList) isEqualTo 0) exitWith {
      WARNING_2('EXEC_MODULE_NAME - classList is not array or array is empty (classList: %1).',str _classList);
    };

    // Calculate group units classes
    if (_classListMode isEqualTo 0) then {
      // Random classList mode
      _randomWeighted = true;
      _planesCount = (_logic getVariable [QGVAR(planesCount), 0]) max 1;
      {_planesClassesData append _x;} forEach _classList;
    } else {
      // Strict classList mode
      {
        private _className = _x #0;
        private _count = (_x #1) max 1;

        for "_i" from 1 to _count do {
          _planesClassesData pushBack _className;
        };
      } forEach _classList;
      _planesCount = count _planesClassesData;
    };

    if ((_planesCount isEqualTo 0) || (_planesClassesData isEqualTo [])) exitWith {
      ERROR_2('Execution of EXEC_MODULE_NAME aborted - no units or classes data (unitCount: %1 unitClassesData: %2).',str _planesCount,str _planesClassesData);
    };

    private _direction = _logic getVariable [QGVAR(flybyDirection), 0];

    if (_mode isEqualTo 0) then {
        private _posStart = getPosASL _logic;
        private _posEnd = getMarkerPos (_logic getVariable [QGVAR(endPosAmb), 0]);
      } else {
        private _distance = _logic getVariable [QGVAR(distanceTo), 2000];
        private _height = _logic getVariable [QGVAR(height), 250];
        private _direction = _direction * 45;
        _posStart = _logic getPos [_distance, _direction];
        _posEnd   = _logic getPos [_distance, _direction - 180];
        _posStart set [2, _height];
      };

    private _dir = _posStart getDir _posEnd;
  {
    if (_randomWeighted) then {_x = selectRandomWeighted _planesClassesData};

    private _plane = createVehicle [_x, [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _plane engineOn true;
    _plane setDir _dir;
    _plane addEventHandler ["Killed", {
  	params ["_plane"];
    detach _plane;
    }];
    
    //Iron Front planes seems not to animate gear when created with "FLY"
    private _dummy = createAgent ["VirtualMan_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _dummy moveInDriver _plane;
    _dummy action ["LandGearUp", _plane];
    deleteVehicle _dummy;

    //Not perfect but way more stable than AI
    private _proxy = createVehicle ["test_EmptyObjectForBubbles", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _proxy hideObjectGlobal true;
    _proxy setDir _dir;
    _proxy setPosASL _posStart;
    _plane attachTo [_proxy, [0,0,-2]];
    _proxy setVelocity [_speed*(sin(_dir)), _speed*(cos(_dir)) ,0];

    [{
        params ["_plane","_posEnd"];
        (_plane distance2D _posEnd) < 300 || (attachedTo _plane) isEqualTo ""
    }, {
        params ["_plane","_proxy"];
        if (attachedTo _plane isEqualTo "") then {
          deleteVehicle _proxy;
          _plane enableDynamicSimulation true;
          addToRemainsCollector [_plane];
        } else {
          {deleteVehicle _x} forEach _plane + _proxy
        };
    }, [_plane,_posEnd,_proxy]] call CBA_fnc_waitUntilAndExecute;

    sleep (10 + _delay);
  } forEach _planesClassesData;
};

LOG('Execution of EXEC_MODULE_NAME finished.');
