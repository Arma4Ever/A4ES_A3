#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles unit locality change
 */

params ["_unit", "_local"];

// Exit if unit is not local
if !(_local) exitWith {};

LOG_1("Handling local change for unit %1.",str _unit);

// Fix loadout bug
if ((uniform _unit) isEqualTo "") then {
  LOG("Naked unit detected.");
  _unit setUnitLoadout (_unit getVariable [QGVAR(loadout), typeOf _unit]);
};

// Exit if unit not alive
if !(alive _unit) exitWith {};

// Reexecute 3DEN unit init
_unit call EFUNC(editor,initUnit);

// Reapply AI features
{
  _unit disableAI _x;
} forEach (_unit getVariable [QGVAR(disabledAI), []]);

if (isServer) then {
  // Schedule transfer to HC if unit is local for server
  call FUNC(scheduleTransfer);
};
