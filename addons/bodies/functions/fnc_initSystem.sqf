#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits simple bodies system
 */

LOG("initSystem");

// Exit if system disabled
if (missionNamespace getVariable [QGVAR(systemDisabled), false]) exitWith {
  LOG("initSystem abort, system disabled");
};

addMissionEventHandler ["EntityKilled", {
	params ["_unit"];

  if (
    !(_unit isKindOf "CAManBase") ||
    {!(isNull (objectParent _unit))} ||
    {!(isInRemainsCollector _unit)} ||
    {isAgent teamMember _unit} ||
    {_unit getVariable [QGVAR(disableSimpleBody), false]}
  ) exitWith {};

  _unit spawn {
    sleep 3;
    // Wait until ragoll has ended
    waitUntil {
      sleep 1;
      !(isAwake _this);
    };
    // Unscheduled save of body data
    [FUNC(saveBodyData), _this] call CBA_fnc_directCall;
  };
}];

[QGVAR(systemInited), 0] call CBA_fnc_localEvent;
