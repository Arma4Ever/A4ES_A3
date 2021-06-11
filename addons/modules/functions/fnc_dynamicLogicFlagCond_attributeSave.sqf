#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicLogicFlagCond attributeSave handler
 */

 private _ctrlFlagsList = _this controlsGroupCtrl 101;
 private _maxIndex = ((lnbSize _ctrlFlagsList) # 0) - 1;
 private _flagList = [];

 for "_i" from 0 to _maxIndex do {
   _flagList pushBack [
     _ctrlFlagsList lnbData [_i, 0],
     _ctrlFlagsList lnbValue [_i, 2]
   ];
 };

 str _flagList
