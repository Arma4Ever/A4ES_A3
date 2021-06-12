#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * fireArtillery module exec function
 */

params ["_logic"];
TRACE_1("fireArtillery_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

_logic spawn FUNC(fireArtillery_moduleExecSpawn);
