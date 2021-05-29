#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Tick function of module cycle activator
 */

BEGIN_COUNTER(moduleActivatorCycleTick);

private _moduleList = GVAR(activatorModuleCycleList);
private _index = GVAR(moduleActivatorCycleIndex);

if (_moduleList isEqualTo []) exitWith {
  LOG("Removing module activator PFH");
  [GVAR(moduleActivatorCyclePFH)] call CBA_fnc_removePerFrameHandler;
  GVAR(moduleActivatorCycleIndex) = -1;
  GVAR(moduleActivatorCyclePFH) = -1;
};

private _data = _moduleList param [_index, []];
if (_data isEqualTo []) exitWith {
  // Start from beginning in next cycle tick
  GVAR(moduleActivatorCycleIndex) = 0;
};

_data params ["_logic", "_condition", "_params", "_activation"];

if (isNull _logic) exitWith {
  _moduleList deleteAt _index;
};

if (_params call _condition) then {
  _moduleList deleteAt _index;
  _params call _activation;
  // Removed current index - no need for index increase
} else {
  GVAR(moduleActivatorCycleIndex) = _index + 1;
};

END_COUNTER(moduleActivatorCycleTick);
