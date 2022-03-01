#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Places dressing set
 */

params ["_player"];

_player removeItem "A3CS_dressingSet";
_player playActionNow "PutDown";

[{
  params ["_player"];

  private _pos = _player modelToWorld [0, 1.2, 0];
  private _obj = QGVAR(dressingSet) createVehicle _pos;
  _obj setPos _pos;
}, [_player], 1] call CBA_fnc_waitAndExecute;
