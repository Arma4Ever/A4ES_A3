#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles entityKilled for medical addon
 */
params ["_entity"];
TRACE_1("handleEntityKilled",_entity);

if (
  (isNull _entity) ||
  {(objectParent player) isNotEqualTo _entity} ||
  {_entity isEqualTo player}
) exitWith {};

[player, _entity] spawn FUNC(startEjectPlayerFromWreck);
