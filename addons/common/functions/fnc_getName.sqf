/*
 * Author: SzwedzikPL
 * get unit name
 */
#include "script_component.hpp"

params ["_unit"];

private _unitName = _unit getVariable ["ACE_Name", name _unit];
if((tolower _unitName) == "error: no unit") then {_unitName = name _unit;};

_unitName
