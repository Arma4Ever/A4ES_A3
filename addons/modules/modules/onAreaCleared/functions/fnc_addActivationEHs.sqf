#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds event handlers for onAreaCleared module activation
 */

params ["_logic"];
TRACE_1("addActivationEHs",_logic);

if ((_logic getVariable [QGVAR(activationEHs), []]) isNotEqualTo []) exitWith {
  TRACE_1("addActivationEHs - adding EHs aborted, already added",_logic);
};

// Save activation condition for checks in moduleExec
private _condition = compile (_logic call FUNC(onAreaCleared_getCondition));
_logic setVariable [QGVAR(activationCond), _condition];

// Primary module activator, react on kills, check is area cleared
private _killedEH = addMissionEventHandler [
  "EntityKilled",
  {_thisArgs call FUNC(onAreaCleared_moduleExec)},
  [_logic]
];

// Backup module activator, check every 10s is area clared (in case units move outside area without kills)
// TODO: Consider removing this PFH
private _actPFH = [{_this call FUNC(onAreaCleared_moduleExec)}, 10, _logic] call CBA_fnc_addPerFrameHandler;

// Save EH ids for post-activation removal
_logic setVariable [QGVAR(activationEHs), [_killedEH, _actPFH]];

TRACE_3("Added module activation event handlers",_logic,_killedEH,_actPFH);

// Activation EHs are added with delay so we can check now is area cleared
_logic call FUNC(onAreaCleared_moduleExec);
