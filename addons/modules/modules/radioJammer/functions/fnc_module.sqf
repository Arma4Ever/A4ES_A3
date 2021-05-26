#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * radioJammer module function
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
// Exit if module is null, not local, is deactivated or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG_1('Starting execution of EXEC_MODULE_NAME (isActivated: %1).',str _isActivated);

if (is3DENPreview) then {
  [_logic, _isActivated] call EFUNC(debug,updateModuleStatus);
};

private _jammersData = missionNamespace getVariable [QEGVAR(radio,radioJammers), []];
private _index = GVAR(radioJammerModules) find _logic;
private _jammersChanged = false;

// Exit if change not needed (should not happen)
if (
  (_isActivated && (_index isNotEqualTo -1)) ||
  {!_isActivated && (_index isEqualTo -1)}
) exitWith {};

if (_isActivated) then {
  // Get logic area
  private _logicArea = [getPos _logic];
  _logicArea append (_logic getVariable ["objectarea", []]);

  GVAR(radioJammerModules) pushBack _logic;
  _jammersData pushBack [
    _logicArea,
    _logic getVariable [QGVAR(sendingMultiplicator), 0.25],
    _logic getVariable [QGVAR(receivingMultiplicator), 0.25]
  ];
  _jammersChanged = true;
} else {
  GVAR(radioJammerModules) deleteAt _index;
  _jammersData deleteAt _index;
  _jammersChanged = true;
};

// Update radio jammers for radio addon globally
missionNamespace setVariable [QEGVAR(radio,radioJammers), _jammersData, true];
// Notify clients radio jammers changed
[QEGVAR(radio,jammersUpdated), 0] call CBA_fnc_globalEvent;

LOG('Execution of EXEC_MODULE_NAME finished.');

true
