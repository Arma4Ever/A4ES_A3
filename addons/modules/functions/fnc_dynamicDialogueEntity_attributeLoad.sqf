#include "script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicDialogueEntity attributeLoad handler
 */

params ["_ctrlGroup"];
_this = _ctrlGroup;

private _entityType = getNumber (_config >> QGVAR(entityType));

// Entities combo
private _ctrlEntitiesCombo = _this controlsGroupCtrl 120;

private _ctrlEntitiesAddButton = _this controlsGroupCtrl 121;
private _ctrlEntitiesComboNotfBar = _this controlsGroupCtrl 122;

// Entities list
private _ctrlEntitiesList = _this controlsGroupCtrl 105;
_ctrlEntitiesList setVariable [QGVAR(entityType), _entityType];

// Notf bars
private _ctrlEntitiesListNotfBar = _this controlsGroupCtrl 102;
private _ctrlEntitiesListRemoveButton = _this controlsGroupCtrl 104;

// Titles
private _ctrlEntitiesComboTitle = _this controlsGroupCtrl 1001;
private _ctrlEntitiesTitle = _this controlsGroupCtrl 107;

_ctrlEntitiesComboTitle ctrlSetText (localize ([
  LSTRING(dynamicDialogueEntity_optionsComboTitle),
  LSTRING(dynamicDialogueEntity_answersComboTitle)
]) select _entityType);

_ctrlEntitiesTitle ctrlSetText (localize ([
  LSTRING(dynamicDialogueEntity_OptionTitle),
  LSTRING(dynamicDialogueEntity_AnswerTitle)
]) select _entityType);

_ctrlEntitiesListRemoveButton ctrlSetTooltip (localize ([
  LSTRING(dynamicDialogueEntity_ButtonRemoveOption_Tooltip),
  LSTRING(dynamicDialogueEntity_ButtonRemoveAnswer_Tooltip)
]) select _entityType);

// Load entities data
private _entityTypeClass = [QGVAR(addDialogueOption), QGVAR(addDialogueAnswer)] select _entityType;


private _entitiesData = createHashMap;
private _modules = (all3DENEntities # 3) select {_x isKindOf _entityTypeClass};
{
  private _id = (_x get3DENAttribute QGVAR(id)) param [0, ""];
  if (
    (_id isEqualType "") &&
    (_id isNotEqualTo "")
  ) then {
    private _name = (_x get3DENAttribute QGVAR(name)) param [0, ""];
    _entitiesData set [_id, _name];
    private _index = _ctrlEntitiesCombo lbAdd _name;
    _ctrlEntitiesCombo lbSetData [_index, _id];
  };
} forEach _modules;
_ctrlEntitiesList setVariable [QGVAR(entitiesData), _entitiesData];

// Add warning if no entities detected
if ((lbSize _ctrlEntitiesCombo) isEqualTo 0) then {
  private _index = _ctrlEntitiesCombo lbAdd (LLSTRING(setLogicFlagValue_Warning_emptyFlags));
  _ctrlEntitiesCombo lbSetData [_index, ""];
  _ctrlEntitiesCombo lbSetTooltip [_index, LLSTRING(setLogicFlagValue_Warning_emptyFlags_Tooltip)];
  _ctrlEntitiesCombo lbSetPicture [_index, QPATHTOF(data\warning_red.paa)];
};

// Select first element
_ctrlEntitiesCombo lbSetCurSel 0;

// Setup references
_ctrlEntitiesAddButton setVariable [QGVAR(entitiesCombo), _ctrlFlagsCombo];
_ctrlEntitiesAddButton setVariable [QGVAR(entitiesComboNotfBar), _ctrlFlagsComboNotfBar];
_ctrlEntitiesAddButton setVariable [QGVAR(entitiesList), _ctrlFlagsList];

_ctrlEntitiesList setVariable [QGVAR(entitiesComboNotfBar), _ctrlFlagsComboNotfBar];

_ctrlEntitiesListRemoveButton setVariable [QGVAR(entitiesList), _ctrlFlagsList];
_ctrlEntitiesListRemoveButton setVariable [QGVAR(entitiesComboNotfBar), _ctrlFlagsComboNotfBar];



// Add current flags from value to list
{
  [_ctrlFlagsList, _x # 0, _x # 1] call FUNC(dynamicLogicFlagCond_addFlagToList);
} forEach (parseSimpleArray _value);

// Handle flagsCombo button click (adding class from edit)
_ctrlFlagsAddButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlFlagsCombo = _control getVariable QGVAR(entitiesCombo);
  private _ctrlFlagsComboNotfBar = _control getVariable QGVAR(entitiesComboNotfBar);

  private _index = lbCurSel _ctrlFlagsCombo;
  private _flagId = _ctrlFlagsCombo lbData _index;
  private _flagDefVal = _ctrlFlagsCombo lbValue _index;

  if (_flagId isEqualTo "") exitWith {};

  private _ctrlFlagsList = _control getVariable QGVAR(entitiesList);
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
    _control getVariable QGVAR(entitiesComboNotfBar)
  ] call FUNC(dynamicLogicFlagCond_removeFlagFromList);
}];

// Handle removeButton click (removing class from classList)
_ctrlFlagsListRemoveButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlFlagsList = _control getVariable QGVAR(entitiesList);
  private _curSelRow = lnbCurSelRow _ctrlFlagsList;

  // Exit if nothing is selected
  if (_curSelRow < 0) exitWith {};

  // Remove class from list
  [
    _ctrlFlagsList,
    _curSelRow,
    true,
    _control getVariable QGVAR(entitiesComboNotfBar)
  ] call FUNC(dynamicLogicFlagCond_removeFlagFromList);
}];

// Init dynamic attribute
private _initData = [_this, _config, _value, {}, nil] call FUNC(initDynamicAttribute);
