#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles curator pinged
 */

params ["_curator", "_player"];

if !(local _curator) exitWith {};

// Make sure curator module is assigned if curator unit is pinging
if (_player getVariable [QGVAR(isCurator), false]) then {
  [QGVAR(assignCuratorModule), [_player]] call CBA_fnc_serverEvent;
};

// Show ping on chat if player is active curator
if (hasInterface && {!(isNull (getAssignedCuratorLogic player))}) then {
  systemChat format [
    LLSTRING(CuratorPinged),
    _player call EFUNC(common,getUnitName)
  ];
};
