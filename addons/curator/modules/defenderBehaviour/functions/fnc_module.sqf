#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * defenderBehaviour curator module function
 */

params ["_logic"];
private _target = attachedTo _logic;
deleteVehicle _logic;

if (isNull _target || {!(_target isKindOf "CAManBase")}) exitWith {};

[LLSTRING(defenderBehaviour_displayName), [
  [
    "COMBO",
    LLSTRING(defenderBehaviour_Attributes_behaviour),
    [[0, 1, 2], [
      ELSTRING(ai,defenderBehaviour_Attributes_disabled_name),
      ELSTRING(ai,defenderBehaviour_Attributes_up_name),
      ELSTRING(ai,defenderBehaviour_Attributes_middle_name)
    ], 0]
  ],
  ["TOOLBOX:YESNO", LLSTRING(defenderBehaviour_Attributes_ForGroup), true]
], {
  params ["_values", "_target"];
  _values params ["_behaviour", "_forGroup"];

  private _units = [_target];
  if (_forGroup) then {_units = units (group _target)};

  if (_behaviour == 0) then {
    {
      _x setVariable [QEGVAR(ai,defenderEnabled), false, true];
    } forEach _units;

    [localize (format [
      LSTRING(defenderBehaviour_disabledFor_%1),
      ["unit", "group"] select _forGroup
    ])] call zen_common_fnc_showMessage;
  } else {
    {
      _x setVariable [QEGVAR(ai,defenderBehaviour), _behaviour, true];
      [QEGVAR(ai,defenderBehaviour), _x, [_x]] call CBA_fnc_targetEvent;
    } forEach _units;

    [localize (format [
      LSTRING(defenderBehaviour_setFor_%1),
      ["unit", "group"] select _forGroup
    ])] call zen_common_fnc_showMessage;
  };
}, {}, _target] call zen_dialog_fnc_create;
