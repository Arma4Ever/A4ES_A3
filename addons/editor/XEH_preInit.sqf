#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if !(is3DEN) exitWith {};

["CAManBase", "init", {
  _this spawn {
    sleep 0.001;
    _this call FUNC(updateDynamicSimulation);
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;
