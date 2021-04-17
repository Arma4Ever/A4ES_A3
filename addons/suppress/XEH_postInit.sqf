#include "script_component.hpp"

if !(hasInterface) exitWith {};

["unit", {_this call FUNC(handlePlayerChanged)}, true] call CBA_fnc_addPlayerEventHandler;
