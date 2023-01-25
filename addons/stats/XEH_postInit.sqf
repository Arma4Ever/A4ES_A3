#include "script_component.hpp"

if (
  !hasInterface ||
  {!isMultiplayer} ||
  {(side (group player)) isEqualTo sideLogic}
) exitWith {};

GVAR(traveledDist) = 0;
GVAR(shots) = createHashMap;
GVAR(grenades) = 0;
GVAR(woundsReceived) = 0;
GVAR(damageReceived) = 0;
GVAR(bloodLost) = 0;

GVAR(lastPos) = getPos (vehicle player);
GVAR(lastBloodVol) = player getVariable ["ace_medical_bloodVolume", 6];

player addEventHandler ["FiredMan", {
  params ["", "_weapon", "", "", "_ammo"];

  if (_weapon == "Throw") then {
    GVAR(grenades) = GVAR(grenades) + 1;
    ["a4esserver_events_userGrenThrow", [player, _ammo]] call CBA_fnc_serverEvent;
  } else {
    private _shots = GVAR(shots);
    if (_weapon in _shots) then {
      _shots set [_weapon, (_shots get _weapon) + 1];
    } else {
      _shots set [_weapon, 1];
    };
  };
}];

["ace_advanced_throwing_throwFiredXEH", {
  params ["_unit", "", "", "", "_ammo"];
  if (_unit isNotEqualTo player) exitWith {};
  GVAR(grenades) = GVAR(grenades) + 1;
  ["a4esserver_events_userGrenThrow", [player, _ammo]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["ace_medical_woundReceived", {
  params ["_unit", "_damages"];
  if (_unit != player) exitWith {};
  GVAR(woundsReceived) = GVAR(woundsReceived) + 1;

  private _damage = 0;
  {
      _damage = _damage + ((_x # 0) max (_x # 2));
  } forEach _damages;

  GVAR(damageReceived) = GVAR(damageReceived) + _damage;
}] call CBA_fnc_addEventHandler;

// Add traveled distance updater PFH
[{
  private _curPos = getPos (vehicle player);
  GVAR(traveledDist) = GVAR(traveledDist) + (GVAR(lastPos) distance _curPos);
  GVAR(lastPos) = _curPos;

  if !(alive player) exitWith {
    (_this # 1) call CBA_fnc_removePerFrameHandler;
  };
}, 2] call CBA_fnc_addPerFrameHandler;

[{
  private _bloodVol = player getVariable ["ace_medical_bloodVolume", 6];

  if (_bloodVol != GVAR(lastBloodVol)) then {
    private _loss = GVAR(lastBloodVol) - _bloodVol;
    if (_loss > 0) then {
      GVAR(bloodLost) = GVAR(bloodLost) + _loss;
    };

    GVAR(lastBloodVol) = _bloodVol;
  };

  if !(alive player) exitWith {
    (_this # 1) call CBA_fnc_removePerFrameHandler;
  };
}, 1] call CBA_fnc_addPerFrameHandler;

// Add server updates PFH
[{
  [
    "a4esserver_stats_updatePlayer",
    [
      getPlayerID player,
      getPlayerUID player,
      floor GVAR(traveledDist),
      GVAR(shots),
      GVAR(grenades),
      GVAR(woundsReceived),
      GVAR(damageReceived),
      GVAR(bloodLost) toFixed 3
    ]
  ] call CBA_fnc_serverEvent;

  // Reset
  GVAR(traveledDist) = 0;
  GVAR(shots) = createHashMap;
  GVAR(grenades) = 0;
  GVAR(woundsReceived) = 0;
  GVAR(damageReceived) = 0;
  GVAR(bloodLost) = 0;

  if !(alive player) exitWith {
    (_this # 1) call CBA_fnc_removePerFrameHandler;
  };
}, 60] call CBA_fnc_addPerFrameHandler;
