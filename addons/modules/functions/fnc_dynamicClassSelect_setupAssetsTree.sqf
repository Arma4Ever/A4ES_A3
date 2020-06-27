#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Setups 3DEN dynamicClassSelect assets tree
 */

params ["_ctrlAssetsTree", "_filterActive"];

LOG_1("Setuping dynamicClassSelect assets tree (filter active: %1)",str _filterActive);

// Clear current tree
tvClear _ctrlAssetsTree;

// Get asset types for assets tree
private _assetsTypes = _ctrlAssetsTree getVariable QGVAR(assetsTypes);
private _treeCopyVar = format [QGVAR(assetsTreeCopy%1), _assetsTypes];

// Get tree from 3den display var
private _3DENDisplay = findDisplay 313;
private _treeCopy = _3DENDisplay getVariable _treeCopyVar;

// If tree not saved in display it's first run - create tree copy
if (isNil "_treeCopy") then {
  _treeCopy = _assetsTypes call FUNC(assetsTreeCopy);
  _3DENDisplay setVariable [_treeCopyVar, _treeCopy];
};

GVAR(dynamicClassSelect_filterActive) = _filterActive;
GVAR(dynamicClassSelect_lazyPictures) = [];
[_ctrlAssetsTree, [], _treeCopy] call FUNC(dynamicClassSelect_applyAssetTree);

// If filter is empty load pictures in next frame for smoother transition
if !(_filterActive) then {
  _ctrlAssetsTree spawn {
    params ["_ctrlAssetsTree"];
    sleep 0.001;
    {
      _x params ["_curPath", "_props"];
      _ctrlAssetsTree tvSetPicture [_curPath, _props # 0];
      _ctrlAssetsTree tvSetPictureRight [_curPath, _props # 1];
    } forEach GVAR(dynamicClassSelect_lazyPictures);

    // Release memory
    GVAR(dynamicClassSelect_lazyPictures) = [];
  };
};
