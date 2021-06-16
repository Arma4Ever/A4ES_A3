#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Assigns given unit a curator module
 */

params ["_unit", ["_clientPostInit", false, [false]]];
TRACE_2("assignCuratorModule",_unit,_clientPostInit);

// Exit if unit is not zeus
if !(_unit getVariable [QGVAR(isCurator), false]) exitWith {};

// Exit if unit already assigned
private _currentModule = getAssignedCuratorLogic _unit;
if !(isNull _currentModule) exitWith {};

LOG_2("Assigning curator module to '%1' (clientPostInit: %2)",_unit,str _clientPostInit);

private _assignedModule = _unit getVariable [QGVAR(assignedModule), objNull];
if (isNull _assignedModule) then {
  _assignedModule = 0 call FUNC(createCuratorModule);
  _unit setVariable [QGVAR(assignedModule), _assignedModule];
};

_unit assignCurator _assignedModule;
if (_clientPostInit) then {
  private _curatorsCount = count allCurators;
  [QGVAR(curatorModuleAssigned), [_curatorsCount], _unit] call CBA_fnc_targetEvent;
};
