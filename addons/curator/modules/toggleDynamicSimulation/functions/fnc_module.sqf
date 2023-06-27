#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * switchPath curator module function
 */

params ["_logic"];
private _target = attachedTo _logic;
deleteVehicle _logic;

if (isNull _target) exitWith {};

[LLSTRING(toggleDynamicSimulation_displayName), [
  ["TOOLBOX:YESNO", LLSTRING(toggleDynamicSimulation_Attributes_Enabled), true]
], {
  params ["_values", "_target"];
  _values params ["_enabled"];

  private _event = [QEGVAR(common,disableDynSim), QEGVAR(common,enableDynSim)] select _enabled;
  if (_target isKindOf "CAManBase") then {
    _target = group _target;
  };

  [_event, [_target]] call CBA_fnc_serverEvent;

  [localize (format [
    LSTRING(toggleDynamicSimulation_sim_%1),
    ["disabled", "enabled"] select _enabled
  ])] call zen_common_fnc_showMessage;
}, {}, _target] call zen_dialog_fnc_create;
