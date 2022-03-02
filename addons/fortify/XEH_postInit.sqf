#include "script_component.hpp"

if (isServer) then {
  ["acex_fortify_objectPlaced", {
    params ["", "", "_object"];

    _object enableDynamicSimulation true;
  }] call CBA_fnc_addEventHandler;
};
