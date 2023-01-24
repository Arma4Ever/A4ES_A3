#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicDialogueEntity attributeSave handler
 */
params ["_ctrlGroup"];
_this = _ctrlGroup;

private _ctrlList = _this controlsGroupCtrl 105;

private _maxIndex = ((lnbSize _ctrlList) # 0) - 1;
private _entities = [];

for "_i" from 0 to _maxIndex do {
  _entities pushBack (_ctrlList lnbData [_i, 0]);
};

str _entities
