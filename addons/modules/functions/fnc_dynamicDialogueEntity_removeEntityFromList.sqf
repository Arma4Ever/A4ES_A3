#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes entity from 3DEN dynamicDialogueEntity entity list
 */

params ["_ctrlList", "_index", ["_playSound", true], ["_notificationBar", controlNull]];

private _entityType = _ctrlList getVariable QGVAR(entityType);
private _entityName = _ctrlList lnbText [_index, 0];

// Remove selected row
_ctrlList lnbDeleteRow _index;

// Update selected row
_ctrlList lnbSetCurSelRow (_index min (((lnbSize _ctrlList) # 0) - 1));

// Show notification
[
  format [LLSTRING(dynamicLogicFlagCond_removedFlagFromList), _entityName],
  1,
  _notificationBar
] call FUNC(dynamicClassSelect_showNotification);

// Update dynamic attribute
[ctrlParentControlsGroup _ctrlList, ""] call FUNC(updateDynamicAttribute);
