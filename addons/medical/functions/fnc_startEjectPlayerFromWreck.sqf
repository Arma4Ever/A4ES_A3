#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Starts ejection player from wreck procedure
 */

params ["_player", "_vehicle"];
TRACE_2("startEjectPlayerFromWreck",_player,_vehicle);

// Wait a while (does not have to be precise)
sleep 2;

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
  TRACE_3("startEjectPlayerFromWreck exit: player dead or vehicle changed",_player,_curVehicle,_vehicle);
};

// Wait until wreck lands if in air
[{
  params ["_player", "_vehicle"];

  (
    !(alive _player) ||
    {isNull _vehicle} ||
    {((position _vehicle) # 2) < 8} ||
    {(objectParent _player) isNotEqualTo _vehicle}
  )
}, {
  _this spawn FUNC(ejectPlayerFromWreck);
}, [_player, _vehicle]] call CBA_fnc_waitUntilAndExecute;
