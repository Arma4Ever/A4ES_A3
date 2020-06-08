#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * Setups mission attributes default values
 */

"Scenario" set3DENMissionAttribute ["SaveBinarized", false];
"Preferences" set3DENMissionAttribute ["SaveBinarized", false];
"GarbageCollection" set3DENMissionAttribute ["DynSimEnabled", true];
"GarbageCollection" set3DENMissionAttribute ["CorpseManagerMode", 1];
"GarbageCollection" set3DENMissionAttribute ["WreckManagerMode", 1];

private _garbageCollectionSetuped = "GarbageCollection" get3DENMissionAttribute QGVAR(garbageCollectionSetuped);

// Setup garbage collector default settings if not setuped yet
if !(_garbageCollectionSetuped) then {
  "GarbageCollection" set3DENMissionAttribute ["MinPlayerDistance", 300];
  "GarbageCollection" set3DENMissionAttribute ["CorpseLimit", 20];
  "GarbageCollection" set3DENMissionAttribute ["CorpseRemovalMinTime", 120];
  "GarbageCollection" set3DENMissionAttribute ["CorpseRemovalMaxTime", 1800];
  "GarbageCollection" set3DENMissionAttribute ["WreckLimit", 8];
  "GarbageCollection" set3DENMissionAttribute ["WreckRemovalMinTime", 300];
  "GarbageCollection" set3DENMissionAttribute ["WreckRemovalMaxTime", 3600];
  "GarbageCollection" set3DENMissionAttribute [QGVAR(garbageCollectionSetuped), true];
};
