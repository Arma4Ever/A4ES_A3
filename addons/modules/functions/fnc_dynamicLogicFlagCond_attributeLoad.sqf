#include "script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicLogicFlagCond attributeLoad handler
 */

params ["_ctrlGroup", "_listIdc", "_arrowLeftIdc", "_arrowRightIdc"];
_this = _ctrlGroup;

// Flags combo
private _ctrlFlagsCombo = _this controlsGroupCtrl 120;

private _ctrlFlagsAddButton = _this controlsGroupCtrl 121;
private _ctrlFlagsComboNotfBar = _this controlsGroupCtrl 122;

// Flags list
private _ctrlFlagsList = _this controlsGroupCtrl _listIdc;

private _ctrlFlagsListNotfBar = _this controlsGroupCtrl 102;
private _ctrlFlagsListRemoveButton = _this controlsGroupCtrl 104;

// Flags list arrows
private _ctrlArrowLeft = _this controlsGroupCtrl _arrowLeftIdc;
private _ctrlArrowRight = _this controlsGroupCtrl _arrowRightIdc;

// Load flags data
private _flagsData = createHashMap;
private _modules = (all3DENEntities # 3) select {_x isKindOf QGVAR(createLogicFlag)};
{
  private _id = (_x get3DENAttribute QGVAR(id)) param [0, ""];
  if (
    (_id isEqualType "") &&
    (_id isNotEqualTo "")
  ) then {
    private _title = (_x get3DENAttribute QGVAR(title)) param [0, ""];
    private _initValue = (_x get3DENAttribute QGVAR(initialValue)) param [0, 0];
    _flagsData set [_id, [_title, _initValue]];
    // Add flag to flags combo list
    private _index = _ctrlFlagsCombo lbAdd _title;
    _ctrlFlagsCombo lbSetData [_index, _id];
    _ctrlFlagsCombo lbSetValue [_index, _initValue];
  };
} forEach _modules;
_ctrlFlagsList setVariable [QGVAR(flagsData), _flagsData];

// Add warning if no flags detected
if ((lbSize _ctrlFlagsCombo) isEqualTo 0) then {
  private _index = _ctrlFlagsCombo lbAdd (LLSTRING(setLogicFlagValue_Warning_emptyFlags));
  _ctrlFlagsCombo lbSetData [_index, ""];
  _ctrlFlagsCombo lbSetValue [_index, 0];
  _ctrlFlagsCombo lbSetTooltip [_index, LLSTRING(setLogicFlagValue_Warning_emptyFlags_Tooltip)];
  _ctrlFlagsCombo lbSetPicture [_index, QPATHTOF(data\warning_red.paa)];
};

// Select first element
_ctrlFlagsCombo lbSetCurSel 0;

// Setup references
_ctrlFlagsAddButton setVariable [QGVAR(flagsCombo), _ctrlFlagsCombo];
_ctrlFlagsAddButton setVariable [QGVAR(flagsComboNotfBar), _ctrlFlagsComboNotfBar];
_ctrlFlagsAddButton setVariable [QGVAR(flagsList), _ctrlFlagsList];

_ctrlFlagsList setVariable [QGVAR(flagsComboNotfBar), _ctrlFlagsComboNotfBar];

_ctrlFlagsListRemoveButton setVariable [QGVAR(flagsList), _ctrlFlagsList];
_ctrlFlagsListRemoveButton setVariable [QGVAR(flagsComboNotfBar), _ctrlFlagsComboNotfBar];

_ctrlArrowLeft setVariable [QGVAR(flagsList), _ctrlFlagsList];
_ctrlArrowRight setVariable [QGVAR(flagsList), _ctrlFlagsList];

// Add current flags from value to list
{
  [_ctrlFlagsList, _x # 0, _x # 1] call FUNC(dynamicLogicFlagCond_addFlagToList);
} forEach (parseSimpleArray _value);

// Handle flagsCombo button click (adding class from edit)
_ctrlFlagsAddButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlFlagsCombo = _control getVariable QGVAR(flagsCombo);
  private _ctrlFlagsComboNotfBar = _control getVariable QGVAR(flagsComboNotfBar);

  private _index = lbCurSel _ctrlFlagsCombo;
  private _flagId = _ctrlFlagsCombo lbData _index;
  private _flagDefVal = _ctrlFlagsCombo lbValue _index;

  if (_flagId isEqualTo "") exitWith {};

  private _ctrlFlagsList = _control getVariable QGVAR(flagsList);
  [_ctrlFlagsList, _flagId, _flagDefVal, true, _ctrlFlagsComboNotfBar] call FUNC(dynamicLogicFlagCond_addFlagToList);
}];

// Handle del keyDown (removing class from classList)
_ctrlFlagsList ctrlAddEventHandler ["keyDown", {
  params ["_control", "_key", "_shift", "_ctrl", "_alt"];

  // Exit if not del key
  if (_key isNotEqualTo DIK_DELETE) exitWith {};
  if ([_shift, _ctrl, _alt] isNotEqualTo [false, false, false]) exitWith {};

  private _curSelRow = lnbCurSelRow _control;

  // Exit if nothing is selected
  if (_curSelRow < 0) exitWith {};

  // Remove class from list
  [
    _control,
    _curSelRow,
    true,
    _control getVariable QGVAR(flagsComboNotfBar)
  ] call FUNC(dynamicLogicFlagCond_removeFlagFromList);
}];

// Handle removeButton click (removing class from classList)
_ctrlFlagsListRemoveButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlFlagsList = _control getVariable QGVAR(flagsList);
  private _curSelRow = lnbCurSelRow _ctrlFlagsList;

  // Exit if nothing is selected
  if (_curSelRow < 0) exitWith {};

  // Remove class from list
  [
    _ctrlFlagsList,
    _curSelRow,
    true,
    _control getVariable QGVAR(flagsComboNotfBar)
  ] call FUNC(dynamicLogicFlagCond_removeFlagFromList);
}];

// Handle arrowLeft click (set to false)
_ctrlArrowLeft ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlFlagsList = _control getVariable QGVAR(flagsList);
  [_ctrlFlagsList, lnbCurSelRow _ctrlFlagsList, 0] call FUNC(dynamicLogicFlagCond_updateFlagValue);
}];

// Handle arrowRight click (set to true)
_ctrlArrowRight ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlFlagsList = _control getVariable QGVAR(flagsList);
  [_ctrlFlagsList, lnbCurSelRow _ctrlFlagsList, 1] call FUNC(dynamicLogicFlagCond_updateFlagValue);
}];

// Init dynamic attribute
private _initData = [_this, _config, _value, {}, nil] call FUNC(initDynamicAttribute);
