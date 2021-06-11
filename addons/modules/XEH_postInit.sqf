#include "script_component.hpp"

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
    {_this spawn FUNC(spawn3DENCompObjects);},
    0,
    [10, 3] select is3DENPreview
  ] call CBA_fnc_waitAndExecute;
};
