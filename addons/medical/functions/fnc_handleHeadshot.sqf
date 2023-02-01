#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Triggered by ace_medical_woundReceived event, handles headshots
 */

params ["_unit", "_damages", "_instigator"];

if (
  !hasInterface ||
  {_unit != player} ||
  {_unit getVariable [QGVAR(disableHSHandling), false]} ||
  {!(isNull (objectParent _unit))}
) exitWith {};

#ifdef DEBUG_MODE_FULL
diag_log ["_damages", _damages];
#endif

private _index = _damages findIf {(_x # 1) == "Head"};
if (_index == -1) exitWith {};

private _damageData = _damages select _index;
private _damage = (_damageData # 0) max (_damageData # 2);

#ifdef DEBUG_MODE_FULL
diag_log ["_damageData", _damageData, _damage];
systemChat format ["_damageData: %1", str _damageData];
#endif

if (_damage < MEDICAL_HEADSHOT_MIN_DAMAGE) exitWith {
  TRACE_2("headshotHandling: not valid damage",_unit,_damage);
};

private _lastWoundTime = _unit getVariable [QGVAR(lastHeadWoundTime), 0];
if ((_lastWoundTime + 5.1) > CBA_missionTime) exitWith {
  TRACE_3("headshotHandling: timeout",_unit,_lastWoundTime,CBA_missionTime);
};
_unit setVariable [QGVAR(lastHeadWoundTime), CBA_missionTime];

private _random = random 1;
private _currentDamage = _unit getVariable [QGVAR(currentHeadDamage), 0];
private _fullDamage = _damage + _currentDamage;
private _chance = linearConversion [
  MEDICAL_HEADSHOT_MIN_DAMAGE,
  MEDICAL_HEADSHOT_SCALE_MAX_DAMAGE,
  _fullDamage,
  0,
  MEDICAL_HEADSHOT_SCALE_MAX_CHANCE
];
private _headShotCount = (_unit getVariable [QGVAR(headshotCount), 0]) + 1;
TRACE_6("headshotHandling: headshot",_unit,_fullDamage,_chance,_damage,_currentDamage,_headShotCount);

if (_random < _chance) exitWith {
  TRACE_1("headshotHandling: headshotDead",_random);
  [
    _unit,
    format ["#headshot [fD:%1 c:%2 r:%3 d:%4 cD:%5 hsC:%6]", _fullDamage, _chance, _random, _damage, _currentDamage, _headShotCount],
    _instigator
  ] call ace_medical_status_fnc_setDead;
};

// This level of head injury will make unit unconscious for a few seconds
[_unit, true] call ace_medical_fnc_setUnconscious;
[{
  [_this, false] call ace_medical_fnc_setUnconscious;
}, _unit, 5] call CBA_fnc_waitAndExecute;

// Save data globally for JIP
_unit setVariable [QGVAR(headshotCount), _headShotCount, true];
_unit setVariable [QGVAR(currentHeadDamage), _fullDamage, true];
_unit setVariable [QGVAR(headDamageHealTick), _fullDamage / 60, true];
