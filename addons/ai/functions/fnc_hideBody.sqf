#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Hides body
 */

params ["_target", "_player"];
TRACE_2("hideBody",_target,_player);

if !([_target] call FUNC(canHideBody)) exitWith {};

[5, [_target, _player], {
  (_this # 0) params ["_target", "_player"];
  if (isNull _target) exitWith {};
  _target setVariable [QGVAR(hidingBody), true, true];
  // Reset animation instantly
  [_player, "", 2] call ACEFUNC(common,doAnimation);
  // Hide body by vanilla action
  _player action ["hideBody", _target];
  // Force delete body
  [{
    deleteVehicle _this;
  }, _target, 10] call CBA_fnc_waitAndExecute;
  [LLSTRING(hideBody_bodyHidden), 2] call ACEFUNC(common,displayTextStructured);
}, {
  (_this # 0) params ["_target", "_player"];
  // Reset animation
  [_player, "", 1] call ACEFUNC(common,doAnimation);
}, LLSTRING(hideBody_hidingBody), {true}] call ACEFUNC(common,progressBar);

// Play animation
[_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);
