#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes className from 3DEN dynamicClassSelect class list
 */

params ["_ctrlClassList", "_index", ["_playSound", true], ["_notificationBar", controlNull]];

// Save displayName of className
private _displayName = _ctrlClassList lnbText [_index, 0];

// Remove selected row
_ctrlClassList lnbDeleteRow _index;

// Update selected row
_ctrlClassList lnbSetCurSelRow (_index min (((lnbSize _ctrlClassList) # 0) - 1));

// Update labels
[
  (ctrlParentControlsGroup _ctrlClassList),
  nil,
  GVAR(dynamicAttributesValues)
] call FUNC(dynamicClassSelect_updateUI);

// Show notification
[
  format [LLSTRING(dynamicClassSelect_removedClassToList), _displayName],
  1,
  _notificationBar
] call FUNC(dynamicClassSelect_showNotification);

// Update dynamic attribute
[ctrlParentControlsGroup _ctrlClassList, ""] call FUNC(updateDynamicAttribute);
