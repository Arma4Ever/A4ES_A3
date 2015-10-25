#include "script_component.hpp"

params ["_logic"];

if (isNull _logic) exitWith {};
if(!isServer) exitWith {};

{_x setVariable ["ACE_isEOD", true, true];} foreach synchronizedObjects _logic;
