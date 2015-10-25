#include "script_component.hpp"

params ["_logic"];

if (isNull _logic) exitWith {};
if(!isServer) exitWith {};

{_x setVariable ["ACE_isRepairFacility", 1, true];} foreach synchronizedObjects _logic;
