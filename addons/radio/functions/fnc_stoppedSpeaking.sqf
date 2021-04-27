#include "script_component.hpp"
/*
 * Author: ACRE2Team, SzwedzikPL
 * Checks the unit isn't on radio and mid-reload then stops the gesture.
 */

params ["_unit"];
TRACE_1("stoppedSpeaking",_unit);

// If the unit started a reload while already talking, need to wait to finish to not delete a magazine
[
  {!ACEGVAR(common,isReloading)},
  {
    // Wait 1 frame as mag doesn't report as loaded til events completed
    [{_this call FUNC(stopGesture)}, _this] call CBA_fnc_execNextFrame;
  },
  _unit
] call CBA_fnc_waitUntilAndExecute;
