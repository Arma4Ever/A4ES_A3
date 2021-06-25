/*
 * Author: SzwedzikPL
 * Toggle curator access
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcAdminPanel.hpp"

params [["_force", false, [false]]];

private _access = "debugcurator" call FUNC(canAccessPanelModule);
if (!_access && !_force) exitWith {hint localize LSTRING(NoAccess);};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if (isNull _display && !_force) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};

private _actionConfig = (configFile >> QGVAR(modules) >> "debugcurator");
private _actionName = getText (_actionConfig >> "displayName");
private _actionValues = getArray (_actionConfig >> "values");
private _actionVariable = getText (_actionConfig >> "variable");
private _buttonControl = controlNull;

if (!_force) then {
  private _buttonIndex = GVAR(panelActiveButtonsActions) find "debugcurator";
  if (_buttonIndex < 0) exitWith {};
  _buttonControl = _display displayCtrl (GVAR(panelActiveButtons) select _buttonIndex);
};

if (!GVAR(debugCuratorEnabled)) then {
  if (!isNull (getAssignedCuratorLogic player)) exitWith {};

  missionNamespace setVariable [_actionVariable, 1];
  if (!_force) then {_buttonControl ctrlSetText format [_actionName, _actionValues select 1];};
  GVAR(debugCuratorEnabled) = true;
  [player] remoteExecCall [QFUNC(addAdminCurator), 2];
} else {
  if (isNull (getAssignedCuratorLogic player)) exitWith {};
  missionNamespace setVariable [_actionVariable, 0];
  if (!_force) then {_buttonControl ctrlSetText format [_actionName, _actionValues select 0];};
  GVAR(debugCuratorEnabled) = false;
  [player] remoteExecCall [QFUNC(removeAdminCurator), 2];
};
