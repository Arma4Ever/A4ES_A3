#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Triggered by ace_medical_woundReceived event, handles headshots
 */

params ["_unit", "_damages", "_instigator", "_damageType"];

if (
  (_unit isNotEqualTo player) ||
  {_unit getVariable [QGVAR(disableHSHandling), false]} ||
  {!(isNull (objectParent _unit))}
) exitWith {};

TRACE_1("headshotHandling: damages",_damages);

private _index = _damages findIf {(_x # 1) == "Head"};
if (_index == -1) exitWith {};

private _damageData = _damages select _index;
private _damage = (_damageData # 0) max (_damageData # 2);

TRACE_2("headshotHandling: damageData",_damageData,_damage);

if (_damage < MEDICAL_HEADSHOT_MIN_DAMAGE) exitWith {
  TRACE_2("headshotHandling: not valid damage",_unit,_damage);
};

private _lastWoundTime = _unit getVariable [QGVAR(lastHeadWoundTime), 0];
if ((_lastWoundTime + 2.5) > CBA_missionTime) exitWith {
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
  MEDICAL_HEADSHOT_SCALE_MAX_CHANCE,
  true
];

private _headShotCount = (_unit getVariable [QGVAR(headshotCount), 0]) + 1;
TRACE_7("headshotHandling: headshot",_unit,_fullDamage,_chance,_random,_damage,_currentDamage,_headShotCount);

if ((_headShotCount == 1) && {_fullDamage < (MEDICAL_HEADSHOT_SCALE_MAX_DAMAGE / 2)}) then {
  _chance = _chance * 0.5;
};

// Log headshot
["a4es_playerHeadshot", [
  _unit,
  _fullDamage toFixed 2,
  (_chance * 100) toFixed 2,
  (_random * 100) toFixed 2,
  _damage toFixed 2,
  _currentDamage toFixed 2,
  _headShotCount,
  _damageType
]] call CBA_fnc_serverEvent;

if (_chance < 0.55) then {
  //## Don't trigger additional wounds on low chance
  if (_chance > 0.1) then {
    private _iterations = round (5 * _chance); //## Max 3 iterations with 55% chance
    for "_i" from 1 to _iterations do {
      //## Damage 1 will be skipped above so wont trigger multiple hs
      [_unit, 1, "head", "bullet"] call ace_medical_fnc_addDamageToUnit
    };
    TRACE_2("headshotHandling: headshot wound",_chance,_iterations);
  }
} else {
  if (_random < _chance) exitWith {
    TRACE_1("headshotHandling: headshotDead",_random);

    [{
      params ["_unit", "_instigator", "_fullDamage", "_chance", "_random", "_damage", "_currentDamage", "_headShotCount", "_damageType"];

      // Exit if player is already dead
      if !(alive _unit) exitWith {};

      // Make sure last damage type is correct - the one that caused fatal headshot
      _unit setVariable [QGVAR(lastDamageType), _damageType];

      // Kill player
      [
        _unit,
        "#headshot",
        _instigator
      ] call ace_medical_status_fnc_setDead;

      // Inform player about probabilities
      if (_unit isEqualTo player) then {
        [_chance, _headShotCount] spawn {
          params ["_chance", "_headShotCount"];
          sleep 2;
          systemChat format [LLSTRING(Headshot_Death_Info), _headShotCount, (_chance * 100) toFixed 1, "%"];
        };
      };

    }, [_unit, _instigator, _fullDamage, _chance, _random, _damage, _currentDamage, _headShotCount, _damageType], 0.15] call CBA_fnc_waitAndExecute;
  }
};

// This level of head injury will make unit unconscious
if !(_unit getVariable ["ACE_isUnconscious", false]) then {
  [_unit, true] call ace_medical_fnc_setUnconscious;
};

// Save data globally for JIP
_unit setVariable [QGVAR(headshotCount), _headShotCount, true];
_unit setVariable [QGVAR(currentHeadDamage), _fullDamage, true];
_unit setVariable [QGVAR(headDamageHealTick), _fullDamage / 60, true];
