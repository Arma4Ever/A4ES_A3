#include "script_component.hpp"

["loadout", {
  [{0 call FUNC(checkAttached)}, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addPlayerEventHandler;

["vehicle", {
  [{0 call FUNC(checkAttached)}, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addPlayerEventHandler;
