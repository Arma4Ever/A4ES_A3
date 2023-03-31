#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Triggered by ace_medical_woundReceived event, handles friendly fire cases
 */
params ["_unit", "", "_instigator", "_typeOfDamage"];
TRACE_3("handleFriendlyFire",_unit,_instigator,_typeOfDamage);

if (
  (_unit isNotEqualTo player) ||
  {isNull _instigator} ||
  {_unit isEqualTo _instigator}
) exitWith {};

if (GVAR(friendlyFireSource) isNotEqualTo _instigator) then {
  GVAR(friendlyFireLock) = false;
  // Sets instigator now, even if instigator is vehicle so we won't report multiple FF from same source
  GVAR(friendlyFireSource) = _instigator;
  // ID for reseting friendlyFireLock
  GVAR(friendlyFireID) = GVAR(friendlyFireID) + 1;

  TRACE_2("handleFriendlyFire: new source",_instigator,GVAR(friendlyFireID));
};

if (GVAR(friendlyFireLock)) exitWith {};

// Get shooter if instigator is vehicle
if !(_instigator isKindOf "CAManBase") then {
  private _shooter = gunner _instigator;
  if (isNull _shooter || {!(_shooter getVariable [QEGVAR(common,isPlayer), false])}) then {
    _shooter = effectiveCommander _instigator;
  };

  _instigator = _shooter;
  TRACE_1("handleFriendlyFire: override instigator",_instigator);
};

private _unitSide = side (group _unit);
private _instigatorSide = side (group _instigator);

// Exit if units sides are not friendly to each other
// Using BIS_fnc_sideIsFriendly instead of BIS_fnc_sideIsEnemy to support sideLogic properly
if !([_unitSide, _instigatorSide] call BIS_fnc_sideIsFriendly) exitWith {
  TRACE_3("handleFriendlyFire: instigator side is not friendly",_instigator,_unitSide,_instigatorSide);
};

// Report friendly fire
["a4es_playerFF", [_unit, _instigator, _typeOfDamage]] call CBA_fnc_serverEvent;

// Wait 1 sec before we can report another FF from same source
TRACE_2("handleFriendlyFire: locking",_instigator,GVAR(friendlyFireID));
GVAR(friendlyFireLock) = true;

[{
  params ["_id"];

  if (_id == GVAR(friendlyFireID)) then {
    TRACE_1("handleFriendlyFire: unlocking",_id);
    GVAR(friendlyFireLock) = false;
    GVAR(friendlyFireSource) = objNull;
  };
}, [GVAR(friendlyFireID)], 1] call CBA_fnc_waitAndExecute;
