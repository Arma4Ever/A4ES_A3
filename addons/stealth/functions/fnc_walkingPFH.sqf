#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Walking per frame handler
 */

private _isSilentWalking = (
  (isWalking player) &&
  {isNull (objectParent player)} &&
  {(speed player) < 6}
);

// Update icon if status changed
if (GVAR(isSilentWalking) isNotEqualTo _isSilentWalking) then {
  TRACE_1("Silent walking status changed",_isSilentWalking);
  player setUnitTrait ["audibleCoef", parseNumber !_isSilentWalking];

  // Update icon
  [
    QGVAR(silentWalking),
    true,
    QPATHTOF(data\silentWalking.paa),
    [1,1,1,1],
    [0, -1] select _isSilentWalking
  ] call ACEFUNC(common,displayIcon);

  // Update status
  GVAR(isSilentWalking) = _isSilentWalking;
};
