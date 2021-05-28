#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes mission EH if no onKilled modules are waiting
 */

params ["_logic"];
TRACE_1("onKilled_removeMissionEH",_logic);

private _waitingModules = GVAR(onKilled_waitingModules);
if !(_logic in _waitingModules) exitWith {
  TRACE_2("onKilled_removeMissionEH - aborting removing mission eh - module not waiting",_logic,_waitingModules);
};

_waitingModules deleteAt (_waitingModules find _logic);

if (_waitingModules isEqualTo []) then {
  private _killedEH = GVAR(onKilled_killedEH);
  removeMissionEventHandler ["EntityKilled", _killedEH];
  TRACE_2("onKilled_removeMissionEH - removed entityKilled EH",_logic,_killedEH);
  GVAR(onKilled_killedEH) = -1;
};
