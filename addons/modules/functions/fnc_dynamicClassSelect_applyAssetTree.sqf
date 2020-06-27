#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Applies 3DEN dynamicClassSelect asset tree
 */

params ["_ctrlAssetsTree", "_path", "_treeList"];

private _filterActive = GVAR(dynamicClassSelect_filterActive);
private _lazyPictures = GVAR(dynamicClassSelect_lazyPictures);

{
  _x params ["_text", "_data", "_props"];

  private _index = _ctrlAssetsTree tvAdd [_path, _text];
  private _curPath = _path + [_index];

  if !(_picture isEqualTo "") then {
    _ctrlAssetsTree tvSetPicture [_curPath, _picture];
  };

  if !(_pictureRight isEqualTo "") then {
    _ctrlAssetsTree tvSetPictureRight [_curPath, _pictureRight];
  };

  if (_data isEqualType []) then {
    [_ctrlAssetsTree, _curPath, _data] call FUNC(dynamicClassSelect_applyAssetTree);
  } else {
    _ctrlAssetsTree tvSetData [_curPath, _data];
    _ctrlAssetsTree tvSetTooltip [_curPath, _data];
  };

  if !(_props isEqualTo []) then {
    // Setup pictures now if we're on root level or filter is active -
    // paths are changing by filtering so we won't be able to lazy load them
    // in next frame
    if (_path isEqualTo [] || _filterActive) then {
      _ctrlAssetsTree tvSetPicture [_curPath, _props # 0];
      _ctrlAssetsTree tvSetPictureRight [_curPath, _props # 1];
    } else {
      _lazyPictures pushBack [_curPath, _props];
    };
  };
} forEach _treeList;
