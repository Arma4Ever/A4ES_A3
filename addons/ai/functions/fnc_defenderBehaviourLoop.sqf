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
private _suppression = 0;
private _nextCheck = 0;

while {alive _unit} do {
  _suppression = 0 max (getSuppression _unit);
  _nextCheck = 1 + (random (3 + (_suppression * 20)));

  if (
    !(alive _unit) ||
    {!(local _unit)} ||
    {!(_unit getVariable [QGVAR(defenderEnabled), false])}
  ) exitWith {
    _unit setVariable [QGVAR(defenderEnabled), false];
  };

  sleep _nextCheck;

  if (((_unit getVariable [QGVAR(lastSuppress), 0]) + 2) < CBA_missionTime) then {
    _unit setUnitPos _maxPos;
    TRACE_2("defenderBehaviourLoop setUnitPos",_unit,_maxPos);
    _nextCheck = CBA_missionTime + 2 + (random 20);

    waitUntil {
      sleep 2 + (random 2);
      (CBA_missionTime > _nextCheck) || (((_unit getVariable [QGVAR(lastSuppress), 0]) + 2) > CBA_missionTime)
    };
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
