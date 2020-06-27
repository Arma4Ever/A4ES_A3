#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes className from 3DEN dynamicClassSelect class list
 */

params ["_ctrlClassList", "_index", ["_playSound", true], ["_notificationBar", controlNull]];

//TODO

// Update labels
(ctrlParentControlsGroup _ctrlClassList) call FUNC(dynamicClassSelect_updateUI);

// Show notification
[_playSound, _notificationBar] call FUNC(dynamicClassSelect_showNotification);
