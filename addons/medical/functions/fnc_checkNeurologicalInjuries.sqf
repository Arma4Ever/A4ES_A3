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
// diag_log ["_headShotCount", _headShotCount];
if (_headShotCount == 0) exitWith {
  [
    parseText format [
      "<t size='1.2'>%1</t>", "Brak oznak przebytych urazów neurologicznych."
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
  format ["Widoczne oznaki po przebytych %1 urazach neurologicznych.", _headShotCount]
} else {
  "Widoczne oznaki po przebytym jednym urazie neurologicznym."
};

// ---- 2. Active head injuries
private _damage = _patient getVariable [QGVAR(currentHeadDamage), 0];
// diag_log ["_damage", _damage];
private _chance = (linearConversion [
  MEDICAL_HEADSHOT_MIN_DAMAGE,
  MEDICAL_HEADSHOT_SCALE_MAX_DAMAGE,
  _damage,
  0,
  MEDICAL_HEADSHOT_SCALE_MAX_CHANCE
]) * 100;
// diag_log ["_chance", _chance];

private _activeInjuriesCount = (floor (_chance / 10)) + 1;
private _diagnosedBrainInjuries = _patient getVariable [QGVAR(diagnosedBrainInjuries), []];
private _diagnosedBrainInjuriesCount = count _diagnosedBrainInjuries;

//diag_log ["_activeInjuriesCount", _activeInjuriesCount];
//diag_log ["_diagnosedBrainInjuries", _diagnosedBrainInjuries];
//diag_log ["_diagnosedBrainInjuriesCount", _diagnosedBrainInjuriesCount];

if (_activeInjuriesCount > _diagnosedBrainInjuriesCount) then {
  private _possibleInjuries = [0,1,2,3,4,5,6,7,8,9,10,11,12,13];
  {
    _possibleInjuries deleteAt (_possibleInjuries find _x);
  } forEach _diagnosedBrainInjuries;

  private _newInjuries = _activeInjuriesCount - _diagnosedBrainInjuriesCount;
  for "_x" from 1 to _newInjuries do {
    _diagnosedBrainInjuries pushBack (_possibleInjuries deleteAt (floor (random (count _possibleInjuries))));
  };

  _patient setVariable [QGVAR(diagnosedBrainInjuries), _diagnosedBrainInjuries, true];
};

//diag_log ["_diagnosedBrainInjuries", _diagnosedBrainInjuries];

private _possibleInjuriesTexts = [
  "- Krwawienie podpajęczynówkowe.",
  "- Możliwy niewielki krwotok wewnętrzny.",
  "- Pourazowe uszkodzenie tkanek mózgu.",
  "- Obrzęk w zakresie lewej półkuli mózgu.",
  "- Obrzęk w zakresie prawej półkuli mózgu.",
  "- Narastający obrzęk mózgu.",
  "- Uraz głowy.",
  "- Uraz czaszki.",
  "- Uraz twarzo-czaszki.",
  "- Uraz czaszkowo-mózgowy.",
  "- Uszkodzenie płata skroniowego lewego.",
  "- Uszkodzenie płata skroniowego prawego.",
  "- Uszkodzenie kości potylicznej.",
  "- Wstrząśnienie mózgu."
];
private _activeInjuries = _diagnosedBrainInjuries apply {/*localize */(_possibleInjuriesTexts select _x)};
private _activeInjuriesText = "Aktywne urazy neurologiczne:<br/>" + (_activeInjuries joinString "<br/>");

// diag_log ["_activeInjuries", _activeInjuries];

// ---- 3. Death chance
private _chanceFormatText = switch true do {
	case (_chance > 40): {"Aktualny stan neurologiczny oceniam jako bardzo ciężki, bardzo znacząco podnosi prawdopodobieństwo zgonu przy kolejnym urazie głowy (~%1%2)."};
	case (_chance > 30): {"Aktualny stan neurologiczny oceniam jako ciężki, znacząco podnosi prawdopodobieństwo zgonu przy kolejnym urazie głowy (~%1%2)."};
  case (_chance > 20): {"Aktualny stan neurologiczny oceniam jako umiarkowany, zauważalnie podnosi prawdopodobieństwo zgonu przy kolejnym urazie głowy (~%1%2)."};
  case (_chance > 10): {"Aktualny stan neurologiczny oceniam jako lekki, w małym stopniu podnosi prawdopodobieństwo zgonu przy kolejnym urazie głowy (~%1%2)."};
  default {"Aktualny stan neurologiczny oceniam jako bardzo lekki, w niewielkim stopniu podnosi prawdopodobieństwo zgonu przy kolejnym urazie głowy (~%1%2)."};
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
