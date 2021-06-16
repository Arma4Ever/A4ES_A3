#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Generates onAreaCleared condition for module activator
 */

params ["_logic"];

private _logicArea = [getPos _logic];
_logicArea append (_logic getVariable ["objectarea", []]);

private _logicRange = (_logicArea # 1) max (_logicArea # 2);
if (_logicArea # 4) then {_logicRange = _logicRange * 1.4};

private _side = ["west", "east", "independent", "civilian"] param [
  _logic getVariable [QGVAR(side), 0],
  "west"
];

format ["
private _area = %1;
((_this nearEntities [['CAManBase', 'Car', 'Tank', 'Ship', 'StaticWeapon'], %2]) findIf {
  ((side (group (effectiveCommander _x))) isEqualTo %3) &&
  {_x inArea _area}
}) isEqualTo -1
", str _logicArea, _logicRange, _side]
