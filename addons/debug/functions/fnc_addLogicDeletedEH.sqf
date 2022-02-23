#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds deleted EH to given logic
 */

params ["_logic"];

_logic addEventHandler ["deleted", {
  params ["_logic"];
  private _logicId = _logic call BIS_fnc_netId;

  // Update module status if known id, update all deleted modules if not
  if (_logicId isEqualTo "") then {
    0 call FUNC(updateDeletedModules);
  } else {
    [_logicId] call FUNC(handleModuleDeleted);
  };
}];
