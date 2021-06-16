#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Restores group for 3DEN from group data
 */

params ["_logic", "_groupData", "_vehicles"];
TRACE_3("units3DENComp_restoreData_group",_logic,_groupData,_vehicles);

_groupData params [
  "_sideId",
  "_unitsData",
  "_waypointsData",
  "_combatMode",
  "_behaviour",
  "_formation",
  "_speedMode",
  "_garbageCollectGroup",
  "_dynamicSimulation",
  "_enableGunLights",
  "_lambsDangerDisableGroupAI",
  "_lambsDangerEnableGroupReinforce"
];

if (_unitsData isEqualTo []) exitWith {
  ERROR("units3DENComp_restoreData_group abort: unitsData is empty");
};

if !(_sideId in [0,1,2,3]) exitWith {
  ERROR_1("units3DENComp_restoreData_group abort: invalid group sideId (sideId: %1)",str _sideId);
};
private _firstUnitClassName = ["O_Soldier_F", "B_Soldier_F", "I_soldier_F", "C_man_1"] select _sideId;
private _firstUnit = create3DENEntity ["object", _firstUnitClassName, [0,0,0]];
private _group = group _firstUnit;
if (isNull _group) exitWith {
  ERROR_1("units3DENComp_restoreData_group abort: cannot create new group (side: %1)",str _side);
};

_group set3DENAttribute ["combatMode", _combatMode];
_group set3DENAttribute ["behaviour", _behaviour];
_group set3DENAttribute ["formation", _formation];
_group set3DENAttribute ["speedMode", _speedMode];
_group set3DENAttribute ["garbageCollectGroup", _garbageCollectGroup];
_group set3DENAttribute ["dynamicSimulation", _dynamicSimulation];
_group set3DENAttribute [QEGVAR(editor,dynamicSimulationInited), true];
_group set3DENAttribute [QEGVAR(editor,enableGunLights), _enableGunLights];
_group set3DENAttribute ["lambs_danger_disableGroupAI", _lambsDangerDisableGroupAI];
_group set3DENAttribute ["lambs_danger_enableGroupReinforce", _lambsDangerEnableGroupReinforce];

{
  [_logic, _group, _x, _vehicles] call FUNC(units3DENComp_restoreData_unit);
  if (_forEachIndex isEqualTo 0) then {
    delete3DENEntities [_firstUnit];
  };
} forEach _unitsData;

{
  [_group, _x] call FUNC(units3DENComp_restoreData_waypoint);
} forEach _waypointsData;
