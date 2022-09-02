#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * setLogicFlagValue curator module function
 */

params ["_logic"];
deleteVehicle _logic;

private _flagIds = [];
private _flagNames = [];

{
  private _flagId = _x;
  private _flagName = _y;
  _flagIds pushBack _flagId;
  private _flagVar = format [QEGVAR(modules,%1), _flagId];
  _flagNames pushBack (_flagName + (format [
    " (%1)",
    [LELSTRING(Common,False), LELSTRING(Common,True)] select (missionNamespace getVariable [_flagVar, false])
  ]));
} forEach GVAR(logicFlags);

if (_flagIds isEqualTo []) exitWith {
  [LLSTRING(setLogicFlagValue_Message_NoLogicFlags)] call zen_common_fnc_showMessage;
};

[LLSTRING(setLogicFlagValue_displayName), [
  [
    "COMBO",
    LLSTRING(setLogicFlagValue_Attributes_Flag),
    [_flagIds, _flagNames, 0]
  ],
  [
    "TOOLBOX",
    LLSTRING(setLogicFlagValue_Attributes_Value),
    [0, 1, 2, [LELSTRING(Common,False), LELSTRING(Common,True)]]
  ]
], {
  params ["_values"];
  _values params ["_flagId", "_flagValue"];
  if (_flagId == "") exitWith {};
  private _flagName = GVAR(logicFlags) get _flagId;
  [QEGVAR(modules,setLogicFlagValue), [_flagId, [false, true] select _flagValue]] call CBA_fnc_serverEvent;
  [format [
    LLSTRING(setLogicFlagValue_Message_ValueChanged),
    _flagName,
    [LELSTRING(Common,False), LELSTRING(Common,True)] select _flagValue
  ]] call zen_common_fnc_showMessage;
}, {}, []] call zen_dialog_fnc_create;
