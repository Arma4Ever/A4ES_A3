#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * spawnObjects module function
 */

params ["_mode", "_input"];

if (_mode isEqualTo "init") exitWith {
  _input params ["_logic", "_isActivated", "_isCuratorPlaced"];

  // Exit if curator placed
  if (_isCuratorPlaced) exitWith {};

  if (_isActivated) then {

  } else {

  };
};

if (_mode isEqualTo "attributesChanged3DEN") exitWith {
  _input params ["_logic"];

  diag_log "attributesChanged3DEN";
  diag_log (_logic get3DENAttribute QGVAR(mode));
  diag_log (_logic get3DENAttribute QGVAR(data));
  diag_log "=============";
};

if (_mode isEqualTo "registeredToWorld3DEN") exitWith {
  _input params ["_logic"];

  diag_log "registeredToWorld3DEN";
};

if (_mode isEqualTo "unregisteredFromWorld3DEN") exitWith {
  _input params ["_logic"];

  diag_log "unregisteredFromWorld3DEN";
};

true
