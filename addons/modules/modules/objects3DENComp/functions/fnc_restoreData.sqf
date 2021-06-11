#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores units for 3DEN from module data
 */

params ["_logic"];
TRACE_1("units3DENComp_restoreData",_logic);

_logic call FUNC(objects3DENComp_cleanPreview);

private _data = parseSimpleArray ((_logic get3DENAttribute QGVAR(data)) # 0);

{
  [_logic, _x] call FUNC(objects3DENComp_restoreData_object);
} forEach _data;

_logic set3DENAttribute [QGVAR(data), "[]"];
_logic set3DENAttribute [QGVAR(dataStats), ""];
_logic set3DENAttribute [QGVAR(dataSaved), false];
