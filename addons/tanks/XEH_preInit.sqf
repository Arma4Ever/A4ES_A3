#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (isServer || !hasInterface) then {
  ["Tank_F", "Fired", {
    if !(_this call FUNC(canHeat)) exitWith {};

    params ["_vehicle"];
    _vehicle setVariable [QGVAR(heatTime), CBA_missionTime + 60];
    // heat up the vehicle
    [QGVAR(heat), _vehicle] call CBA_fnc_globalEvent;
  }] call CBA_fnc_addClassEventHandler;
};

if (hasInterface) then {
  [QGVAR(heat), {
    _this setVehicleTiPars [1, 1, 1];
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
