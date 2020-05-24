#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates group dynamicSimulation attribute in 3DEN
 */

params ["_group"];

if (!is3DEN || {isNil "_group"} || {isNull _group}) exitWith {};

private _disabled = (_group get3DENAttribute QGVAR(disable)) # 0;
private _value = (_group get3DENAttribute "dynamicSimulation") # 0;

if (_disabled isEqualTo (!_value)) exitWith {};

_group set3DENAttribute ["dynamicSimulation", !_disabled];
