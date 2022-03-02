#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Picks up dressing set if possible
 */

params ["_target", "_player"];
TRACE_2("pickUpDressingSet",_target,_player);

if !(alive _target) exitWith {};

if (!([_player, "A3CS_dressingSet"] call CBA_fnc_canAddItem)) exitWith {
  [LSTRING(DressingSet_NoPlaceInInventory)] call ACEFUNC(common,displayTextStructured);
};

_player playActionNow "PutDown";

[{
  params ["_target", "_player"];

  // Check is dressing set is still there
  if (isNull _target) exitWith {};

  // Check is there still room in inventory
  if (!([_player, "A3CS_dressingSet"] call CBA_fnc_canAddItem)) exitWith {
    [LSTRING(DressingSet_NoPlaceInInventory)] call ACEFUNC(common,displayTextStructured);
  };

  // Pickup
  deleteVehicle _target;
  _player addItem "A3CS_dressingSet";

  // A3CSServer event
  ["a3csserver_events_userDressSetRem", [_player]] call CBA_fnc_serverEvent;
}, [_target, _player], 1] call CBA_fnc_waitAndExecute;
