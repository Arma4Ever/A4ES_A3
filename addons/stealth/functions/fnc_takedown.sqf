#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Silently takedowns cursorObject unit
 */

private _player = ace_player;

// Exit if player is in vehicle
if !(isNull (objectParent _player)) exitWith {};

private _target = cursorObject;

TRACE_2("takedown",_player,_target);

if (
  !(_target isKindOf "CAManBase") ||
  {!(alive _target)} ||
  //{isPlayer _target} || Check to friendly



  {(_player distance _target) > 2.4} ||
  {!(isNull (objectParent _target))} ||
  {(lineIntersectsSurfaces [
      getPosASL _player,
      getPosASL _target,
      _player,
      _target
    ]) isNotEqualTo []}
) exitWith {
  LOG("takedown aborted - invalid target");
};

// Play action
_player playActionNow "PutDown";

// Make target leave current group just before takedown
// This prevents AI from going into alert after group member is killed
[_target] joinSilent grpNull;

// Kill target
[{
  params ["_target"];
  //_target setDamage 1; - set dead reason: takedown
  private _group = group _target;
  [QEGVAR(common,deleteGroup), _group, _group] call CBA_fnc_targetEvent;
}, [_target], 0.5] call CBA_fnc_waitAndExecute;
