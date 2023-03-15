#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds corpse to simple bodies system
 */

params ["_corpse", "_id"];
TRACE_1("addCorpseToSystem",_corpse);

// Exit if corpse is null (could be deleted already)
if (isNull _corpse) exitWith {};

// Convert corpse to simple body
private _converted = _corpse call FUNC(convertToSimpleBody);

// Exit if corpse was not converted
if (!_converted) exitWith {};

_corpse setVariable [QGVAR(simpleBodyID), _id];

// Remove nulls from simple bodies list
if (objNull in GVAR(simpleBodies)) then {
	GVAR(simpleBodies) = GVAR(simpleBodies) - [objNull];
};

private _oldestDeleted = false;

// Save body in list, remove oldest one if limit is reached
private _index = GVAR(simpleBodies) pushBack _corpse;
if (_index >= GVAR(simpleBodiesLimit)) then {
  deleteVehicle (GVAR(simpleBodies) deleteAt 0);
  _oldestDeleted = true;
};

[{
  params ["_corpse"];

  if (isNull _corpse) exitWith {};

  // Make sure modeled elements are deleted
  removeGoggles _corpse;
  removeHeadgear _corpse;
  removeVest _corpse;
  removeBackpackGlobal _corpse;
}, [_corpse], (3 + random 2)] call CBA_fnc_waitAndExecute;

// Log convertion
["a4es_corpseConverted", [_id, count GVAR(simpleBodies), _oldestDeleted]] call CBA_fnc_serverEvent;