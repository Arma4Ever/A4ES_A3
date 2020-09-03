#include "script_component.hpp"
/*
 * Author: 3Mydlo3, SzwedzikPL
 * Function assigns (or unassigns) given unit as Zeus
 */

params ["_unit", ["_isZeus", true]];

if (_isZeus) then {
  [QGVAR(zeusAssign), [_unit]] call CBA_fnc_serverEvent;
} else {
  [QGVAR(zeusUnassign), [_unit]] call CBA_fnc_serverEvent;
};
