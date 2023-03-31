#include "script_component.hpp"

// Spawn local simple objects
0 call FUNC(spawn3DENCompObjectsLocal);

if (isServer) then {
  /*
  TODO: Curator module
  [{
    private _compositionList = missionNamespace getVariable [QGVAR(generatorCompositionList), []];

    // Make saved composition list global for curators
    missionNamespace setVariable [QGVAR(generatorCompositionList), _compositionList, true];
  }, 0, 5] call CBA_fnc_waitAndExecute;
  */

  // Spawn 3DEN Comp objects
  [
    {0 spawn FUNC(spawn3DENCompObjects);},
    nil,
    [10, 3] select is3DENPreview
  ] call CBA_fnc_waitAndExecute;
};