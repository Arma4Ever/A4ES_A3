#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * Ambient flyby function
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
if (isNull _logic || !(local _logic) || !_isActivated || _isCuratorPlaced) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

private _mode = _logic getVariable [QGVAR(mode), 0];
private _planesClassesData = [];
private _planesCount = 0;
private _randomWeighted = false;
private _posStart = [];
private _posEnd = [];
private _classListMode = _logic getVariable [QGVAR(classListMode), 0];
private _classList = parseSimpleArray (_logic getVariable [QGVAR(classList), "[]"]);
private _speed = _logic getVariable [QGVAR(flightSpeed), 20];
private _shape = _logic getVariable [QGVAR(flybyShape), 1];

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
private _planeMaxIndex = _planesCount - 1;

if (_mode isEqualTo 0) then {
  _posStart = getPosASL _logic;
  _posEnd = getMarkerPos (_logic getVariable [QGVAR(endPosAmb), ""]);
} else {
  private _distance = _logic getVariable [QGVAR(distanceTo), 2000];
  private _height = _logic getVariable [QGVAR(height), 50];
  private _direction = _direction * 45;
  _posStart = _logic getPos [_distance, _direction];
  _posEnd   = _logic getPos [_distance, _direction - 180];
  _posStart set [2, _height];
};

private _dir = _posStart getDir _posEnd;

// Not perfect but way more stable than AI
private _proxy = createVehicle ["test_EmptyObjectForBubbles", [0, 0, 0], [], 0, "CAN_COLLIDE"];
_proxy hideObjectGlobal true;
_proxy setDir _dir;
_proxy setPosASL _posStart;
_proxy setVelocity [_speed*(sin(_dir)), _speed*(cos(_dir)) ,0];

for "_planeIndex" from 0 to _planeMaxIndex do {
  private _planeClass = if (_randomWeighted) then {
    // Get random class from classlist
    selectRandomWeighted _planesClassesData
  } else {
    _planesClassesData select _planeIndex
  };

  private _plane = createVehicle [_planeClass, [0, 0, 0], [], 0, "FLY"];
  _plane engineOn true;
  _plane setDir _dir;
  _plane addEventHandler ["Killed", {
    params ["_plane"];
    detach _plane;
  }];

  // Make sure landing gear is hidden
  private _dummy = createAgent ["VirtualMan_F", [0, 0, 0], [], 0, "CAN_COLLIDE"];
  _dummy moveInDriver _plane;
  _dummy action ["LandGearUp", _plane];
  deleteVehicle _dummy;

  private _attachPosNew = switch (_shape) do {
    // diament
    case 0: {
      switch (_planeIndex) do {
        case 0: {[0,0,0]};
        case 1: {_proxy worldToModel (_proxy getRelPos [35, 135])};
        case 2: {_proxy worldToModel (_proxy getRelPos [35, 225])};
        case 3: {_proxy worldToModel (_proxy getRelPos [45, 180])};
        case 4: {_proxy worldToModel (_proxy getRelPos [80, 180])};
        default {_proxy worldToModel (_proxy getRelPos [_planeIndex*25, 180])};
      };
    };
    // klin
    case 1: {
      switch (_planeIndex) do {
        case 0: {[0,0,0]};
        case 1: {_proxy worldToModel (_proxy getRelPos [35, 135])};
        case 2: {_proxy worldToModel (_proxy getRelPos [35, 225])};
        case 3: {_proxy worldToModel (_proxy getRelPos [65, 135])};
        case 4: {_proxy worldToModel (_proxy getRelPos [65, 225])};
        default {_proxy worldToModel (_proxy getRelPos [_planeIndex*25, 180])};
      };
    };
    // eszeleon
    default {
      switch (_planeIndex) do {
        case 0: {[0,0,0]};
        case 1: {_proxy worldToModel (_proxy getRelPos [35, 135])};
        case 2: {_proxy worldToModel (_proxy getRelPos [65, 135])};
        case 3: {_proxy worldToModel (_proxy getRelPos [95, 135])};
        case 4: {_proxy worldToModel (_proxy getRelPos [125, 135])};
        default {_proxy worldToModel (_proxy getRelPos [_planeIndex*35, 135])};
      };
    };
  };

  _attachPosNew set [2, random [-1.5,0,1.5]];
  _plane attachTo [_proxy, _attachPosNew];

  [{
    params ["_plane", "_posEnd"];
    (
      ((_plane distance2D _posEnd) < 300) ||
      {(attachedTo _plane) isEqualTo ""}
    )
  }, {
    params ["_plane","","_proxy"];
    if (attachedTo _plane isEqualTo "") then {
      deleteVehicle _proxy;
      _plane enableDynamicSimulation true;
      addToRemainsCollector [_plane];
    } else {
      {deleteVehicle _x} forEach [_plane, _proxy];
    };
  }, [_plane, _posEnd, _proxy]] call CBA_fnc_waitUntilAndExecute;
};


LOG('Execution of EXEC_MODULE_NAME finished.');
