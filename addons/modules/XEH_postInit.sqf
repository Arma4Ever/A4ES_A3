#include "script_component.hpp"

if (isServer) then {
  [{
    private _compositionList = missionNamespace getVariable [QGVAR(generatorCompositionList), []];

    // Make saved composition list global for curators
    missionNamespace setVariable [QGVAR(generatorCompositionList), _compositionList, true];
  }, 0, 5] call CBA_fnc_waitAndExecute;
};
