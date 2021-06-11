#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Saves object data for objects3DENComp module
 */

params ["_object"];
TRACE_1("objects3DENComp_saveData_object",_object);

[
  typeOf _object,
  (getModelInfo _object) # 1,
  (_object get3DENAttribute "position") # 0,
  getPosWorld _object,
  (_object get3DENAttribute "rotation") # 0,
  [vectorDirVisual _object, vectorUpVisual _object]
]
