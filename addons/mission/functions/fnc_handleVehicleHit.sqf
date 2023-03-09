#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles hit event for all vehicles, makes sure disabled vehicles have dyn sim enabled
 */

params ["_vehicle"];
TRACE_1("handleVehicleHit",_vehicle);

[{
	_this call FUNC(handleVehicleHitExec);
}, [_vehicle], 5] call CBA_fnc_waitAndExecute;
