#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};
if (!isServer) exitWith {};

private ["_targetVehicle"];
_targetVehicle = call compile (_logic getVariable ["targetVehicle", ""]);
if(isNull _targetVehicle || !alive _targetVehicle) exitWith {};

{_x moveInAny _targetVehicle;} foreach _units;
