#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if !(is3DEN) exitWith {};

// Setup mission attributes
call FUNC(setupMissionAttributes);

// Add units init EH for setup of dynamic simulation
["CAManBase", "init", {
  LOG_1("Handling unit init (%1)",str _this);
  _this spawn {
    sleep 0.001;
    _this call FUNC(updateDynamicSimulation);
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;

if (cba_xeh_fallbackRunning) then {
  LOG("Starting CBA fallback loop");
  call FUNC(startCBAFallbackLoop);
};

ADDON = true;
