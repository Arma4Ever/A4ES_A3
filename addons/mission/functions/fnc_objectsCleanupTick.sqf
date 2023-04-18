#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Objects cleanup tick
 */

private _index = GVAR(objectsCleanupIndex);
private _object = GVAR(objectsCleanupData) select _index;

if (isNil "_object") exitWith {GVAR(objectsCleanupIndex) = 0;};
if ((isNull _object) || {_object getVariable [QGVAR(disableCleanup), false]}) exitWith {GVAR(objectsCleanupData) deleteAt _index;};
if (
  (CBA_missionTime > (_object getVariable [QGVAR(cleanupNET), 0])) &&
  {(_object nearEntities ["CAManBase", 200]) isEqualTo []}
) exitWith {
  _object setVariable [QGVAR(cleanupDeletion), true];
  diag_log format ["objectsCleanupDeletion", _object getVariable [QGVAR(cleanupNET), -1], _object, typeOf _object, CBA_missionTime];
  deleteVehicle _object;
};

GVAR(objectsCleanupIndex) = _index + 1;
