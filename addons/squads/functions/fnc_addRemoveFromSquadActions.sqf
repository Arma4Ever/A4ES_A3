#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds action for leader remove from squad self menu action
 */

params ["", "", "_parameters"];
_parameters params ["_unit"];

private _squad = _unit call FUNC(getUnitSquad);
if (isNull _squad) exitWith {[]};

private _units = _squad call FUNC(getSquadUnits);
if ((count _units) < 2) exitWith {[]};

private _actions = [];

{
  // Add remove action
  false
} count _units;

_actions
