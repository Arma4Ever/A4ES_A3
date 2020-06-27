#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicClassSelect attributeSave handler
 */

private _ctrlClassList = _this controlsGroupCtrl 101;
private _maxIndex = ((lnbSize _ctrlClassList) # 0) - 1;
private _classList = [];

for "_i" from 0 to _maxIndex do {
  _classList pushBack [
    _ctrlClassList lnbData [_i, 0],
    _ctrlClassList lnbValue [_i, 2]
  ];
};

str _classList
