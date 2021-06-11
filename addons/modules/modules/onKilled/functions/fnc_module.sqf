#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * onKilled module function
 */

params ["_mode", "_input"];
TRACE_2(QUOTE(EXEC_MODULE_NAME),_mode,_input);

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Get synced objects
private _objects = (synchronizedObjects _logic) select {
  !(_x isKindOf "EmptyDetector") && {!(_x isKindOf "Logic")}
};

private _objectsList = (_logic getVariable [QGVAR(objectsList), ""]) splitString ",";
{
  private _object = missionNamespace getVariable [trim _x, objNull];
  if !(isNull _object) then {
    _objects pushBackUnique _object;
  };
} forEach _objectsList;

// No valid objects
if (_objects isEqualTo []) exitWith {
  ERROR("Execution of EXEC_MODULE_NAME aborted, no valid objects");
};

// Save objects
_logic setVariable [QGVAR(handlerObjects), _objects];

private _logicVar = format [QGVAR(onKilled_%1), _logic call BIS_fnc_netId];
missionNamespace setVariable [_logicVar, _logic];

TRACE_2("onKilled - adding handler",_logicVar,_objects);

private _deletedHandler = compile format ["
  [{isNull _this}, {
    (missionNamespace getVariable ['%1', objNull]) call %2;
  }, _this # 0] call CBA_fnc_waitUntilAndExecute;
", _logicVar, QFUNC(onKilled_moduleExec)];

{
  private _handlers = _x getVariable [QGVAR(onKilledHandlers), []];
  _handlers pushBack _logic;
  _x setVariable [QGVAR(onKilledHandlers), _handlers];
  // React also to deleted eh, alive objNull = false
  _x addEventHandler ["deleted", _deletedHandler];
} forEach _objects;

// Add killed mission EH
_logic call FUNC(onKilled_addMissionEH);

LOG('Execution of EXEC_MODULE_NAME finished - handler added.');
