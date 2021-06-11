#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores units for 3DEN from module data
 */

params ["_logic"];
TRACE_1("units3DENComp_restoreData",_logic);

private _data = parseSimpleArray ((_logic get3DENAttribute QGVAR(data)) # 0);

if ((count _data) isEqualTo 2) then {
  _data params ["_vehiclesData", "_groupsData"];

  private _vehicles = _vehiclesData apply {
    [_logic, _x] call FUNC(units3DENComp_restoreData_vehicle);
  };

  {
    [_logic, _x, _vehicles] call FUNC(units3DENComp_restoreData_group);
  } forEach _groupsData;
} else {
  TRACE_1("units3DENComp_restoreData abort: invalid data",_data);
};

_logic set3DENAttribute [QGVAR(data), "[]"];
_logic set3DENAttribute [QGVAR(dataStats), ""];
_logic set3DENAttribute [QGVAR(dataSaved), false];
