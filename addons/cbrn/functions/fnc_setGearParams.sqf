#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets CBRN params for given gear item
 */

params [
  ["_className", "", [""]],
  ["_airFilter", 0, [0]],
  ["_protectedParts", [], [[]]]
];

private _gearSettings = missionNamespace getVariable [QGVAR(gearSettings), []];
private _gearParams = missionNamespace getVariable [QGVAR(gearParams), []];

_gearSettings pushBack _className;
_gearParams pushBack [_airFilter, _protectedParts];

missionNamespace setVariable [QGVAR(gearSettings), _gearSettings, true];
missionNamespace setVariable [QGVAR(gearParams), _gearParams, true];
