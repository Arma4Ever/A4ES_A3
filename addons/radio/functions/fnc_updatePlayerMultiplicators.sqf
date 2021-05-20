#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates player updates player's TFAR distance multiplicators
 */

LOG("updatePlayerMultiplicators");

private _sendingMult = 1;
private _receivingMult = 1;

private _player = vehicle player;

{
  _x params ["_area", "_jammerSendingMult", "_jammerReceivingMult"];
  if (_player inArea _area) then {
    _sendingMult = _sendingMult * _jammerSendingMult;
    _receivingMult = _receivingMult * _jammerReceivingMult;
  };
} forEach (missionNamespace getVariable [QGVAR(radioJammers), []]);

{
  // Exit if mobile antenna in range - antenna effects do not stack
  if ((_player distance _x) < 7) exitWith {
    _sendingMult = _sendingMult * 2.5;
    _receivingMult = _receivingMult * 0.85;
  };
} forEach GVAR(mobileAntennas);

if ((player getVariable ["tf_sendingDistanceMultiplicator", 1]) isNotEqualTo _sendingMult) then {
  TRACE_1("sendingDistanceMultiplicator updated",_sendingMult);
  player setVariable ["tf_sendingDistanceMultiplicator", _sendingMult, true];
};

if ((player getVariable ["tf_receivingDistanceMultiplicator", 1]) isNotEqualTo _receivingMult) then {
  TRACE_1("receivingDistanceMultiplicator updated",_sendingMult);
  player setVariable ["tf_receivingDistanceMultiplicator", _receivingMult, true];
};
