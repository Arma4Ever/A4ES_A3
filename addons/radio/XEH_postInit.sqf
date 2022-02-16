#include "script_component.hpp"

if !(hasInterface) exitWith {};

[QGVAR(onSpeak), "OnSpeak", {
  params ["_unit", "_isSpeaking"];
  LOG_1("TFAR OnSpeak event: %1",str _this);
  // Update speaking status var
  _unit setVariable [QGVAR(isSpeaking), _isSpeaking];
  // Call local for other addons
  [QGVAR(onSpeak), _this] call CBA_fnc_localEvent;
}, ObjNull] call TFAR_fnc_addEventHandler;

[QGVAR(onTangent), "OnTangent", {
  params ["_unit", "", "_radioType", "", "_isSpeaking"];
  LOG_1("TFAR OnTangent event: %1",str _this);

  if (_unit isNotEqualTo player) exitWith {};

  if (_isSpeaking) then {
    [_unit, _radioType] call FUNC(startedSpeaking);
  } else {
    [_unit] call FUNC(stoppedSpeaking);
  };
}, ObjNull] call TFAR_fnc_addEventHandler;

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
