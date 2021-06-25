#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for showMarker module
 */

params ["_module", "_values"];

private _warnings = [];

private _marker = _values getVariable [QGVAR(showMarkerName), ""];
if (_marker isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(showMarker_Warning_MissingMarker_Desc),
    QGVAR(showMarkerName)
  ];
};

_warnings
