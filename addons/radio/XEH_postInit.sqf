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
