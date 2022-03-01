#include "script_component.hpp"

if (hasInterface) then {
  // Exit if curator/spectator
  if ((side (group player)) isEqualTo sideLogic) exitWith {};

  addMissionEventHandler ["EntityKilled", {
    _this call FUNC(handleEntityKilled);
  }];

  // Add friendly-fire logging
  ["ace_medical_woundReceived", {
    params ["_unit", "", "", "_shooter", "_ammo"];

    if (
      (GVAR(ffReported)) ||
      {_unit isNotEqualTo player} ||
      {isNull _shooter} ||
      {!(_shooter getVariable [QEGVAR(common,isPlayer), false])} ||
      {(side (group _unit)) isNotEqualTo (side (group _shooter))}
    ) exitWith {};

    ["a3csserver_events_userFF", [_unit, _shooter, _ammo]] call CBA_fnc_serverEvent;

    // Wait 3 sec before we can report another FF
    GVAR(ffReported) = true;
    0 spawn {
      sleep 3;
      GVAR(ffReported) = false;
    };
  }] call CBA_fnc_addEventHandler;
};
