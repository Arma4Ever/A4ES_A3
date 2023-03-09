#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits simple bodies system
 */

LOG("initSystem");

if !(isServer) exitWith {};

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
    {surfaceIsWater (getPos _unit)} ||
    {isAgent teamMember _unit} ||
    {_unit getVariable [QGVAR(disableSimpleBody), false]} ||
    {missionNamespace getVariable [QGVAR(systemDisabled), false]}
  ) exitWith {};

  TRACE_1("Scheduling convertion of corpse",_unit);

  // Remove from remains collector to prevent deletion of corpse
  removeFromRemainsCollector [_unit];
  // Schedule adding corpse to simple bodies system
  [{_this call FUNC(addCorpseToSystem);}, [_unit], (25 + random 3)] call CBA_fnc_waitAndExecute;
}];

LOG("System started");
[QGVAR(systemInited), true] call CBA_fnc_localEvent;
