#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init for mobile artillery radar object
 */
params ["_object"];
TRACE_1("initRadarObject",_object);

if (
  !isServer ||
  {_object in GVAR(activeRadars)}
) exitWith {};

GVAR(activeRadars) pushBack _object;
_object enableDynamicSimulation true;
_object addEventHandler ["deleted", {
  params ["_object"];
  GVAR(activeRadars) deleteAt (GVAR(activeRadars) find _object);
}];
