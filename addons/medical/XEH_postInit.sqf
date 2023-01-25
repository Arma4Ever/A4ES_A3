#include "script_component.hpp"

/*
["ace_killed", {
  params ["_unit", "", "_killer", "_instigator"];
  diag_log ["killed", _unit, _killer, _instigator];
}] call CBA_fnc_addEventHandler;
*/

if (hasInterface) then {
  // Exit if curator/spectator
  if ((side (group player)) isEqualTo sideLogic) exitWith {};

  addMissionEventHandler ["EntityKilled", {
    _this call FUNC(handleEntityKilled);
  }];

  // Add friendly-fire logging
  ["ace_medical_woundReceived", {
    _this call FUNC(handleFriendlyFire);
  }] call CBA_fnc_addEventHandler;

  // Head damage healing
  [{
    params ["_player", "_handle"];

    if !(alive _player) exitWith {[_handle] call CBA_fnc_removePerFrameHandler;};
    private _headDamage = _player getVariable [QGVAR(currentHeadDamage), 0];
    if (_headDamage <= 0) exitWith {};

    private _newDamage = (_headDamage - (_player getVariable [QGVAR(headDamageHealTick), 0])) max 0;

    // Reset diagnosed injuries if fully healed
    if (_newDamage == 0) then {
      _player setVariable [QGVAR(diagnosedBrainInjuries), [], true];
    };

    // Update current head dmg
    _player setVariable [
      QGVAR(currentHeadDamage),
      _newDamage,
      true
    ];
  }, 60, player] call CBA_fnc_addPerFrameHandler;

  ["ace_medical_woundReceived", {
    _this call FUNC(handleHeadshot);
  }] call CBA_fnc_addEventHandler;
};
