#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Silently takedowns cursorObject unit
 */

// Exit if player is in vehicle
if !(isNull (objectParent ace_player)) exitWith {};

private _target = cursorObject;
// Exit if target is not a man
if !(_target isKindOf "CAManBase") exitWith {};

// Exit if target not alive, in vehicle or is player
if (!(alive _target) || !(isNull (objectParent _target)) || isPlayer _target) exitWith {};

// Exit if target is too far
if ((ace_player distance _target) > 2.4) exitWith {};

// Exit if there's something between player and target
if !(lineIntersectsSurfaces [
  getPosASL ace_player,
  getPosASL _target,
  ace_player,
  _target
] isEqualTo []) exitWith {};

// Play action
ace_player playActionNow "PutDown";

// Make target leave current group just before takedown
// This prevents AI from going into alert after group member is killed
[{
  [(_this # 0)] joinSilent grpNull;
}, [_target], 0.25] call CBA_fnc_waitAndExecute;

// Kill target
[{
  params ["_target"];
  _target setDamage 1;
  private _group = group _target;
  if (local _group) then {
    // Delete group if local
    deleteGroup _group;
  } else {
    // Mark for deletion if not local
    _group deleteGroupWhenEmpty true;
  };

}, [_target], 0.5] call CBA_fnc_waitAndExecute;
