#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Triggered by ace_medical_woundReceived event, handles friendly-fire cases
 */
params ["_unit", "", "_instigator", "_ammo"];

// Sprawdzic mozdzierz

diag_log ["handleFF", _unit, _instigator];

if (
  (GVAR(ffReported)) ||
  {_unit != player} ||
  {isNull _instigator} ||
  {_unit == _instigator}
) exitWith {};

if !(_instigator isKindOf "CAManBase") then {
  private _shooter = gunner _instigator;
  if (isNull _shooter) then {
    _shooter = effectiveCommander _instigator;
  };

  _instigator = _shooter;
};

if (
  !(_instigator getVariable [QEGVAR(common,isPlayer), false]) ||
  {(side (group _unit)) != (side (group _instigator))}
) exitWith {};

["a3csserver_events_userFF", [_unit, _instigator, _ammo]] call CBA_fnc_serverEvent;

// Wait 1 sec before we can report another FF
GVAR(ffReported) = true;
[{GVAR(ffReported) = false}, [], 1] call CBA_fnc_waitAndExecute;
