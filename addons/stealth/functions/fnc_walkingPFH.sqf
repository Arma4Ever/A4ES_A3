#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Walking per frame handler
 */

private _isWalking = (isWalking ace_player) && {isNull (objectParent ace_player)};
private _isSilentWalking = false;

if (_isWalking) then {
  if ((speed ace_player) < 6) then {
    _isSilentWalking = true;
    // Update trait if status changed
    if !(GVAR(isSilentWalking)) then {
      ace_player setUnitTrait ["audibleCoef", 0];
    };
  } else {
    // Update trait if status changed
    if (GVAR(isSilentWalking)) then {
      ace_player setUnitTrait ["audibleCoef", 1];
    };
  };
} else {
  // Update trait if status changed
  if (GVAR(isSilentWalking)) then {
    ace_player setUnitTrait ["audibleCoef", 1];
  };
};

// Update icon if status changed
if !(GVAR(isSilentWalking) isEqualTo _isSilentWalking) then {
  [
    QGVAR(silentWalking),
    true,
    QPATHTOF(data\silentWalking.paa),
    [1,1,1,1],
    [0, -1] select _isSilentWalking
  ] call ACEFUNC(common,displayIcon);
};

// Update var
GVAR(isSilentWalking) = _isSilentWalking;
