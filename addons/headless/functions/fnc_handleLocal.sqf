#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles unit locality change
 */

params ["_unit", "_local"];

// Exit if unit is not local
if !(_local) exitWith {};

LOG_1("Handling local change for unit %1.",str _unit);

// Reexecute 3DEN unit init
_unit call EFUNC(editor,initUnit);

// Fix loadout bug
if ((uniform _unit) isEqualTo "") then {
  LOG("Naked unit detected.");
  _unit setUnitLoadout (_unit getVariable [QGVAR(loadout), typeOf _unit]);
};

// Reapply AI features
{
  if (_x # 1) then {
    _unit enableAI (_x # 0);
  } else {
    _unit disableAI (_x # 0);
  };
} forEach (_unit getVariable [QGVAR(AIFeatures), []]);
