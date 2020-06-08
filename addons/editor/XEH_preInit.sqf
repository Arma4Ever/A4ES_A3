#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if !(is3DEN) exitWith {};

// Setup mission attributes
call FUNC(setupMissionAttributes);

// Add units init EH for setup of dynamic simulation
["CAManBase", "init", {
  _this spawn {
    sleep 0.001;
    _this call FUNC(updateDynamicSimulation);
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;
