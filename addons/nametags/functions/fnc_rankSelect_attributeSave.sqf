#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicClassSelect attributeSave handler
 */

private _ctrlRanksCombo = _this controlsGroupCtrl 100;

private _rank = _ctrlRanksCombo lbData (lbCurSel _ctrlRanksCombo);
if (_rank isEqualTo "default") then {
  _rank = "";
};

_rank
