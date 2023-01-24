#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * addDialogue module function
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
// Exit if module is null or placed by zeus (should not happen)
if (isNull _logic || _isCuratorPlaced) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

// Load logic params
private _id = _logic getVariable [QGVAR(id), ""];
private _title = _logic getVariable [QGVAR(title), "%1"];
private _initialMessage = _logic getVariable [QGVAR(initialMessage), ""];

private _initialMessageStart = _initialMessage select [0, 2];
if ((_initialMessageStart == "[""") || {_initialMessageStart == "['"}) then {
  _initialMessage = parseSimpleArray _initialMessage;
};

private _condition = {true};
private _rejectionMessage = [];
private _startClientEH = {};
private _startServerEH = {};
private _endClientEH = {};
private _endServerEH = {};
private _changeLogicFlag = [];

if (_logic getVariable [QGVAR(addCondition), false]) then {
  // Rejection message
  _rejectionMessage = _logic getVariable [QGVAR(rejectionMessage), ""];
  private _rejectionMessageStart = _initialMessage select [0, 2];
  if ((_rejectionMessageStart == "[""") || {_rejectionMessageStart == "['"}) then {
    _rejectionMessage = parseSimpleArray _rejectionMessage;
  };

  // Logic flag
  if (_conditionType == 1) then {
    _condition = (parseSimpleArray (_logic getVariable [QGVAR(conditionLogicFlags), "[]"])) call FUNC(getLogicFlagsCondition);
  };
  // Scripted
  if (_conditionType == 2) then {
    _condition = compile (_logic getVariable [QGVAR(conditionScript), "true"]);
  };
};

if (_logic getVariable [QGVAR(addStartClientHandler), false]) then {
  _startClientEH = compile (_logic getVariable [QGVAR(startClientHandler), ""]);
};

if (_logic getVariable [QGVAR(addStartServerHandler), false]) then {
  _startServerEH = compile (_logic getVariable [QGVAR(startServerHandler), ""]);
};

if (_logic getVariable [QGVAR(addEndClientHandler), false]) then {
  _endClientEH = compile (_logic getVariable [QGVAR(endClientHandler), ""]);
};

if (_logic getVariable [QGVAR(addEndServerHandler), false]) then {
  _endServerEH = compile (_logic getVariable [QGVAR(endServerHandler), ""]);
};

if (_logic getVariable [QGVAR(changeLogicFlagOnStart), false]) then {
  _changeLogicFlag = [
    _logic getVariable [QGVAR(changeLogicFlag), ""],
    [false, true] select (_logic getVariable [QGVAR(changeLogicFlagValue), 0])
  ];
};

// Add dialogue
[
  _title,
  _initialMessage,
  _condition,
  _rejectionMessage,
  [],
  _id,
  _startClientEH,
  _startServerEH,
  _endClientEH,
  _endServerEH,
  _changeLogicFlag
] call EFUNC(dialogues,addDialogue);

// Delete module
deleteVehicle _logic;

LOG('Execution of EXEC_MODULE_NAME finished.');
