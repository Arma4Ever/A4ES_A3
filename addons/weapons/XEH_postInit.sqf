#include "script_component.hpp"

GVAR(curPrimaryWeap) = "";

["weapon", {
  0 call FUNC(handleWeaponChanged);
}] call CBA_fnc_addPlayerEventHandler;
