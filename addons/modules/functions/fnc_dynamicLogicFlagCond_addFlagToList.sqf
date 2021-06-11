#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds flag to 3DEN dynamicLogicFlagCond flags list
 */

params ["_ctrlFlagsList", "_id", "_value", ["_playSound", false], ["_notificationBar", controlNull]];

private _flagsData = _ctrlFlagsList getVariable QGVAR(flagsData);

if !(_id in _flagsData) exitWith {};

private _flagData = _flagsData get _id;
private _flagName = _flagData # 0;

// Initial flag value
if (_value isEqualTo -1) then {
  _value = _flagData # 1;
};

private _valueLabel = localize ([ELSTRING(common,False), ELSTRING(common,True)] select _value);

// Add flag to list
private _index = _ctrlFlagsList lnbAddRow [_flagName, "", toUpper _valueLabel];
_ctrlFlagsList lnbSetData [[_index, 0], _id];
_ctrlFlagsList lnbSetValue [[_index, 2], _value];

// Show notification
if (_playSound || !(isNull _notificationBar)) then {
  [
    format [LLSTRING(dynamicLogicFlagCond_addedFlagToList), _flagName],
    0,
    _notificationBar
  ] call FUNC(dynamicClassSelect_showNotification);

  // Update dynamic attribute
  [ctrlParentControlsGroup _ctrlFlagsList, ""] call FUNC(updateDynamicAttribute);
};
