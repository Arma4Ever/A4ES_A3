#include "script_component.hpp"
/***
  Autor: SzwedzikPL

  Opis:
      Zmienia ikonkę podanych jednostek na radarze drużynowym. Efekt działania
      tej funkcji można cofnąć/wyłączyć poprzez użycie A3CS_fnc_resetSquadRadarIcon

  Parametry:
      _units - lista jednostek których ikony chcemy zmienić <ARRAY>
      _icon - <STRING>
      _iconFromMission (opcjonalny, domyślnie: false) <BOOLEAN>
      _isGlobal (opcjonalny, domyślnie: true) <BOOLEAN>
      _isSpecial (opcjonalny, domyślnie: false) <BOOLEAN>
      _iconColor (opcjonalny, domyślnie: [1,1,1] - biały) <ARRAY>
      _checkFOV (opcjonalny, domyślnie: false) <BOOLEAN>

  Zwraca:
      Nic <NIL>

  Przykład:
      //
      [
        [umb1, umb2],
        "folder_w_misji\umbrella.paa",
        true,
        false,
        false
      ] call A3CS_fnc_setSquadRadarIcon;

      //
      [
        [umb1],
        "folder_w_misji\biohazard.paa",
        true,
        false,
        true,
        [209/255, 196/255, 15/255],
        true
      ] call A3CS_fnc_setSquadRadarIcon;
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
  if ((count _iconColor) isNotEqualTo 3) exitWith {
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
