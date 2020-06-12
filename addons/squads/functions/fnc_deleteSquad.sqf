#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Deletes squad
 */

params ["_squad"];

// Exit if not on server
if !(isServer) exitWith {};

LOG_2("Deleting squad %1 (squad unit: %2)",str _squad,str (_squad call FUNC(getSquadUnits)));

// Delete squad
_squad call CBA_fnc_deleteNamespace;
