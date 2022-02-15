#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Cut flora action
 */

params ["_player"];

TRACE_1("cutFlora",_player);

private _target = 0 call FUNC(getCutFloraTarget);
if (isNull _target) exitWith {
  LOG("targetObject not found");
  [LLSTRING(cutFlora_objectNotFound), 2] call ACEFUNC(common,displayTextStructured);
};

private _bbr = boundingBoxReal _target;
private _objHeight = abs (((_bbr # 1) # 2) - ((_bbr # 0) # 2));

// 0.5s every 1m
private _actionTime = _objHeight * 0.5;

TRACE_2("cutFlora object data",_target,_actionTime);

[_actionTime, [_target, _player], {
  (_this # 0) params ["_target", "_player"];
  [QGVAR(cutFloraObject), [_target]] call CBA_fnc_serverEvent;
  [LLSTRING(cutFlora_objectCut), 2] call ACEFUNC(common,displayTextStructured);
  // Reset animation
  [_player, "", 1] call ACEFUNC(common,doAnimation);
}, {
  (_this # 0) params ["_target", "_player"];
  // Reset animation
  [_player, "", 1] call ACEFUNC(common,doAnimation);
}, LLSTRING(cutFlora_cuttingObject), {true}] call ACEFUNC(common,progressBar);

// Play animation
[_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);
