#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Unassigns curator module from given unit
 */

params ["_unit"];
TRACE_1("unassignCuratorModule",_unit);

private _module = getAssignedCuratorLogic _unit;
if (isNull _module) exitWith {};

LOG_1("Unassigning curator module from '%1'",_unit);
unassignCurator _module;

// A4ES Server log
["a4es_curatorAccess", [_unit, false]] call CBA_fnc_serverEvent;
