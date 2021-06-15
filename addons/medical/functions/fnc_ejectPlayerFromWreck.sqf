#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Ejects player from wreck
 */

params ["_player", "_vehicle"];
TRACE_2("ejectPlayerFromWreck",_player,_vehicle);

sleep (0.5 + (random 4));

private _curVehicle = objectParent _player;
if (
  // Player dead
  !(alive _player) ||
  // Trigger vehicle remobed
  {isNull _vehicle} ||
  // No vehicle
  {isNull _curVehicle} ||
  // Vehicle changed
  {_curVehicle isNotEqualTo _vehicle}
) exitWith {
  TRACE_3("ejectPlayerFromWreck exit: player dead or vehicle changed",_player,_curVehicle,_vehicle);
};

private _position = (position _vehicle) findEmptyPosition [4, 40, typeOf _player];

// No free pos in area, just kick him from vehicle and wish good luck
if (_position isEqualTo []) exitWith {
  TRACE_1("ejectPlayerFromWreck: no empty position - blind eject",_player);
  moveOut _player;
  if !(_player getVariable ["ACE_isUnconscious", false]) then {
    [QEGVAR(common,switchMove), [_player, "amovppnemstpsraswrfldnon"]] call CBA_fnc_globalEvent;
  };
};

// Move out to free pos
TRACE_2("ejectPlayerFromWreck: ejecting to free pos",_player,_position);
moveOut _player;
player setPos _position;
player setDir (random 360);
if !(_player getVariable ["ACE_isUnconscious", false]) then {
  [QEGVAR(common,switchMove), [_player, "amovppnemstpsraswrfldnon"]] call CBA_fnc_globalEvent;
};
