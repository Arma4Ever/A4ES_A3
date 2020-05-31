#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * display3DENEditAttributes onLoad handler
 */
params ["_display"];

private _modules = get3DENSelected "logic";

INFO_1("Loading display3DENEditAttributes, modules count: %1",count _modules);

// Exit if user is editing more than one module at a time
if !((count _modules) isEqualTo 1) exitWith {};

GVAR(dynamicControlsEnabled) = true;
GVAR(dynamicControlsModule) = _modules # 0;
GVAR(dynamicControls) = [];
GVAR(dynamicControlsValues) = false call CBA_fnc_createNamespace;

// Clear are global variables on display unload
_display displayAddEventHandler ["onUnload", {
  GVAR(dynamicControlsEnabled) = nil;
  GVAR(dynamicControlsModule) = nil;
  GVAR(dynamicControls) = nil;
  GVAR(dynamicControlsValues) call CBA_fnc_deleteNamespace;
  GVAR(dynamicControlsValues) = nil;
}];

// Use EachFrame mission EH for exec in next frame
// CBA_fnc_execNextFrame doesn't work in 3DEN
GVAR(dynamicControls_nextFrameHandler) = addMissionEventHandler ["EachFrame", {
  INFO_1("Initial refresh of reactive controls, count: %1",str count GVAR(reactiveDynamicControls));
  TRACE_1("Initial refresh of reactive controls",count GVAR(reactiveDynamicControls));

  call FUNC(refreshDynamicControls);
  removeMissionEventHandler ["EachFrame", GVAR(dynamicControls_nextFrameHandler)];
}];
