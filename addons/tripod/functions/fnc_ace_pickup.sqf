#include "\z\ace\addons\tripod\script_component.hpp"
/*
 * Author: Rocko, Ruthberg
 * Pick up tripod
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: tripod <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, tripod] call ace_tripod_fnc_pickup
 *
 * Public: No
 */

params ["_unit", "_tripod"];

if (stance _unit == "STAND") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary"] call EFUNC(common,doAnimation);
};

[{
    params ["_unit", "_tripod"];

    if (isNull _tripod) exitWith {};

    deleteVehicle _tripod;

    [_unit, "ACE_Tripod"] call EFUNC(common,addToInventory);

	// A4ES
	["a4es_tripodPickedUp", [_unit, "ACE_Tripod"]] call CBA_fnc_serverEvent;
	// A4ES
}, [_unit, _tripod], 1] call CBA_fnc_waitAndExecute;
