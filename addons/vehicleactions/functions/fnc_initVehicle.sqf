/*
 * Author: SzwedzikPL
 * Init vehicle
 */
#include "script_component.hpp"

params ["_object"];

private _class = typeof _object;

if(_class in GVAR(initializedClasses)) exitWith {};
GVAR(initializedClasses) pushBack _class;

private _canDisassemble = (count getArray (configfile >> "CfgVehicles" >> _class >> "assembleInfo" >> "dissasembleTo") > 0);
private _isUAV = getNumber (configfile >> "CfgVehicles" >> _class >> "isUav") > 0;

if(_canDisassemble) then {
    if (_isUAV) then {
        private _disassembleAction = [
            QGVAR(disassemble),
            localize LSTRING(Actions_DisassembleUAV),
            "",
            {_player action ["Disassemble", _target]},
            {
                alive _target &&
                {!(isEngineOn _target)} &&
                {_target getVariable [QGVAR(canDisassemble), true]}
            }
        ] call ace_interact_menu_fnc_createAction;
        [_class, 0, ["ACE_MainActions"], _disassembleAction] call ace_interact_menu_fnc_addActionToClass;
    } else {
        private _disassembleAction = [
            QGVAR(disassemble),
            localize LSTRING(Actions_Disassemble),
            "",
            {_player action ["Disassemble", _target]},
            {
                alive _target &&
                {count (crew _target) isEqualTo 0} &&
                {_target getVariable [QGVAR(canDisassemble), true]}
            }
        ] call ace_interact_menu_fnc_createAction;
        [_class, 0, ["ACE_MainActions"], _disassembleAction] call ace_interact_menu_fnc_addActionToClass;
    };
};
