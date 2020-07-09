#include "script_component.hpp"

// Exit if not server
if !(isServer) exitWith {};

// Handle forced gun lights
[{
  {
    _x call FUNC(initUnit);
    false
  } count allUnits;
}, [], 0.5] call CBA_fnc_waitAndExecute;
