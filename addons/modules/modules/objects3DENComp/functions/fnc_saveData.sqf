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
private _objectsCount = count _objectsData;

_logic set3DENAttribute [QGVAR(data), str _objectsData];
_logic set3DENAttribute [QGVAR(objectsCount), str _objectsCount];

private _addObjectPostInit = (_logic get3DENAttribute QGVAR(addObjectPostInit)) # 0;
private _objectPostInit = (_logic get3DENAttribute QGVAR(objectPostInit)) # 0;
private _spawnAsSuperSimple = (_logic get3DENAttribute QGVAR(spawnAsSuperSimple)) # 0;
private _spawnLocally = (_logic get3DENAttribute QGVAR(spawnLocally)) # 0;

if !(_addObjectPostInit) then {
  _objectPostInit = "";
};

// TODO: Add saves postInit info to stats
_logic set3DENAttribute [QGVAR(dataStats), format [
  "%1
%2
%3
%4
%5",
  format ["%1: %2", LLSTRING(objects3DENComp_dataStats_objects), _objectsCount],
  format ["%1: %2", LLSTRING(objects3DENComp_Attributes_spawnAsSuperSimple), _spawnAsSuperSimple],
  format ["%1: %2", LLSTRING(objects3DENComp_Attributes_spawnLocally), _spawnLocally],
  format ["%1: %2", LLSTRING(objects3DENComp_Attributes_addObjectPostInit), _addObjectPostInit],
  format ["%1: %2", LLSTRING(objects3DENComp_Attributes_objectPostInit), _objectPostInit]
]];
_logic set3DENAttribute [QGVAR(dataSaved), true];

delete3DENEntities _objectsList;

_logic call FUNC(objects3DENComp_spawnPreview);