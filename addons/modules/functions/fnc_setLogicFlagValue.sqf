#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets logic flag value & checks flag module activator
 */

params ["_flag", "_value"];
TRACE_2("setLogicFlagValue",_flag,_value);

if !(_flag in GVAR(createdLogicFlags)) exitWith {
  TRACE_1("setLogicFlagValue abort, unknown flag",_flag);
  false
};

private _flagVar = format [QGVAR(%1), _flag];
private _currentValue = missionNamespace getVariable _flagVar;
if (isNil "_currentValue" || {_currentValue isEqualTo _value}) exitWith {
  TRACE_3("setLogicFlagValue abort, current flag value nil or not changed",_flag,_value,_currentValue);
  false
};

// Update flag value
missionNamespace setVariable [_flagVar, _value, true];

// Log flag value change in 3DEN preview
if (is3DENPreview) then {
  private _title = GVAR(logicFlagTitles) getOrDefault [_flag, ""];
  if (_title isNotEqualTo "") then {
    diag_log text format ["Zmieniam wartosc flagi logicznej '%1' na %2", _title, str _value];
  };
};

// Log change
["a4es_logicFlagChanged", [_flag, _value]] call CBA_fnc_serverEvent;

private _moduleActivatorFlags = GVAR(moduleActivatorFlags);
if !(_flag in _moduleActivatorFlags) exitWith {
  TRACE_1("flag activators check abort, no module waiting for this flag",_flag);
  true
};

// Check flag modules
private _thisFlagActivators = _moduleActivatorFlags get _flag;
private _thisFlagActivatorsChanged = false;
private _activatedModules = [];
private _conditionParams = missionNamespace;

private _remainingThisFlagAcivators = _thisFlagActivators select {
  _x params ["_logic", "_condition", "_activation"];

  // Remove null modules from activators
  if (isNull _logic) then {
    _thisFlagActivatorsChanged = true;
    continueWith false;
  };

  if (_conditionParams call _condition) then {
    _thisFlagActivatorsChanged = true;
    _activatedModules pushBackUnique _logic;
    // Exec module in next frame to not slow down this fnc
    // + module activation may delete logic, we need it for cleanup
    [_activation, _logic] call CBA_fnc_execNextFrame;
    false
  } else {
    true
  };
};

// Exit if no changes were made
if !(_thisFlagActivatorsChanged) exitWith {
  TRACE_1("flag activators checked, no changes",_flag);
  true
};

TRACE_3("flag activators checked, updating",_flag,_activatedModules,_remainingThisFlagAcivators);

// Update this flag activators
if (_remainingThisFlagAcivators isEqualTo []) then {
  _moduleActivatorFlags deleteAt _flag;
} else {
  _moduleActivatorFlags set [_flag, _remainingThisFlagAcivators];
};

// Exit if no moduless has been activated
if (_activatedModules isEqualTo []) exitWith {true};

// Get all activated modules flags
private _activatedModulesFlags = [];
private _activatorModulesFlags = GVAR(activatorModulesFlags);
{
  private _key = _x call BIS_fnc_netId;
  // Append modules flag
  _activatedModulesFlags append (_activatorModulesFlags get _key);
  // And delete
  _activatorModulesFlags deleteAt _key;
} forEach _activatedModules;

// Remove duplicates and this flag (already updated in _remainingThisFlagAcivators)
_activatedModulesFlags = _activatedModulesFlags arrayIntersect _activatedModulesFlags;
_activatedModulesFlags deleteAt (_activatedModulesFlags find _flag);

// Exit if activated modules used only this flag for activation
if (_activatedModulesFlags isEqualTo []) exitWith {true};

TRACE_3("removing activated modules flags activators",_flag,_activatedModules,_activatedModulesFlags);

// Update activated modules flags activators
{
  private _flagActivators = _moduleActivatorFlags get _x;
  private _remainingFlagAcivators = _flagActivators select {
    private _logic = (_x # 0);
    !(isNull _logic) && {!(_logic in _activatedModules)}
  };

  if (_remainingFlagAcivators isEqualTo []) then {
    _moduleActivatorFlags deleteAt _x;
  } else {
    _moduleActivatorFlags set [_x, _remainingFlagAcivators];
  };
} forEach _activatedModulesFlags;

true
