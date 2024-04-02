#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns saved 3DEN comp objects locally
 */
LOG("spawn3DENCompObjectsLocal");

if !(fileExists "_objects_data.sqf") exitWith {
  LOG("spawn3DENCompObjectsLocal abort: _objects_data.sqf does not exist");
};

private _dataArray = parseSimpleArray loadFile "_objects_data.sqf";
private _count = 0;

{
  _x params ["_data", "_initScript"];
  {
    _x params ["_source", "_posWorld", "_vectors"];

    _object = createSimpleObject [_source, _posWorld, true];
    _object setPosWorld _posWorld;
    _object setVectorDirAndUp _vectors;
    _object call (compile _initScript);
    _count = _count + 1;
  } forEach _data;
} forEach _dataArray;

systemChat format [LLSTRING(objects3DENComp_chatMessage), _count];
