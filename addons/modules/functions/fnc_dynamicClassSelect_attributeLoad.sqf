#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicClassSelect attributeLoad handler
 */

private _ctrlAssetsTree = _this controlsGroupCtrl 500;
private _ctrlSearchEdit = _this controlsGroupCtrl 501;
private _ctrlSearchButton = _this controlsGroupCtrl 502;
private _ctrlAssetsTreeNotfBar = _this controlsGroupCtrl 503;
private _ctrlClassList = _this controlsGroupCtrl 101;
private _ctrlClassAddButton = _this controlsGroupCtrl 121;
private _ctrlClassAddNotf = _this controlsGroupCtrl 122;
private _ctrlClassListModeTitle = _this controlsGroupCtrl 103;
private _ctrlRemoveFromListButton = _this controlsGroupCtrl 104;
private _ctrlArrowLeft = _this controlsGroupCtrl 393101;
private _ctrlArrowRight = _this controlsGroupCtrl 393102;

// Setup references
_ctrlSearchEdit setVariable [QGVAR(assetsTree), _ctrlAssetsTree];
_ctrlSearchButton setVariable [QGVAR(searchEdit), _ctrlSearchEdit];
_ctrlSearchButton setVariable [QGVAR(assetsTree), _ctrlAssetsTree];
_ctrlAssetsTree setVariable [QGVAR(classList), _ctrlClassList];
_ctrlAssetsTree setVariable [QGVAR(assetsTreeNotfBar), _ctrlAssetsTreeNotfBar];
_ctrlRemoveFromListButton setVariable [QGVAR(classList), _ctrlClassList];
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

// Handle del keyDown (removing class from classList)
_ctrlClassList ctrlAddEventHandler ["keyDown", {
  // TODO
  diag_log _this;
}];

// Handle removeButton click (removing class from classList)
_ctrlRemoveFromListButton ctrlAddEventHandler ["buttonClick", {
  params ["_control"];

  private _ctrlClassList = _control getVariable QGVAR(classList);
  private _curSelRow = lnbCurSelRow _ctrlClassList;

  // Exit if nothing is selected
  if (_curSelRow < 0) exitWith {};

  [_ctrlClassList, _curSelRow] call FUNC(dynamicClassSelect_removeClassFromList);
}];

// Update labels
_this call FUNC(dynamicClassSelect_updateUI);

// Init dynamic attribute
private _initData = [_this, _config, _value, {}, nil] call FUNC(initDynamicAttribute);
