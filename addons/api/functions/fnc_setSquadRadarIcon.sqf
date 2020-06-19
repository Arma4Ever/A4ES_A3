#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  WIP
***/

params [
  ["_units", [], [[]]],
  ["_icon", "", [""]],
  ["_iconFromMission", false, [false]],
  ["_isGlobal", true, [false]],
  ["_isSpecial", false, [false]],
  ["_iconColor", [1,1,1], [[]]],
  ["_checkFOV", false, [false]]
];

if (_units isEqualTo []) exitWith {
  LSTRING(squadRadar_emptyUnits) call EFUNC(common,showError);
};
if !(_units isEqualTypeAll objNull) exitWith {
  LSTRING(squadRadar_nonObjectUnits) call EFUNC(common,showError);
};
if (_icon isEqualTo "") exitWith {
  LSTRING(squadRadar_emptyIcon) call EFUNC(common,showError);
};

if (_iconFromMission) then {
  _icon = getMissionPath _icon;
};

if (_isSpecial) then {
  if !(_iconColor isEqualTypeAll 0) exitWith {
    LSTRING(squadRadar_wrongColorFormat) call EFUNC(common,showError);
  };
  if !((count _iconColor) isEqualTo 3) exitWith {
    LSTRING(squadRadar_wrongColorFormat) call EFUNC(common,showError);
  };

  private _iconColorHex = _iconColor call EFUNC(common,colorToHex);
  {
    _x setVariable [
      QEGVAR(squadradar,hasCustomSpecialIcon),
      true,
      _isGlobal
    ];
    _x setVariable [
      QEGVAR(squadradar,customSpecialIcon),
      [_icon, [_iconColor, _iconColorHex], _checkFOV],
      _isGlobal
    ];
  } forEach _units;

  _units call EFUNC(squads,triggerSquadChanged);
} else {
  {
    _x setVariable [
      QEGVAR(squadradar,customBaseIcon),
      _icon,
      _isGlobal
    ];
  } forEach _units;
  _units call EFUNC(squads,triggerSquadChanged);
};
