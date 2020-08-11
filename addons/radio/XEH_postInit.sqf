#include "script_component.hpp"

["acre_remoteStartedSpeaking", {
  params ["_unit"];
  LOG_1("acre_remoteStartedSpeaking event: %1",str _this);
  // Update speaking status var
  _unit setVariable [QGVAR(isSpeaking), true];
  // Call local for other addons
  [QGVAR(onSpeak), [_unit, true]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["acre_remoteStoppedSpeaking", {
  params ["_unit"];
  LOG_1("acre_remoteStoppedSpeaking event: %1",str _this);
  // Update speaking status var
  _unit setVariable [QGVAR(isSpeaking), false];
  // Call local for other addons
  [QGVAR(onSpeak), [_unit, false]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

// Based of acre_gestures by diwako, modified by SzwedzikPL

GVAR(blackListAnims) = ["amovppnemstpsraswrfldnon", "aadjppnemstpsraswrfldleft", "aadjppnemstpsraswrfldright"];
GVAR(binoClasses) = "getText (_x >> 'simulation') == 'Binocular'" configClasses (configFile >> "CfgWeapons") apply {configName _x};

["acre_startedSpeaking", {
  params ["_unit", "_onRadio", "_radio"];

  if (
    !_onRadio
    || {!(isNull (objectParent _unit))}
    || {!(cameraView in ["INTERNAL", "EXTERNAL"])}
    || {ACEGVAR(common,isReloading)}
    || {isWeaponDeployed _unit}
    || {(animationState _unit) in GVAR(blackListAnims)}
    || {(currentWeapon _unit) in GVAR(binoClasses)}
  ) exitWith {};

  private _hasVest = !((vest _unit) isEqualTo "");
  private _hasHeadgear = !((headgear _unit) isEqualTo "");
  if (!_hasVest && !_hasHeadgear) exitWith {};

  private _shortRange = "343" in _radio;

  // 343 is vest mounted
  if (_hasVest && _shortRange) exitWith {
    _unit playActionNow "acre_radio_vest";
    _unit setVariable [QGVAR(gestureActive), true];
  };

  // 148/152 is ear piece
  if (_hasHeadgear && !_shortRange) then {
    _unit playActionNow "acre_radio_helmet";
    _unit setVariable [QGVAR(gestureActive), true];
  };
}] call CBA_fnc_addEventHandler;

["acre_stoppedSpeaking", {
  params ["_unit", "_onRadio"];

  if !(_onRadio && {_unit getVariable [QGVAR(gestureActive), false]}) exitWith {};

  if (ACEGVAR(common,isReloading)) then {
    // If the unit started a reload while already talking, need to wait to finish to not delete a magazine
    [
      {!ACEGVAR(common,isReloading)},
      {
        // Wait 1 frame as mag doesn't report as loaded til events completed
        [{_this call FUNC(stopGesture)}, _this] call CBA_fnc_execNextFrame;
      },
      _unit
    ] call CBA_fnc_waitUntilAndExecute;
  } else {
    _unit call FUNC(stopGesture);
  };
}] call CBA_fnc_addEventHandler;

player addEventHandler ["GetInMan", {
  params ["_unit"];

  _unit call FUNC(stopGesture);
}];

player addEventHandler ["WeaponDeployed", {
  params ["_unit", "_isDeployed"];

  if (_isDeployed) then {
    _unit call FUNC(stopGesture);
  };
}];
