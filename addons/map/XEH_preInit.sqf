#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(playerDeletedMarker), {
  params ["_name"];
  TRACE_1("Event playerDeletedMarker",_name);
  systemChat format [LLSTRING(PlayerDeletedMarker), _name];
}] call CBA_fnc_addEventHandler;

ADDON = true;
