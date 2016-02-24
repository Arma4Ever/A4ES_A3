/*
 * Author: SzwedzikPL
 * Makes module disposable if possible
 */
#include "script_component.hpp"

params [["_logic", objNull, [objNull]]];

_isDisposable = (getNumber (configFile >> "CfgVehicles" >> (typeof _logic) >> "disposable")) > 0;

if(_isDisposable) then {
    _logic setVariable [QGVAR(executed), true, true];
};

_isDisposable
