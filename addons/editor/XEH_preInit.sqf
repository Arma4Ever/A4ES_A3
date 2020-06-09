#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

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
