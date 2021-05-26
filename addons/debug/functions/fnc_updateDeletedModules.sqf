#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates status of deleted modules
 */

LOG("updateDeletedModules");

{
  _x params ["_logic", "_logicId", "_deleted"];

  if ((isNull _logic) && {!_deleted}) then {
    [_logicId] call FUNC(handleModuleDeleted);
  };
} forEach GVAR(modulesDrawData);
