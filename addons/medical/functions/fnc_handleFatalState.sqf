#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Triggered by ace_medical_woundReceived event, handles fatal state
 */

params ["_unit", "", "_instigator"];
TRACE_2("handleFatalState",_unit,_instigator);

if (_unit isNotEqualTo player) exitWith {};

_unit setVariable [QGVAR(lastInstigator), _instigator];

if (GVAR(fatalStateCheckScheduled)) exitWith {};
GVAR(fatalStateCheckScheduled) = true;
LOG("Scheduling fatal state check");

[{
  params ["_unit"];

  // Exit if unit already dead
  if !(alive _unit) exitWith {};

  private _woundsCount = 0;

  // Count bleeding chest wounds
  {
    
    if (((_x # 1) == 1) && {(_x # 2) > 0} && {(_x # 3) > 0}) then {
      _woundsCount = _woundsCount + (_x # 2);
    };
  } forEach (_unit getVariable ["ace_medical_openWounds", []]);

  TRACE_2("Fatal state checked",_unit,_woundsCount);
  if (_woundsCount > MEDICAL_FATALSTATE_MAX_WOUNDS_COUNT) exitWith {
    [
      _unit,
      format ["#fatalInternalDamage:%1", _woundsCount],
      _unit getVariable [QGVAR(lastInstigator), objNull]
    ] call ace_medical_status_fnc_setDead;
  };

  GVAR(fatalStateCheckScheduled) = false;  
}, [_unit], 5] call CBA_fnc_waitAndExecute;
