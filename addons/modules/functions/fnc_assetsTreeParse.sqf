#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Parses given assets tree and makes and array representation of it
 */

params ["_control", "_path", "_types"];

private _tree = [];
private _maxIndex = (_control tvCount _path) - 1;

if (_maxIndex > -1) then {
  for "_i" from 0 to _maxIndex do {
    private _curPath = _path + [_i];
    private _data = _control tvData _curPath;
    private _props = [];
    private _valid = false;

    if ((_control tvCount _curPath) > 0) then {
      _data = [_control, _curPath, _types] call FUNC(assetsTreeParse);
      _valid = !(_data isEqualTo []);
    } else {
      _valid = if (_types isEqualTo []) then {true} else {
        (_types findIf {_data isKindOf _x}) >= 0
      };

      if (_valid) then {
        _props = [
          _control tvPicture _curPath,
          _control tvPictureRight _curPath
        ];
      };
    };

    if (_valid) then {
      _tree pushBack [
        _control tvText _curPath,
        _data,
        _props
      ];
    };
  };
};

_tree
