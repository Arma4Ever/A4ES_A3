#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns target for cut flora action
 */

LOG("getCutFloraTarget");

// Exit if cursorObject can be cut
if (cursorObject call FUNC(isValidFloraObject)) exitWith {cursorObject};

// Find nearest valid target object
private _targetObject = objNull;

private _nearestTerrainObject = (
  (nearestTerrainObjects [player, ["Tree", "Small tree", "Bush"], 5, true, true]) select {_x call FUNC(isValidFloraObject)}
) param [0, objNull];
private _nearestObject = (
  (nearestObjects [ace_player, [], 5, true]) select {_x call FUNC(isValidFloraObject)}
) param [0, objNull];

if !(isNull _nearestTerrainObject) then {
  _targetObject = _nearestTerrainObject;
};

// Use nearest object if it's closer than terrain object
if (isNull _targetObject || {
  !(isNull _nearestObject) &&
  {((ace_player distance2D _nearestObject) < (ace_player distance2D _targetObject))}
}) then {
  _targetObject = _nearestObject;
};

_targetObject
