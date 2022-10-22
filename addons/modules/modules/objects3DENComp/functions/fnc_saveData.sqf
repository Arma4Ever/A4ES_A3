#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves connected units in objects3DENComp module
 */

params ["_logic"];
TRACE_1("objects3DENComp_saveData",_logic);

private _objectsList = [];

{
  _x params ["_type", "_entity"];
  if (
    (_type isNotEqualTo "Sync") ||
    {_entity isKindOf "logic"} ||
    {_entity isKindOf "CAManBase"} ||
    {((getModelInfo _entity) # 1) == "a3\weapons_f\empty.p3d"}
  ) then {continue};

  _objectsList pushBackUnique _entity;
} forEach (get3DENConnections _logic);

private _objectsData = _objectsList apply {_x call FUNC(objects3DENComp_saveData_object)};

_logic set3DENAttribute [QGVAR(data), str _objectsData];
_logic set3DENAttribute [QGVAR(dataStats), format [
  LLSTRING(objects3DENComp_dataStats_format), count _objectsData
]];
_logic set3DENAttribute [QGVAR(dataSaved), true];

delete3DENEntities _objectsList;

_logic call FUNC(objects3DENComp_spawnPreview);
