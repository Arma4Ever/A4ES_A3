#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks is object valid flora cut object
 */
params ["_object"];

TRACE_1("isValidFloraObject",_object);

if (
  (isNull _object) ||
  {isObjectHidden _object} ||
  {(ace_player distance2D _object) > 5}
) exitWith {false};

private _modelPath = (getModelInfo _object) # 1;
private _index = [
  "a3\plants_f\",
  "a3\vegetation_f_exp\",
  "a3\vegetation_f_enoch\",
  "gm\gm_plants\",
  "vn\vn_plants_f\",
  "vn\vn_vegetation_f_exp\",
  "vn\vn_vegetation_f_enoch\",
  "ca\plants\",
  "ca\plants2\",
  "ca\plants_e\",
  "ca\plants_e2\",
  "ca\plants_pmc\",
  "cup\terrains\cup_terrains_winter_plants\"
] findIf {_x in _modelPath};

_index isNotEqualTo -1
