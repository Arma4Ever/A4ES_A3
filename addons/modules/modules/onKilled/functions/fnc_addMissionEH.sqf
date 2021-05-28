#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds mission EH if not added yet
 */

params ["_logic"];
TRACE_1("onKilled_addMissionEH",_logic);

private _waitingModules = GVAR(onKilled_waitingModules);
if (_logic in _waitingModules) exitWith {
  TRACE_2("onKilled_addMissionEH - aborting adding mission eh - module already added",_logic,_waitingModules);
};

_waitingModules pushBack _logic;

private _killedEH = GVAR(onKilled_killedEH);
if (_killedEH isEqualTo -1) then {
  _killedEH = addMissionEventHandler ["EntityKilled", {
    private _modules = (_entity # 0) getVariable [QGVAR(onKilledHandlers), []];
    if (_modules isNotEqualTo []) then {
      {
        if !(isNull _x) then {
          _x call FUNC(onKilled_moduleExec);
        };
      } forEach _modules;
    };
  }];
  GVAR(onKilled_killedEH) = _killedEH;
  TRACE_2("onKilled_addMissionEH - added entityKilled EH",_logic,_killedEH);
};
