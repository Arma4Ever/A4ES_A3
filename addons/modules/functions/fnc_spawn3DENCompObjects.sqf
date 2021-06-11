#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns saved 3DEN comp objects
 */

LOG("spawn3DENCompObjects");

private _lastUpdate = -1;
private _count = count GVAR(3DENCompObjects);

{
  _x params ["", "_model", "", "_posWorld", "", "_vectors"];
  private _object = createSimpleObject [_model, _posWorld];
  _object setVectorDirAndUp _vectors;

  // Update global info for intro
  if ((CBA_missionTime - _lastUpdate) > 0.98) then {
    missionNamespace setVariable [QGVAR(3DENCompObjectsSpawn), [true, _forEachIndex + 1, _count, false], true];
    _lastUpdate = CBA_missionTime;
  };
  // One object per frame
  sleep 0.001;
} forEach GVAR(3DENCompObjects);

// Save global info for intro
missionNamespace setVariable [QGVAR(3DENCompObjectsSpawn), [true, _count, _count, true], true];

// Release memory
GVAR(3DENCompObjects) = nil;
