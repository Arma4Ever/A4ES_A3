/*
 * Author: SzwedzikPL
 * Return status of attack from given trigger. Part of A3CS public API
 */
#include "script_component.hpp"

params [["_logic", objNull, [objNull]]];

if(isNull _logic) exitWith {-1};

private _return = 0;

if(_logic getVariable [QEGVAR(mm,genAttack_started), false]) then {
    _return = 2;
    if(_logic getVariable [QEGVAR(mm,genAttack_active), false]) then {
        _return = 1;
    };
};

_return
