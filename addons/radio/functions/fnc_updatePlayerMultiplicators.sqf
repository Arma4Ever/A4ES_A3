#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates player updates player's TFAR distance multiplicators
 */

LOG("updatePlayerMultiplicators");

private _sendingMult = 1;
private _receivingMult = 1;

{
  // TODO!
} forEach GVAR(jammers);

{
  // Exit if mobile antenna in range - antenna effects do not stack
  if ((player distance _x) < 7) exitWith {
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
