#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles click & dbClick from warnings tree
 */

params ["_eventParams", "_isDbClick"];
_eventParams params ["_warningsTree", "_path"];

private _entityID = _warningsTree tvValue _path;

// Exit if unknown entityID
if (_entityID isEqualTo -1) exitWith {};

set3DENSelected [_entityID];

if (_isDbClick) then {
  do3DENAction "OpenAttributes";
} else {
  move3DENCamera [getPos (get3DENEntity _entityID), true];
};
