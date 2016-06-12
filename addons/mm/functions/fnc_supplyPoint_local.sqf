/*
 * Author: SzwedzikPL
 * Supply point local init
 */
#include "script_component.hpp"

params ["_rearm", "_refuel", "_repair", "_range", "_objects"];

{
    private _object = _x;
    private _supplyPointAction = [
        QGVAR(SupplyPointMainActions),
        localize LSTRING(Module_SupplyPoint_Action_Actions_DisplayName),
        "",
        {},
        {true},
        DFUNC(supplyPoint_actions),
        [_range, _rearm, _refuel, _repair]
    ] call ace_interact_menu_fnc_createAction;
    [_object, 0, ["ACE_MainActions"], _supplyPointAction] call ace_interact_menu_fnc_addActionToObject;
} foreach _objects;
