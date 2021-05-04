#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * Setups mission attributes default values
 */

// "Scenario" set3DENMissionAttribute ["SaveBinarized", false];
// "Preferences" set3DENMissionAttribute ["SaveBinarized", false];
"GarbageCollection" set3DENMissionAttribute ["DynSimEnabled", true];
"GarbageCollection" set3DENMissionAttribute ["CorpseManagerMode", 1];
"GarbageCollection" set3DENMissionAttribute ["WreckManagerMode", 1];

private _garbageCollectionSetuped = "GarbageCollection" get3DENMissionAttribute QGVAR(garbageCollectionSetuped);

// Setup garbage collector & dynamic sim default settings if not setuped yet
if !(_garbageCollectionSetuped) then {
  "GarbageCollection" set3DENMissionAttribute ["MinPlayerDistance", 0];
  "GarbageCollection" set3DENMissionAttribute ["CorpseLimit", 16];
  "GarbageCollection" set3DENMissionAttribute ["CorpseRemovalMinTime", 45];
  "GarbageCollection" set3DENMissionAttribute ["CorpseRemovalMaxTime", 15*60];
  "GarbageCollection" set3DENMissionAttribute ["WreckLimit", 8];
  "GarbageCollection" set3DENMissionAttribute ["WreckRemovalMinTime", 3*60];
  "GarbageCollection" set3DENMissionAttribute ["WreckRemovalMaxTime", 30*60];

  "GarbageCollection" set3DENMissionAttribute ["DynSimDistGroup", 800];
  "GarbageCollection" set3DENMissionAttribute ["DynSimDistVehicle", 1300];
  "GarbageCollection" set3DENMissionAttribute ["DynSimDistProp", 50];
  "GarbageCollection" set3DENMissionAttribute ["DynSimDistEmptyVehicle", 350];
  "GarbageCollection" set3DENMissionAttribute ["DynSimMovingCoef", 1.5];

  "GarbageCollection" set3DENMissionAttribute [QGVAR(garbageCollectionSetuped), true];
};
