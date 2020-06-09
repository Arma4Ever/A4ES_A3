#include "script_component.hpp"

if !(hasInterface) exitWith {};

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
