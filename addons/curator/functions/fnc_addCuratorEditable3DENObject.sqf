#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds all playable units to curator
 */

params ["_object"];

private _objects = missionNamespace getVariable [QGVAR(editable3DENObjects), []];
_objects pushBack _object;
