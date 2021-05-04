#include "script_component.hpp"

#ifndef DEBUG_MODE_FULL
  // Exit if not multiplayer or has interface (not server nor headless)
	if (!isMultiplayer || hasInterface) exitWith {};
#else
  // Debug - player will be treated as headless
	if (!isMultiplayer) exitWith {};
#endif

if (isServer) then {
  // Handle HC disconnect
  addMissionEventHandler ["HandleDisconnect", {
    params ["_object"];
    if (_object isNotEqualTo GVAR(headlessClient)) exitWith {false};
    GVAR(headlessClient) = objNull;
    // Force HC unit existance even if AI for him is disabled
    true
  }];
} else {
  // Notify server about connected HC
  [QGVAR(headlessConnected), [player]] call CBA_fnc_serverEvent;
};
