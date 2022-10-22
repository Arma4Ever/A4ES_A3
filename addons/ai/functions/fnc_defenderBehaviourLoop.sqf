#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Defender behaviour script loop
 */

params ["_unit"];
TRACE_1("defenderBehaviourLoop",_unit);

private _mode = _unit getVariable [QGVAR(defenderBehaviour), 0];
if (_mode == 0) exitWith {};

private _maxPos = ["UP", "MIDDLE"] select (_mode - 1);

while {alive _unit} do {
  sleep (2 + (random 12));

  if (
    !(alive _unit) ||
    {!(local _unit)} ||
    {!(_unit getVariable [QGVAR(defenderEnabled), false])}
  ) exitWith {
    _unit setVariable [QGVAR(defenderEnabled), false];
  };

  if (((_unit getVariable [QGVAR(lastSuppress), 0]) + 4) < CBA_missionTime) then {
    _unit setUnitPos _maxPos;
    TRACE_2("defenderBehaviourLoop setUnitPos",_unit,_maxPos);
    sleep (2 + (random 7));
  };

  if (
    !(alive _unit) ||
    {!(local _unit)} ||
    {!(_unit getVariable [QGVAR(defenderEnabled), false])}
  ) exitWith {
    _unit setVariable [QGVAR(defenderEnabled), false];
  };

  _unit setUnitPos "DOWN";
  TRACE_1("defenderBehaviourLoop setUnitPos DOWN",_unit);
};

TRACE_1("defenderBehaviourLoop endLoop",_unit);
_unit setVariable [QGVAR(defenderEnabled), false];
