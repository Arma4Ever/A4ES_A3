#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * revealUnit curator module function
 */

params ["_logic"];
private _target = attachedTo _logic;
deleteVehicle _logic;

if (isNull _target) exitWith {};

[QGVAR(revealUnit), _target] call CBA_fnc_globalEvent;
[objNull, LLSTRING(revealUnit_UnitRevealed)] call BIS_fnc_showCuratorFeedbackMessage;