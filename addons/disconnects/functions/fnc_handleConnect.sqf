#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handlers player connected event
 */

params ["_unit"];
TRACE_1("handleConnect",_unit);

private _lockedUnits = GVAR(lockedUnits);

// Exit if unit is not locked
if !(_unit in _lockedUnits) exitWith {};
// Exit with cleanup if unit is dead
if !(alive _unit) exitWith {
  _lockedUnits = _lockedUnits select {alive _x};
  GVAR(lockedUnits) = _lockedUnits;
};

GVAR(prepUnlockUnits) pushBack _unit;
[QGVAR(prepForUnlock), _unit, [_unit]] call CBA_fnc_targetEvent;

[{
  params ["_unit"];

  // Exit if unit disconnected during prep time
  if !(_unit in GVAR(prepUnlockUnits)) exitWith {};

  // Unlock unit
  [QGVAR(unlockUnit), _unit, [_unit]] call CBA_fnc_targetEvent;

  // Cleanup
  GVAR(prepUnlockUnits) deleteAt (GVAR(prepUnlockUnits) find _unit);

  private _lockedUnits = GVAR(lockedUnits);
  _lockedUnits deleteAt (_lockedUnits find _unit);
  _lockedUnits = _lockedUnits select {alive _x};
  GVAR(lockedUnits) = _lockedUnits;
}, [_unit], 15] call CBA_fnc_waitAndExecute;
