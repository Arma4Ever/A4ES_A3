#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds module to flag activator system
 */

params ["_logic", "_flags", "_activation"];
TRACE_3("addModuleToFlagActivator",_logic,_flags,_activation);

if (isNull _logic) exitWith {
  TRACE_2("addModuleToFlagActivator abort, logic is null",_flags,_activation);
};

if (_flags isEqualTo []) exitWith {
  TRACE_2("addModuleToFlagActivator abort, empty flags",_logic,_activation);
};

private _flagsCondition = _flags call FUNC(getLogicFlagsCondition);
_flagsCondition params ["_condition", "_usedFlags"];
if (_condition isEqualTo "" || {_usedFlags isEqualTo []}) exitWith {
  TRACE_4("addModuleToFlagActivator abort, empty condition",_logic,_flags,_condition,_usedFlags);
};

private _moduleActivatorFlags = GVAR(moduleActivatorFlags);
private _activatorEntry = [_logic, compile _condition, _activation];

{
  private _flagActivators = _moduleActivatorFlags getOrDefault [_x, []];
  _flagActivators pushBack _activatorEntry;
  _moduleActivatorFlags set [_x, _flagActivators];
} forEach _usedFlags;

private _activatorModulesFlags = GVAR(activatorModulesFlags);
private _logicId = _logic call BIS_fnc_netId;
_activatorModulesFlags set [_logicId, _usedFlags];
