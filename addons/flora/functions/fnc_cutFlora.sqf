#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Cut flora action
 */

params ["_player"];

TRACE_1("cutFlora",_player);

private _targetObject = 0 call FUNC(getCutFloraTarget);
if (isNull _targetObject) exitWith {
  LOG("targetObject not found");
  [LLSTRING(cutFlora_objectNotFound), 2] call ACEFUNC(common,displayTextStructured);
};

private _bbr = boundingBoxReal _targetObject;
private _objHeight = abs (((_bbr # 1) # 2) - ((_bbr # 0) # 2));

// 0.95s every 1m
private _actionTime = _objHeight * 0.95;

TRACE_2("cutFlora object data",_targetObject,_actionTime);

[_actionTime, [_targetObject], {
  (_this # 0) params ["_targetObject"];
  [QGVAR(cutFloraObject), [_targetObject]] call CBA_fnc_serverEvent;
  [LLSTRING(cutFlora_objectCut), 2] call ACEFUNC(common,displayTextStructured);
  // Reset animation
  [ace_player, "", 1] call ACEFUNC(common,doAnimation);
}, {
  // Reset animation
  [ace_player, "", 1] call ACEFUNC(common,doAnimation);
}, LLSTRING(cutFlora_cuttingObject), {true}] call ACEFUNC(common,progressBar);

// Play animation
[_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);
