#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates UI (labels) of 3DEN dynamicClassSelect
 */

params ["_controlGroup", "", "_attributesValues"];

private _ctrlClassList = _controlGroup controlsGroupCtrl 101;
private _ctrlClassListModeTitle = _controlGroup controlsGroupCtrl 103;
private _ctrlClassListTitle = _controlGroup controlsGroupCtrl 107;
private _ctrlClassListDesc = _controlGroup controlsGroupCtrl 106;

private _moduleClassListMode = _attributesValues getVariable [QGVAR(classListMode), 0];

private _classListSize = (lnbSize _ctrlClassList) # 0;
_ctrlClassListTitle ctrlSetText format [
  LLSTRING(dynamicClassSelect_addedClassesCount),
  _classListSize
];


if (_moduleClassListMode isEqualTo 0) then {
  _ctrlClassListModeTitle ctrlSetText ((LLSTRING(dynamicClassSelect_randomWeight)) + "  ");
  _ctrlClassListDesc ctrlSetText "";
} else {
  _ctrlClassListModeTitle ctrlSetText ((LLSTRING(dynamicClassSelect_unitsCount)) + "      ");

  private _unitCount = 0;
  private _maxIndex = _classListSize - 1;

  for "_i" from 0 to _maxIndex do {
    private _count = _ctrlClassList lnbValue [_i, 2];
    _unitCount = _unitCount + _count;
  };

  _ctrlClassListDesc ctrlSetText format [
    LLSTRING(dynamicClassSelect_unitsInGroupCount),
    _unitCount
  ];
};
