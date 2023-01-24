#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Resets talking status for both units
 */

params ["_unit", "_player"];
TRACE_2("endTalk",_unit,_player);

_unit setVariable [QGVAR(talkingWith), objNull, true];
_player setVariable [QGVAR(talkingWith), objNull, true];

[QGVAR(randomLip), [_unit, false]] call CBA_fnc_globalEvent;
[QGVAR(talkEnd), [_unit], [_unit]] call CBA_fnc_targetEvent;
