#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  WIP
***/

params [
  ["_unit", objNull, [objNull]],
  ["_icon", "", [""]],
  ["_isGlobal", true, [false]],
  ["_isSpecial", false, [false]],
  ["_iconColor", [1,1,1], [[]]],
  ["_checkFOV", false, [false]],
  //["_showCondition", {true}, [{}]]
];

if (isNull _unit) exitWith {};
if (_icon isEqualTo "") exitWith {};

if (_isSpecial) then {
  if (_iconColor isEqualTypeAll 0) exitWith {};
  if !(count _iconColor isEqualTo 3) exitWith {};

  _unit setVariable [
    QGVAR(hasCustomSpecialIcon),
    true,
    _isGlobal
  ];

  private _iconColorHex = _iconColor call EFUNC(common,colorToHex);
  _unit setVariable [
    QGVAR(customSpecialIcon),
    [_icon, [_iconColor, _iconColorHex], _checkFOV],
    _isGlobal
  ];

  [_unit] call EFUNC(squads,triggerSquadChanged);
} else {
  _unit setVariable [
    QGVAR(customBaseIcon),
    _icon,
    _isGlobal
  ];
  [_unit] call EFUNC(squads,triggerSquadChanged);
};
