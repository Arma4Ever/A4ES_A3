#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows projectile debug path
 */

params ["_projectile"];
TRACE_1("showDebug",_projectile);

if !(is3DENPreview) exitWith {};

private _helpers = [];
while {alive _projectile} do {
  _helpers pushBack (createSimpleObject ["Sign_Sphere200cm_F", getPosASL _projectile]);
  sleep 0.1;
};
{deleteVehicle _x} forEach _helpers;
