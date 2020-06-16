#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if given unit an ACE medic (without location boosting)
 */

params ["_unit", ["_minClass", 1, [1]]];

private _class = _unit getVariable [QACEGVAR(medical,medicClass), parseNumber (_unit getUnitTrait "medic")];

_class >= _minClass
