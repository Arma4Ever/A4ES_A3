#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes flag from 3DEN dynamicLogicFlagCond flags list
 */

params ["_ctrlFlagsList", "_index", ["_playSound", true], ["_notificationBar", controlNull]];

// Save displayName of className
private _flagName = _ctrlFlagsList lnbText [_index, 0];

// Remove selected row
_ctrlFlagsList lnbDeleteRow _index;

// Update selected row
_ctrlFlagsList lnbSetCurSelRow (_index min (((lnbSize _ctrlFlagsList) # 0) - 1));

// Show notification
[
  format [LLSTRING(dynamicLogicFlagCond_removedFlagFromList), _flagName],
  1,
  _notificationBar
] call FUNC(dynamicClassSelect_showNotification);

// Update dynamic attribute
[ctrlParentControlsGroup _ctrlFlagsList, ""] call FUNC(updateDynamicAttribute);
