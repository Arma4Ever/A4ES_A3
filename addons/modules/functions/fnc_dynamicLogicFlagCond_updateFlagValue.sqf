#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates flag value for dynamicLogicFlagCond flags list
 */

params ["_ctrlFlagsList", "_index", "_value"];

private _curSelRow = lnbCurSelRow _ctrlFlagsList;

// Exit if nothing is selected
if (_index < 0) exitWith {};

private _valueLabel = localize ([ELSTRING(common,False), ELSTRING(common,True)] select _value);

_ctrlFlagsList lnbSetText [[_index, 2], toUpper _valueLabel];
_ctrlFlagsList lnbSetValue [[_index, 2], _value];

// Play notification sound
playsound ["3DEN_notificationDefault", true];
