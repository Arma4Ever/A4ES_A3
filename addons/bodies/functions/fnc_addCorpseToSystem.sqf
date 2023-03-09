#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds corpse to simple bodies system
 */

params ["_corpse"];
TRACE_1("addCorpseToSystem",_corpse);

// Exit if corpse is null (could be deleted already)
if (isNull _corpse) exitWith {};

// Convert corpse to simple body
private _converted = _corpse call FUNC(convertToSimpleBody);

// Exit if corpse was not converted
if (!_converted) exitWith {};

// Remove nulls from simple bodies list
if (objNull in GVAR(simpleBodies)) then {
	GVAR(simpleBodies) = GVAR(simpleBodies) - [objNull];
};

// Save body in list, remove oldest one if limit is reached
private _index = GVAR(simpleBodies) pushBack _corpse;
if (_index >= GVAR(simpleBodiesLimit)) then {
  deleteVehicle (GVAR(simpleBodies) deleteAt 0);
};