#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Generates onEntitiesInArea condition for module activator
 */

params ["_logic"];

private _logicArea = [getPos _logic];
_logicArea append (_logic getVariable ["objectarea", []]);

format ["
private _area = %1;
((_this # 1) findIf {!(_x inArea _area)}) isEqualTo -1
", str _logicArea]
