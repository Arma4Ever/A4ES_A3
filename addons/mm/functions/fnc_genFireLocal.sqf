/*
 * Author: SzwedzikPL
 * Check if module was executed (works only for disposable modules)
 */
#include "script_component.hpp"

params [["_logic", objNull, [objNull]]];

private _return = false;

if(is3DEN) then {
    _return = (getNumber (configFile >> "CfgVehicles" >> (typeOf _logic) >> "execIn3DEN")) > 0;
} else {
    _return = !(_logic getVariable [QGVAR(executed), false]);
};

_return
