#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * setTaskState curator module function
 */

params ["_logic"];
deleteVehicle _logic;

private _taskIds = [];
private _taskNames = [];

{
  private _taskId = _x;
  private _task = _y;

  private _taskName = taskName _task;
  private _taskStateLoc = format ["$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_%1_0", taskState _task];

  _taskIds pushBack _taskId;
  _taskNames pushBack (_taskName + " (" + (localize _taskStateLoc) + ")");
} forEach EGVAR(tasks,tasks);

if (_taskIds isEqualTo []) exitWith {
  [LLSTRING(setTaskState_Message_NoTasks)] call zen_common_fnc_showMessage;
};

[LLSTRING(setTaskState_displayName), [
  [
    "COMBO",
    LLSTRING(setLogicFlagValue_Attributes_Flag),
    [_taskIds, _taskNames, 0]
  ],
  [
    "TOOLBOX",
    LLSTRING(setLogicFlagValue_Attributes_Value),
    [0, 1, 5, [
      "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Created_0",
      "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Assigned_0",
      "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Succeeded_0",
      "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Failed_0",
      "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_Canceled_0"
    ]]
  ],
  ["TOOLBOX:YESNO", LLSTRING(setTaskState_Attributes_ShowNotification), true]
], {
  params ["_values"];
  _values params ["_taskId", "_stateId", "_showNotification"];
  [QEGVAR(tasks,setTaskStateServer), [_taskId, _stateId, _showNotification]] call CBA_fnc_serverEvent;

  private _task = EGVAR(tasks,tasks) get _taskId;
  private _taskStateLoc = localize (format [
    "$STR_A3_CfgVehicles_ModuleTaskSetState_F_Arguments_State_Values_%1_0",
    _stateId call EFUNC(tasks,getTaskStateClass)
  ]);

  [format [
    LLSTRING(setTaskState_Message_StateChanged),
    taskName _task,
    _taskStateLoc
  ]] call zen_common_fnc_showMessage;
}, {}, []] call zen_dialog_fnc_create;
