#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds classname to 3DEN dynamicClassSelect class list
 */

params ["_ctrlClassList", "_index", "_change"];

private _curSelRow = lnbCurSelRow _ctrlClassList;

// Exit if nothing is selected
if (_index < 0) exitWith {};

private _weight = _ctrlClassList lnbValue [_index, 2];
_weight = (_weight + _change) max 1;

_ctrlClassList lnbSetText [[_index, 2], str _weight];
_ctrlClassList lnbSetValue [[_index, 2], _weight];

// Update UI
[
  (ctrlParentControlsGroup _ctrlClassList),
  nil,
  GVAR(dynamicAttributesValues)
] call FUNC(dynamicClassSelect_updateUI);

// Play notification sound
playsound ["3DEN_notificationDefault", true];
