#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(clearGear), {
  _this call FUNC(clearGear);
}] call CBA_fnc_addEventHandler;

[QGVAR(toggleContainerSim), {
  params ["_bodyContainer", "_enabled"];
  private _pos = getPosASL _bodyContainer;
  _bodyContainer enableSimulationGlobal _enabled;
  _bodyContainer setPosASL _pos;
  [_bodyContainer, "KIA_gunner_static_low01"] remoteExec ["switchMove"];
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  GVAR(simpleBodiesGroup) = grpNull;
  GVAR(simpleBodies) = [];
  GVAR(simpleBodiesLimit) = 100;
  GVAR(simpleBodyID) = 0;
};

ADDON = true;
