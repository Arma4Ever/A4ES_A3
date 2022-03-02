#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Places mobile antenna in front of player
 */

params ["_target", "_player"];
TRACE_2("placeMobileAntenna",_target,_player);

_player playActionNow "PutDown";
_player removeItem "tfw_rf3080Item";

[{
  params ["_player"];

  private _dir = getDir _player;
  private _pos = (getPosASL _player) vectorAdd [1.6 * sin(_dir), 1.6 * cos(_dir), 0.03];

  private _antenna = "tfw_rf3080Object" createVehicle [0, 0, 0];
  _antenna setDir _dir;
  _antenna setPosASL _pos;

  if ((getPosATL _antenna select 2) - (getPos _antenna select 2) < 1E-5) then {
      _antenna setVectorUp (surfaceNormal (position _antenna));
  };

  // A3CSServer event
  ["a3csserver_events_userAntennaDep", [_player]] call CBA_fnc_serverEvent;
}, [_player], 1] call CBA_fnc_waitAndExecute;
