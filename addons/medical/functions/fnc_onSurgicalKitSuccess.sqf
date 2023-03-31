#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles surgicalkit success event
 */
params ["_medic", "_patient"];

if (_medic getVariable ["a4es_common_isPlayer", false]) then {
  if (_medic isEqualTo _patient) then {
    ["a4es_playerStitchSelf", [_medic]] call CBA_fnc_serverEvent;
  } else {
    ["a4es_playerStitch", [_medic, _patient]] call CBA_fnc_serverEvent;
  };
};
