#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits units attributes based on 3DEN settings
 */

params ["_unit"];

if !(local _unit) exitWith {};

LOG_1("Executing 3DEN unit init for %1 unit",str _unit);

// doStop
if (_unit getVariable [QGVAR(doStop), false]) then {
  doStop _unit;
};

// Try to force gun lights
if (_unit getVariable [QGVAR(forceGunLights), false]) then {
  _unit enableGunLights 'ForceOn';
  _unit spawn {
    // Really try to force gun lights
    for "_i" from 0 to 4 do {
      if !(local _this) exitWith {};
      _this enableGunLights 'ForceOn';
      sleep 0.2;
    };
  };
};
