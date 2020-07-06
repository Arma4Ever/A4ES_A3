#include "script_component.hpp"
#include "\a3\ui_f\hpp\definedikcodes.inc"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicClassSelect attributeLoad handler
 */

// Assets
private _ctrlAssetsTree = _this controlsGroupCtrl 500;
private _ctrlSearchEdit = _this controlsGroupCtrl 501;
private _ctrlSearchButton = _this controlsGroupCtrl 502;
private _ctrlAssetsTreeNotfBar = _this controlsGroupCtrl 503;

// Class edit
private _ctrlClassEdit = _this controlsGroupCtrl 120;
private _ctrlClassAddButton = _this controlsGroupCtrl 121;
private _ctrlClassEditNotfBar = _this controlsGroupCtrl 122;

// Class list
private _ctrlClassList = _this controlsGroupCtrl 101;
private _ctrlClassListNotfBar = _this controlsGroupCtrl 102;
private _ctrlClassListRemoveButton = _this controlsGroupCtrl 104;

// Class list arrows
private _ctrlArrowLeft = _this controlsGroupCtrl 393101;
private _ctrlArrowRight = _this controlsGroupCtrl 393102;

// Setup references
_ctrlSearchEdit setVariable [QGVAR(assetsTree), _ctrlAssetsTree];
_ctrlSearchButton setVariable [QGVAR(searchEdit), _ctrlSearchEdit];
_ctrlSearchButton setVariable [QGVAR(assetsTree), _ctrlAssetsTree];
_ctrlAssetsTree setVariable [QGVAR(classList), _ctrlClassList];
_ctrlAssetsTree setVariable [QGVAR(assetsTreeNotfBar), _ctrlAssetsTreeNotfBar];
_ctrlClassAddButton setVariable [QGVAR(classEdit), _ctrlClassEdit];
_ctrlClassAddButton setVariable [QGVAR(classEditNotfBar), _ctrlClassEditNotfBar];
_ctrlClassAddButton setVariable [QGVAR(classList), _ctrlClassList];
_ctrlClassList setVariable [QGVAR(classListNotfBar), _ctrlClassListNotfBar];
_ctrlClassListRemoveButton setVariable [QGVAR(classList), _ctrlClassList];
_ctrlClassListRemoveButton setVariable [QGVAR(classListNotfBar), _ctrlClassListNotfBar];
_ctrlArrowLeft setVariable [QGVAR(classList), _ctrlClassList];
_ctrlArrowRight setVariable [QGVAR(classList), _ctrlClassList];

private _assetsTypes = getArray (_config >> QGVAR(assetsTypes));
_ctrlAssetsTree setVariable [QGVAR(assetsTypes), _assetsTypes];

// Initial setup of assets tree
[_ctrlAssetsTree, false] call FUNC(dynamicClassSelect_setupAssetsTree);

// Add current classList from value to list
{
  [_ctrlClassList, _x # 0, _x # 1] call FUNC(dynamicClassSelect_addClassToList);
} forEach (call compile _value);

// Handle asset tree dblClick (adding classes)
_ctrlAssetsTree ctrlAddEventHandler ["treeDblClick", {
  params ["_control", "_path"];

  private _className = _control tvData _path;
  if (_className isEqualTo "") exitWith {};

  private _ctrlAssetsTreeNotfBar = _control getVariable QGVAR(assetsTreeNotfBar);

  [
    _control getVariable QGVAR(classList),
    _className,
    1,
    true,
    true,
    _ctrlAssetsTreeNotfBar
  ] call FUNC(dynamicClassSelect_addClassToList);
}];

// Handle search button reset click
_ctrlSearchButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlSearchEdit = _control getVariable QGVAR(searchEdit);
  if !((ctrlText _ctrlSearchEdit) isEqualTo "") then {
    private _ctrlAssetsTree = _control getVariable QGVAR(assetsTree);
    // Update button icon
    _control ctrlSetText "\a3\3DEN\Data\Displays\Display3DEN\search_start_ca.paa";
    // Reset search edit
    _ctrlSearchEdit ctrlSetText "";
    // Reset assets tree
    [_ctrlAssetsTree, false] call FUNC(dynamicClassSelect_setupAssetsTree);
  };
}];

// Handle search edit change (key press)
_ctrlSearchEdit ctrlAddEventHandler ["keyUp", {
  params ["_control"];

  private _text = ctrlText _control;
  private _lastText = _control getVariable [QGVAR(lastText), ""];

  // Reset assets tree if filter phrase has shrunk or empty
  if (_text isEqualTo "" || {(count _text) < (count _lastText)}) then {
    private _ctrlAssetsTree = _control getVariable QGVAR(assetsTree);
    [_ctrlAssetsTree, !(_text isEqualTo "")] call FUNC(dynamicClassSelect_setupAssetsTree);
  };

  _control setVariable [QGVAR(lastText), _text];
}];

