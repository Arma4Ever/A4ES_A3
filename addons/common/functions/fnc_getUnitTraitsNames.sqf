#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns names of unit traits
 */

params ["_unit"];

private _traits = [];
private _medicClass = _unit getVariable [QACEGVAR(medical,medicClass), parseNumber (_unit getUnitTrait "medic")];
if (_medicClass > 0) then {
  _traits pushBack (localize ([
    LSTRING(Doctor),
    LSTRING(Medic)
  ] select (_medicClass isEqualTo 1)));
};

private _engineerClass = _unit getVariable ["ACE_IsEngineer", parseNumber (_unit getUnitTrait "engineer")];
// ACE_IsEngineer can be true/false or 0/1/2, ensure it's a number
_engineerClass = [0, 1, 2] select _engineerClass;
if (_engineerClass > 0) then {
  _traits pushBack (localize ([
    LSTRING(AdvEngineer),
    LSTRING(Engineer)
  ] select (_engineerClass isEqualTo 1)));
};

if (_unit call ACEFUNC(common,isEOD)) then {
  _traits pushback (LLSTRING(EOD));
};

_traits
