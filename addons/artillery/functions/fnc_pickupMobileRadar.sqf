#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Pickup mobile artillery radar
 */

params ["_target", "_player"];
TRACE_2("pickupMobileRadar",_target,_player);

if !(alive _target) exitWith {};

if (!([_player, "a4es_mobileArtilleryRadarItem"] call CBA_fnc_canAddItem)) exitWith {
  [LSTRING(NoPlaceInInventory)] call ACEFUNC(common,displayTextStructured);
};

_player playActionNow "PutDown";

[{
  params ["_target", "_player"];

  // Check is radar is still there
  if (isNull _target) exitWith {};

  // Check is there still room in inventory
  if (!([_player, "a4es_mobileArtilleryRadarItem"] call CBA_fnc_canAddItem)) exitWith {
    [LSTRING(NoPlaceInInventory)] call ACEFUNC(common,displayTextStructured);
  };

  // Pickup
  deleteVehicle _target;
  _player addItem "a4es_mobileArtilleryRadarItem";

  // A4ES Server event
  ["a4es_mobileArtRadarPickedUp", [_player, "a4es_mobileArtilleryRadarItem"]] call CBA_fnc_serverEvent;
}, [_target, _player], 1] call CBA_fnc_waitAndExecute;
