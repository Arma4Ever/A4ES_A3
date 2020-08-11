#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles curator module init
 */

params ["_curator"];

#ifdef DEBUG_MODE_FULL
private _editable3DENObjects = missionNamespace getVariable [QGVAR(editable3DENObjects), []];
LOG_2("Initing curator module %1 (editable3DENObjects count: %2)",str _curator,str (count _editable3DENObjects));
#endif

_curator addCuratorEditableObjects [
  [switchableUnits, playableUnits] select isMultiplayer,
  true
];
_curator addCuratorEditableObjects [
  missionNamespace getVariable [QGVAR(editable3DENObjects), []],
  true
];

_curator addEventHandler ["CuratorGroupPlaced", {
  params ["", "_group"];
  if (local _group) then {
    _group deleteGroupWhenEmpty true;
  };
}];

// Start curators points reset loop if not started yet
if (GVAR(pointsResetPFH) isEqualTo -1) then {
  LOG("Starting points reset PFH");
  GVAR(pointsResetPFH) = [{call FUNC(pointsResetPFH)}, 15, []] call CBA_fnc_addPerFrameHandler;
};
