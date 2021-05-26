#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows task notification globally
 */

params ["_id", "_state"];
TRACE_2("showTaskNotification",_id,_state);

if (CBA_missionTime < 5) exitWith {
  TRACE_2("Ignoring notification, mission start",_id,CBA_missionTime);
};

[{
  [QGVAR(taskNotification), _this] call CBA_fnc_globalEvent;
}, [_id, _state]] call CBA_fnc_execNextFrame;
