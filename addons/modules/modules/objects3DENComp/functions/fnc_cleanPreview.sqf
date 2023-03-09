#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Cleans 3DEN preview objects for objects3DENComp
 */

params ["_logic"];
TRACE_1("objects3DENComp_cleanPreview",_logic);

private _previewObjects = (_logic getVariable [QGVAR(previewObjects), [false, []]]) # 1;
{deleteVehicle _x} forEach _previewObjects;
_logic setVariable [QGVAR(previewObjects), [false, []]];