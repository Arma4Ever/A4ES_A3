#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Places mobile radar in front of player
 */

params ["_target", "_player"];
TRACE_2("placeMobileRadar",_target,_player);

_player playActionNow "PutDown";
_player removeItem "a4es_mobileArtilleryRadarItem";

[{
  params ["_player"];

  private _dir = getDir _player;
  private _pos = (getPosASL _player) vectorAdd [1.6 * sin(_dir), 1.6 * cos(_dir), 0.03];

  private _radar = "a4es_mobileArtilleryRadar" createVehicle [0, 0, 0];
  _radar setDir _dir;
  _radar setPosASL _pos;

  if ((getPosATL _radar select 2) - (getPos _radar select 2) < 1E-5) then {
      _radar setVectorUp (surfaceNormal (position _radar));
  };

  // A4ESServer event
  ["a4esserver_events_userArtRadDep", [_player]] call CBA_fnc_serverEvent;
}, [_player], 1] call CBA_fnc_waitAndExecute;
