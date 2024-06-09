#include "script_component.hpp"

// Mark units ever taken by players
player setVariable [QGVAR(isPlayer), true, true];
player setVariable [QGVAR(UID), getPlayerUID player, true];
(group player) setVariable [QGVAR(playerGroup), true, true];

// Send global event after mission start to remove reliance on broken didJIP command
if (isServer) then {
  [{
    LOG("Event: a4es_missionStart");
    ["a4es_missionStart", 0] call CBA_fnc_globalEvent;
  }, [], 0.01] call CBA_fnc_waitAndExecute;
};

if (hasInterface) then {
  0 spawn {
    sleep 1;
    if ((side (group player)) isEqualTo sideLogic) exitWith {};
    private _rank = player call a4es_nametags_fnc_getUnitRank;
    ["a4es_playerRank", [profileName, getPlayerUID player, _rank # 0]] call CBA_fnc_serverEvent;
  };
};