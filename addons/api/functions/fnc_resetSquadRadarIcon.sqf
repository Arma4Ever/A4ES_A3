#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  WIP
***/

params [
  ["_units", [], [[]]],
  ["_isGlobal", true, [false]],
  ["_isSpecial", false, [false]]
];

if (_units isEqualTo []) exitWith {
  LSTRING(squadRadar_emptyUnits) call EFUNC(common,showError);
};
if !(_units isEqualTypeAll objNull) exitWith {
  LSTRING(squadRadar_nonObjectUnits) call EFUNC(common,showError);
};

if (_isSpecial) then {
  {
    _x setVariable [
      QEGVAR(squadradar,hasCustomSpecialIcon),
      false,
      _isGlobal
    ];
  } forEach _units;
  _units call EFUNC(squads,triggerSquadChanged);
} else {
  {
    _x setVariable [
      QEGVAR(squadradar,customBaseIcon),
      "",
      _isGlobal
    ];
  } forEach _units;
  _units call EFUNC(squads,triggerSquadChanged);
};
