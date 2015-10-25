#include "script_component.hpp"

params ["_logic"];

if (isNull _logic) exitWith {};
if(!isServer) exitWith {};

{_x setVariable ["ACE_isRepairVehicle", 1, true];} foreach synchronizedObjects _logic;
