#include "script_component.hpp"

/*
 * Author: ACE team, SzwedzikPL
 * Return true if target name tag sould be shown
 */

params ["_target"];

if (
  !(_target isKindOf "CAManBase")
  || {_target == ace_player}
  || {!(alive _target)}
  || {((side ace_player) getFriend (side _target)) < 0.6}
  || {!(_target getVariable [QGVAR(showNameTag), _target call ace_common_fnc_isPlayer])}
) exitWith {false};

true
