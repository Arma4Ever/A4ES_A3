/*
 * Author: SzwedzikPL
 * Init vehicle
 */
#include "script_component.hpp"

params ["_object"];

private _class = typeof _object;

if (_class in GVAR(initializedClasses)) exitWith {};
GVAR(initializedClasses) pushBack _class;

private _canDisassemble = (count getArray (configfile >> "CfgVehicles" >> _class >> "assembleInfo" >> "dissasembleTo") > 0);
private _isUAV = getNumber (configfile >> "CfgVehicles" >> _class >> "isUav") > 0;
private _isAir = _object isKindOf "Air";
private _isMan = _object isKIndOf "Man";

if (!_isMan) then {
    private _checkDocAction = [
        QGVAR(checkVehicleDoc),
        localize LSTRING(Actions_CheckVehicleDoc),
        "",
        {_this call DFUNC(checkVehicleDoc)},
        {true}
    ] call ace_interact_menu_fnc_createAction;
    [_class, 1, ["ACE_SelfActions"], _checkDocAction] call ace_interact_menu_fnc_addActionToClass;
};

if (_canDisassemble) then {
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

if (!_isUAV && !_isAir) then {
    private _fixPositionAction = [
        QGVAR(fixPosition),
        localize LSTRING(Actions_TurnVehicle),
        "",
        {
            private _posASL = (getPosASL _target);
            private _posASLNew = (getPosASL _target);
            _posASL vectorAdd [0,0,0.3];
            _posASLNew vectorAdd [0,0,2];
            _target setVectorUp [0,0,1];
            _target setPosASL _posASL;
        },
        {
            alive _target &&
            {alive ace_player} &&
            {driver _target isEqualTo ace_player} &&
            {((vectorUp _target) select 2) < -0.4} &&
            {_target getVariable [QGVAR(disallowTurnVehicle), 0] == 0}
        }
    ] call ace_interact_menu_fnc_createAction;
    [_class, 1, ["ACE_SelfActions"], _fixPositionAction] call ace_interact_menu_fnc_addActionToClass;
};
