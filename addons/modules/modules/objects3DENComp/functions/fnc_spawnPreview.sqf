#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns 3DEN preview objects for objects3DENComp
 */

params ["_logic"];
TRACE_1("objects3DENComp_spawnPreview",_logic);

// Make sure preview is cleaned
_logic call FUNC(objects3DENComp_cleanPreview);

private _data = parseSimpleArray ((_logic get3DENAttribute QGVAR(data)) # 0);

private _previewObjects = _data apply {
  _x params ["", "_model", "", "_posWorld", "", "_vectors"];
  private _object = createSimpleObject [_model, _posWorld];
  _object setVectorDirAndUp _vectors;
  _object
};

_logic setVariable [QGVAR(previewObjects), [true, _previewObjects]];
