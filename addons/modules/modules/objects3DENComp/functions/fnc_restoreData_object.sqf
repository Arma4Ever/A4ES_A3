#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores group for 3DEN from group data
 */

params ["_logic", "_objectData"];
TRACE_2("objects3DENComp_restoreData_object",_logic,_objectData);

_objectData params [
  "_className",
  "",
  "_posATL",
  "",
  "_rotation"
];

private _object = create3DENEntity ["Object", _className, _posATL];

_object set3DENAttribute ["position", _posATL];
_object set3DENAttribute ["rotation", _rotation];

add3DENConnection ["Sync", [_object], _logic];
