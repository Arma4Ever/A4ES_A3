#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows message based on module attributes
 */

params ["_logic", ["_showMessage", false], ["_actionPlayer", objNull]];
TRACE_3("moduleShowMessage",_logic,_showMessage,_actionPlayer);

// Read module showMessage attribute, _showMessage is used as default because
// showMessage module does not have this attribute
_showMessage = _logic getVariable [QGVAR(showMessage), _showMessage];

if (!_showMessage) exitWith {
  TRACE_1("moduleShowMessage - abort, showing message disabled",_logic);
};

private _type = _logic getVariable [QGVAR(messageType), 0];
private _args = [];

// hint & typed text (top/bottom)
if (_type in [0, 1, 2]) then {
  _args = [
    _logic getVariable [QGVAR(messageText), ""],
    _logic getVariable [QGVAR(messagePlaySound), false]
  ];
};

// Subtitle
if (_type isEqualTo 3) then {
  _args = [
    _logic getVariable [QGVAR(messageName), ""],
    _logic getVariable [QGVAR(messageText), ""]
  ];
};

// Confirm box
if (_type isEqualTo 4) then {
  _args = [
    _logic getVariable [QGVAR(messageTitle), ""],
    _logic getVariable [QGVAR(messageText), ""]
  ];
};

private _messageTarget = _logic getVariable [QGVAR(messageTarget), 0];

// All players
if (_messageTarget isEqualTo 0) exitWith {
  [QGVAR(showMessage), [_type, _args]] call CBA_fnc_globalEvent;
};

private _targets = playableUnits + switchableUnits;

// Players in logic area
if (_messageTarget isEqualTo 1) then {
  private _area = _logic call EFUNC(common,getLogicArea);
  _targets = _targets select {
    (_x inArea _area) ||
    {(side (group _x)) isEqualTo sideLogic}
  };
};

// Player from action
if (_messageTarget isEqualTo 2) then {
  if (isNull _actionPlayer) exitWith {_targets = [];};
  _targets = _targets select {
    (_x isEqualTo _actionPlayer) ||
    {(side (group _x)) isEqualTo sideLogic}
  };
};

[QGVAR(showMessage), [_type, _args], _targets] call CBA_fnc_targetEvent;
