#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  WIP
***/

params [
  ["_units", [], [[]]],
  ["_jamRadar", true, [false]],
  ["_jamMemberlist", true, [false]],
  ["_animate", true, [false]],
  ["_isGlobal", true, [false]]
];

if (_units isEqualTo []) exitWith {
  LSTRING(squadRadar_emptyUnits) call EFUNC(common,showError);
};
if !(_units isEqualTypeAll objNull) exitWith {
  LSTRING(squadRadar_nonObjectUnits) call EFUNC(common,showError);
};

{
  _x setVariable [QEGVAR(squadradar,jamRadar), _jamRadar, _isGlobal];
  _x setVariable [QEGVAR(squadradar,jamMemberlist), _jamMemberlist, _isGlobal];
  _x setVariable [QEGVAR(squadradar,jamAnimation), _animate, _isGlobal];
} forEach _units;

if (_isGlobal) then {
  [QEGVAR(squadradar,jamRadar), [], _units] call CBA_fnc_targetEvent;
} else {
  // Don't refresh player's UI if change doesn't affect him
  if !(ace_player in _units) exitWith {};
  [QEGVAR(squadradar,jamRadar), []] call CBA_fnc_localEvent;
};
