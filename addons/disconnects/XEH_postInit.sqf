#include "script_component.hpp"

[QGVAR(lockUnit), {_this call FUNC(lockUnit)}] call CBA_fnc_addEventHandler;
[QGVAR(unlockUnit), {_this call FUNC(unlockUnit)}] call CBA_fnc_addEventHandler;
[QGVAR(prepForUnlock), {_this call FUNC(prepForUnlock)}] call CBA_fnc_addEventHandler;

if (hasInterface) then {
  // Exit for curators
  if ((side (group player)) isEqualTo sideLogic) exitWith {};
  [QGVAR(handleConnect), player] call CBA_fnc_serverEvent;
};

if (isServer) then {
  [QGVAR(handleConnect), {_this call FUNC(handleConnect)}] call CBA_fnc_addEventHandler;

  addMissionEventHandler ["HandleDisconnect", {
    params ["_unit"];
    _unit call FUNC(handleDisconnected);
    false
  }];
};
