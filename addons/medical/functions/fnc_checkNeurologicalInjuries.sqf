#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Success callback for check head damage medical action
 */

params ["", "_patient"];

private _messageTitle = format ["Diagnoza neurologiczna: %1", _patient call EFUNC(common,getUnitName)];

if !(alive _patient) exitWith {
  [
    parseText format [
      "<t size='1.2'>%1</t>", "Brak oznak aktywności neurologicznej, pacjent nie żyje."
    ],
    _messageTitle,
    true,
    false,
    [] call BIS_fnc_displayMission,
    false,
    false
  ] spawn BIS_fnc_guiMessage;
};

private _headShotCount = _patient getVariable [QGVAR(headshotCount), 0];

#ifdef DEBUG_MODE_FULL
diag_log ["_headShotCount", _headShotCount];
#endif

if (_headShotCount == 0 || {!(_patient getVariable [QEGVAR(common,isPlayer), false])}) exitWith {
  [
    parseText format [
      "<t size='1.2'>%1</t>", LLSTRING(CheckNeurologicalInjuries_NoInjuries)
    ],
    _messageTitle,
    true,
    false,
    [] call BIS_fnc_displayMission,
    false,
    false
  ] spawn BIS_fnc_guiMessage;
};

// ---- 1. Injury count
private _injuryCountSignsText = if (_headShotCount > 1) then {
  format [LLSTRING(CheckNeurologicalInjuries_InjuryCountSigns_Many), _headShotCount]
} else {
  LLSTRING(CheckNeurologicalInjuries_InjuryCountSigns_One)
};

// ---- 2. Active head injuries
private _damage = (_patient getVariable [QGVAR(currentHeadDamage), 0]);
if (_damage == 0) exitWith {
  [
    parseText format [
      "<t size='1.1'>%1<br /><br />%2</t>", _injuryCountSignsText, LLSTRING(CheckNeurologicalInjuries_AllInjuriesHealed)
    ],
    _messageTitle,
    true,
    false,
    [] call BIS_fnc_displayMission,
    false,
    false
  ] spawn BIS_fnc_guiMessage;
};

private _chance = (linearConversion [
  0,
  MEDICAL_HEADSHOT_SCALE_MAX_DAMAGE - MEDICAL_HEADSHOT_MIN_DAMAGE,
  _damage,
  0,
  MEDICAL_HEADSHOT_SCALE_MAX_CHANCE
]) * 100;

private _activeInjuriesCount = (floor (_chance / 10)) + 1;
private _diagnosedBrainInjuries = _patient getVariable [QGVAR(diagnosedBrainInjuries), []];
private _diagnosedBrainInjuriesCount = count _diagnosedBrainInjuries;

#ifdef DEBUG_MODE_FULL
diag_log ["_damage", _damage];
diag_log ["_chance", _chance];
diag_log ["_activeInjuriesCount", _activeInjuriesCount];
diag_log ["_diagnosedBrainInjuries", _diagnosedBrainInjuries];
diag_log ["_diagnosedBrainInjuriesCount", _diagnosedBrainInjuriesCount];
#endif

if (_activeInjuriesCount > _diagnosedBrainInjuriesCount) then {
  private _possibleInjuries = [1,2,3,4,5,6,7,8,9,10,11,12,13,14];
  {
    _possibleInjuries deleteAt (_possibleInjuries find _x);
  } forEach _diagnosedBrainInjuries;

  private _newInjuries = _activeInjuriesCount - _diagnosedBrainInjuriesCount;
  for "_x" from 1 to _newInjuries do {
    _diagnosedBrainInjuries pushBack (_possibleInjuries deleteAt (floor (random (count _possibleInjuries))));
  };

  _patient setVariable [QGVAR(diagnosedBrainInjuries), _diagnosedBrainInjuries, true];
};

private _activeInjuries = _diagnosedBrainInjuries apply {
  localize format [LSTRING(CheckNeurologicalInjuries_PossibleInjuries_%1), _x]
};
private _activeInjuriesText = (LLSTRING(CheckNeurologicalInjuries_ActiveInjuriesText_Title)) + "<br/>" + (_activeInjuries joinString "<br/>");

#ifdef DEBUG_MODE_FULL
diag_log ["_diagnosedBrainInjuries new", _diagnosedBrainInjuries];
diag_log ["_activeInjuries", _activeInjuries];
#endif

// ---- 3. Death chance
private _chanceFormatText = switch true do {
	case (_chance > 40): {LLSTRING(CheckNeurologicalInjuries_ChanceText_40)};
	case (_chance > 30): {LLSTRING(CheckNeurologicalInjuries_ChanceText_30)};
  case (_chance > 20): {LLSTRING(CheckNeurologicalInjuries_ChanceText_20)};
  case (_chance > 10): {LLSTRING(CheckNeurologicalInjuries_ChanceText_10)};
  default {LLSTRING(CheckNeurologicalInjuries_ChanceText_Default)};
};
private _chanceText = format [_chanceFormatText, floor _chance, "%"];

// ---- 4. Heal time
private _headDamageHealTick = _patient getVariable [QGVAR(headDamageHealTick), 0];
private _fullHealTime = ceil (_damage / _headDamageHealTick);
private _aroundHealTime = (floor (_fullHealTime / 10)) * 10;
private _healTimeText = if (_aroundHealTime > 0) then {
  format [LLSTRING(CheckNeurologicalInjuries_HealText_around), _aroundHealTime]
} else {
  LLSTRING(CheckNeurologicalInjuries_HealText_few)
};
private _healText = format [LLSTRING(CheckNeurologicalInjuries_HealText), _healTimeText];

// ---- Show results
[
  parseText format [
    "<t size='1.1'>%1<br /><br />%2<br /><br />%3<br /><br />%4</t>", _injuryCountSignsText, _activeInjuriesText, _chanceText, _healText
  ],
  _messageTitle,
  true,
  false,
  [] call BIS_fnc_displayMission,
  false,
  false
] spawn BIS_fnc_guiMessage;
