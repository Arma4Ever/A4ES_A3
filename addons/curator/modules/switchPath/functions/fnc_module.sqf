#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * switchPath curator module function
 */

params ["_logic"];
private _target = attachedTo _logic;
deleteVehicle _logic;

if (isNull _target || {!(_target isKindOf "CAManBase")}) exitWith {};

[LLSTRING(switchPath_displayName), [
  ["TOOLBOX:YESNO", LLSTRING(switchPath_Attributes_PathEnabled), true],
  ["TOOLBOX:YESNO", LLSTRING(switchPath_Attributes_ForGroup), true]
], {
  params ["_values", "_target"];
  _values params ["_enabled", "_forGroup"];

  private _units = [_target];
  if (_forGroup) then {
    _units = units (group _target);
  };

  {
    [QGVAR(switchPATH), [_x, _enabled], [_x]] call CBA_fnc_targetEvent;
  } forEach _units;

  [localize (format [
    LSTRING(switchPath_Path_%1_%2),
    ["disabled", "enabled"] select _enabled,
    ["unit", "group"] select _forGroup
  ])] call zen_common_fnc_showMessage;
}, {}, _target] call zen_dialog_fnc_create;
