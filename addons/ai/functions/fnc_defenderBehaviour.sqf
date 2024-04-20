#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Enabled defender behaviour (peeking from behind cover) for given unit
 */
params ["_unit"];
TRACE_1("defenderBehaviour",_unit);

if (
  !(alive _unit) ||
  {!(_unit isKindOf "CAManBase")} ||
  {_unit in playableUnits} ||
  {is3DEN}
) exitWith {};

private _mode = _unit getVariable [QGVAR(defenderBehaviour), 0];
if (_mode == 0) exitWith {};

if !(local _unit) exitWith {
  [QGVAR(defenderBehaviour), _unit, [_unit]] call CBA_fnc_targetEvent;
};

_unit disableAI "PATH";
_unit disableAI "FSM";
_unit setUnitPos "DOWN";

if !(_unit getVariable ["lambs_danger_disableAI", false]) then {
  _unit setVariable ["lambs_danger_disableAI", true, true];
};

private _group = group _unit;
if (
  (leader _group) == _unit &&
  {!(_group getVariable ["lambs_danger_disableGroupAI", false])}
) then {
  _group setVariable ["lambs_danger_disableGroupAI", true, true];
};

if !(_unit getVariable [QGVAR(defenderInited), false]) then {
  ["a4es_common_switchMove", [_unit, "amovppnemstpsraswrfldnon"]] call CBA_fnc_globalEvent;
  _unit setVariable [QGVAR(defenderInited), true, true];
};

// Local EH
private _localEH = _unit getVariable [QGVAR(defender_localEH), -1];
if (_localEH == -1) then {
  _localEH = _unit addEventHandler ["Local", {
    params ["_unit", "_isLocal"];
    TRACE_2("defenderBehaviour localEH",_unit,_isLocal);

    if (_isLocal) then {
      _unit call FUNC(defenderBehaviour);
    } else {
      _unit setVariable [QGVAR(defenderEnabled), false];
      [QGVAR(defenderBehaviour), _unit, [_unit]] call CBA_fnc_targetEvent;
    };
  }];
  _unit setVariable [QGVAR(defender_localEH), _localEH];
};

// Suppressed EH
private _supEH = _unit getVariable [QGVAR(suppressedEH), -1];
if (_supEH == -1) then {
  _supEH = _unit addEventHandler ["Suppressed", {
    params ["_unit"];
    if !(local _unit) exitWith {};
    TRACE_1("defenderBehaviour Suppressed",_unit);
    _unit setVariable [QGVAR(lastSuppress), CBA_missionTime];
    _unit setUnitPos "DOWN";
  }];
  _unit setVariable [QGVAR(suppressedEH), _supEH];
};

// Exit if defender already enabled
if (_unit getVariable [QGVAR(defenderEnabled), false]) exitWith {};
_unit setVariable [QGVAR(defenderEnabled), true];

// Start behaviour loop
_unit spawn FUNC(defenderBehaviourLoop);
