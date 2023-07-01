#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(clearGear), {
  _this call FUNC(clearGear);
}] call CBA_fnc_addEventHandler;

[QGVAR(toggleContainerSim), {
  params ["_bodyContainer", "_enabled"];
  toggleContainerSim enableSimulationGlobal _enabled;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  GVAR(simpleBodiesGroup) = grpNull;
  GVAR(simpleBodies) = [];
  GVAR(simpleBodiesLimit) = 100;
  GVAR(simpleBodyID) = 0;
};

ADDON = true;
