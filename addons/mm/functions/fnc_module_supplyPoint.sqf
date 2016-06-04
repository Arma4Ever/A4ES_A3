/*
 * Author: SzwedzikPL
 * supplyPoint module function
 */
#include "script_component.hpp"

if (!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if (_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if (isNull _logic || !_isActivated) exitWith {true};
    if (!(_logic call FUNC(canExecuteModule))) exitWith {WARNING("supplyPoint: blokuje wykonanie modulu");true};

    private _range = _logic getVariable ["range", 10];
    private _rearm = (_logic getVariable ["rearmPoint", 0]) > 0;
    private _refuel = (_logic getVariable ["refuelPoint", 0]) > 0;
    private _repair = (_logic getVariable ["repairPoint", 0]) > 0;
    private _objects = (synchronizedObjects _logic) select {_x isKindOf "All"};

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

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
};
// EDEN - When some attributes were changed (including position and rotation)
if (_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if (_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if (_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if (_mode == "connectionChanged3DEN") then {};

true
