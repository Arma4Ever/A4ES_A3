#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns currently assigned map
 */

params ["_unit"];

private _item = (assignedItems _unit) param [0, ""];
if (_item isKindOf ["ItemMap", configFile >> "CfgWeapons"]) exitWith {_item};

""