// Handle classEdit button click (adding class from edit)
_ctrlClassAddButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlClassEdit = _control getVariable QGVAR(classEdit);
  private _ctrlClassEditNotfBar = _control getVariable QGVAR(classEditNotfBar);

  private _input = (ctrlText _ctrlClassEdit) splitString "";
  // Exit if input is empty
  if (_input isEqualTo []) exitWith {};

  // Filter input
  _input = _input - ["""", "'", "[", "]", " "];

  // Split
  private _classes = (_input joinString "") splitString ",";
  // Remove empty entires
  _classes = _classes - [""];

  if (_classes isEqualTo []) exitWith {
    [
      localize LSTRING(dynamicClassSelect_notRecognizedAnyClass),
      2,
      _ctrlClassEditNotfBar
    ] call FUNC(dynamicClassSelect_showNotification);
  };

  private _ctrlClassList = _control getVariable QGVAR(classList);
  private _addedCount = count _classes;
  private _rejectedCount = {
    if (_x isKindOf "CAManBase") then {
      [_ctrlClassList, _x, 1] call FUNC(dynamicClassSelect_addClassToList);
      false
    } else {
      true
    };
  } count _classes;

  _addedCount = _addedCount - _rejectedCount;

  // Show proper notification and update UI if some classes were added
  if (_addedCount > 0) then {
    // Update UI
    [
      (ctrlParentControlsGroup _ctrlClassList),
      nil,
      GVAR(dynamicAttributesValues)
    ] call FUNC(dynamicClassSelect_updateUI);

    private _classesWord = localize LSTRING(dynamicClassSelect_classWordSingle);

    if (_addedCount > 1) then {
      if (_addedCount > 4) then {
        _classesWord = localize LSTRING(dynamicClassSelect_classWordMany);
      } else {
        _classesWord = localize LSTRING(dynamicClassSelect_classWordFew);
      };
    };

    [
      format [
        localize LSTRING(dynamicClassSelect_addedClassesToList),
        _addedCount,
        _classesWord,
        [
          "",
          format [
            " " + (localize LSTRING(dynamicClassSelect_addedClassesToList_Rejected)),
            _rejectedCount
          ]
        ] select (_rejectedCount > 0)
      ],
      0,
      _ctrlClassEditNotfBar
    ] call FUNC(dynamicClassSelect_showNotification);
  } else {
    [
      localize LSTRING(dynamicClassSelect_notRecognizedAnyClass),
      2,
      _ctrlClassEditNotfBar
    ] call FUNC(dynamicClassSelect_showNotification);
  };

  // Reset edit box
  _ctrlClassEdit ctrlSetText "";
}];

// Handle del keyDown (removing class from classList)
_ctrlClassList ctrlAddEventHandler ["keyDown", {
  params ["_control", "_key", "_shift", "_ctrl", "_alt"];

  // Exit if not del key
  if !(_key isEqualTo DIK_DELETE) exitWith {};
  if !([_shift, _ctrl, _alt] isEqualTo [false, false, false]) exitWith {};

  private _curSelRow = lnbCurSelRow _control;

  // Exit if nothing is selected
  if (_curSelRow < 0) exitWith {};

  // Remove class from list
  [
    _control,
    _curSelRow,
    true,
    _control getVariable QGVAR(classListNotfBar)
  ] call FUNC(dynamicClassSelect_removeClassFromList);
}];

// Handle removeButton click (removing class from classList)
_ctrlClassListRemoveButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlClassList = _control getVariable QGVAR(classList);
  private _curSelRow = lnbCurSelRow _ctrlClassList;

  // Exit if nothing is selected
  if (_curSelRow < 0) exitWith {};

  // Remove class from list
  [
    _ctrlClassList,
    _curSelRow,
    true,
    _control getVariable QGVAR(classListNotfBar)
  ] call FUNC(dynamicClassSelect_removeClassFromList);
}];

// Handle arrowLeft click (decrease selected classname weight)
_ctrlArrowLeft ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlClassList = _control getVariable QGVAR(classList);
  [_ctrlClassList, lnbCurSelRow _ctrlClassList, -1] call FUNC(dynamicClassSelect_updateClassWeight);
}];

// Handle arrowRight click (increase selected classname weight)
_ctrlArrowRight ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlClassList = _control getVariable QGVAR(classList);
  [_ctrlClassList, lnbCurSelRow _ctrlClassList, 1] call FUNC(dynamicClassSelect_updateClassWeight);
}];

// Init dynamic attribute
private _initData = [_this, _config, _value, {}, nil] call FUNC(initDynamicAttribute);
