#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handlers server disconnect event
 */

params ["_unit"];
TRACE_1("HandleDisconnect",_unit);

if (
  !(alive _unit) ||
  {(side (group _unit)) == sideLogic} ||
  {_unit isKindOf "HeadlessClient_F"}
) exitWith {
  TRACE_1("HandleDisconnect - abort, no valid unit",_unit);
};

// Exit with cleanup if unit disconnected during unlock prep time
if (_unit in GVAR(prepUnlockUnits)) exitWith {
  TRACE_1("HandleDisconnect - unit disconnected during prep time, cleanup",_unit);
  GVAR(prepUnlockUnits) deleteAt (GVAR(prepUnlockUnits) find _unit);
};

// Exit if unit already handcuffed
if (_unit getVariable ["ace_captives_isHandcuffed", false]) exitWith {
  TRACE_1("HandleDisconnect - abort, unit already handcuffed",_unit);
};

[QGVAR(lockUnit), _unit, [_unit]] call CBA_fnc_targetEvent;
GVAR(lockedUnits) pushBack _unit;
