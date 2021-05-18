#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Tick function of module activator
 */

BEGIN_COUNTER(moduleActivatorTick);

private _moduleList = GVAR(activatorModuleList);
private _index = GVAR(moduleActivatorIndex);

if (_moduleList isEqualTo []) exitWith {
  [GVAR(moduleActivatorPFH)] call CBA_fnc_removePerFrameHandler;
  GVAR(moduleActivatorIndex) = -1;
  GVAR(moduleActivatorPFH) = -1;
};

private _data = _moduleList param [_index, []];
if (_data isEqualTo []) exitWith {
  GVAR(moduleActivatorIndex) = 0;
};

_data params ["_logic", "_condition", "_activation"];

if (isNull _logic) exitWith {
  _moduleList deleteAt _index;
};

if (_logic call _condition) then {
  _moduleList deleteAt _index;
  _logic call _activation;
  // Removed current index - no need for index increase
} else {
  GVAR(moduleActivatorIndex) = _index + 1;
};

END_COUNTER(moduleActivatorTick);
