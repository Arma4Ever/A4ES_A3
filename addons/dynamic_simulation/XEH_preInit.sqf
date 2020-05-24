#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if (!is3DEN) exitWith {};

add3DENEventHandler ["OnConnectingEnd", {
  params ["_class", "_from"];

  if (_class != "Group") exitWith {};

  {
    (group _x) call FUNC(update3DENAttribute);
  } forEach (_from # 0);
}];

["CAManBase", "init", {
  _this spawn {
    params ["_unit"];

    sleep 0.001;
    (group _unit) call FUNC(update3DENAttribute);
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;
