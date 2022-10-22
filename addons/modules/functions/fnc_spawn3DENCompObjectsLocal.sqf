#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns saved 3DEN comp objects locally
 */
LOG("spawn3DENCompObjectsLocal");

{
  _x params ["_data", "_initScript"];

  {
    _x params ["_type", "_posWorld", "_vectors"];
    private _object = createSimpleObject [_type, _posWorld, true];
    _object setPosWorld _posWorld;
    _object setVectorDirAndUp _vectors;
    _object call _initScript;
  } forEach _data;
} forEach _this;
