#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles spawn of units during mission
 */

params ["_unit"];

LOG_1("Handling unit spawn (unit: %1)",str _unit);

// Exit if:
if (
  // Unit is not simulated AI unit
  !(_unit in allUnits)
  // Unit is not alive (spawned as corpse)
  || {!(alive _unit)}
  // Is player
  || {isPlayer _unit}
  // Unit has disabledTransfers flag
  || {(_unit getVariable [QGVAR(disableTransfer), false])}
) exitWith {};

call FUNC(scheduleTransfer);
