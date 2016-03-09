/*
 * Author: SzwedzikPL
 * Init static weapon
 */
#include "script_component.hpp"

params ["_object"];

private _class = typeof _object;

if(_class in GVAR(initializedClasses)) exitWith {};
GVAR(initializedClasses) pushBack _class;

private _canDisassemble = (count getArray (configfile >> "CfgVehicles" >> _class >> "assembleInfo" >> "dissasembleTo") > 0);

if(_canDisassemble) then {
    private _disassembleAction = [QGVAR(disassemble), localize LSTRING(Actions_Disassemble), "", {_player action ["Disassemble", _target]}, {_target getVariable [QGVAR(canDisassemble), true]}] call ace_interact_menu_fnc_createAction;
    [_class, 0, ["ACE_MainActions"], _disassembleAction] call ace_interact_menu_fnc_addActionToClass;
};
