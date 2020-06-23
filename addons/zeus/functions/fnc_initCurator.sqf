#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds all playable units to curator
 */

params ["_curator"];

#ifdef DEBUG_MODE_FULL
private _editable3DENObjects = missionNamespace getVariable [QGVAR(editable3DENObjects), []];
LOG_2("Initing curator module %1 (editable3DENObjects count: %2)",str _curator,str (count _editable3DENObjects));
#endif

_curator addCuratorEditableObjects [
  ([switchableUnits, playableUnits] select isMultiplayer) select {!(_x isKindOf "VirtualMan_F")},
  true
];
_curator addCuratorEditableObjects [
  missionNamespace getVariable [QGVAR(editable3DENObjects), []],
  true
];

// Start curators points reset loop if not started yet
if (GVAR(pointsResetPFH) < 0) then {
  LOG("Starting points reset PFH");
  GVAR(pointsResetPFH) = [DFUNC(pointsResetPFH), 30, []] call CBA_fnc_addPerFrameHandler;
};
