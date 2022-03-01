#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles surgicalkit success event
 */
params ["_medic", "_patient"];

// Send server log if medic is player
if !(_medic getVariable ["a3cs_common_isPlayer", false]) exitWith {};
if (_medic isEqualTo _patient) then {
  ["a3csserver_events_userStitchSelf", [_medic]] call CBA_fnc_serverEvent;
} else {
  if (_patient getVariable [QEGVAR(common,isPlayer), false]) then {
    ["a3csserver_events_userStitch", [_medic, _patient]] call CBA_fnc_serverEvent;
  } else {
    ["a3csserver_events_userStitchAI", [_medic]] call CBA_fnc_serverEvent;
  };
};
