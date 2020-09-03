#include "script_component.hpp"

// Exit if main menu
if (EGVAR(common,isMainMenu)) exitWith {};

if (isServer) then {
  if (isMultiplayer) then {
    [{
      [QGVAR(enableSafety), []] call CBA_fnc_globalEvent;
    }, []] call CBA_fnc_execNextFrame;
  };

  [{
    private _respawn = getMissionConfigValue ["respawn", 0];
    // Exit if respawn enabled
    if !(_respawn isEqualTo 0) exitWith {};
    // Remove all playable units from garbage collection
    removeFromRemainsCollector ([switchableUnits, playableUnits] select isMultiplayer);
  }, []] call CBA_fnc_execNextFrame;
};

// Exit if no interface
if (!hasInterface) exitWith {};

// Update terrain grid resolution
if (isMultiplayer) then {
  setTerrainGrid 25;
};

// Disable all channels except global & side
for "_i" from 2 to 15 do {
  _i enableChannel false;
};

// Block channels except global & side
// enableChannel command can't disable group chat
[{
  if (currentChannel > 1) then {
    setCurrentChannel 0;
  };
}, 0, []] call CBA_fnc_addPerFrameHandler;

// Exec after mission start
[{
  // Exit if player joined in progress
  if (didJIP) exitWith {};

  // Lower player weapon
  if !(weaponLowered player) then {
    player action ["WeaponOnBack", player];
  };

  // Lock player weapon
  [player, currentWeapon player, true] call ACEFUNC(safemode,setWeaponSafety);
}, [], 0.05] call CBA_fnc_waitAndExecute;
