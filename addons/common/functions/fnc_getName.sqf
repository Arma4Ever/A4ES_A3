/*
 * Author: SzwedzikPL
 * get unit name
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if (isNull _unit) exitWith {""};

private _unitName = _unit getVariable ["ACE_Name", name _unit];
if ((tolower _unitName) isEqualTo "error: no unit") then {
    _unitName = name _unit;
    _unit setVariable ["ACE_Name", _unitName, true];
};

_unitName
