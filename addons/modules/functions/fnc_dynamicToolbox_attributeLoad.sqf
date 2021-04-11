#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicToolbox attributeLoad handler
 */

private _ctrlToolbox = _this controlsGroupCtrl 100;
private _ctrlDescription = _this controlsGroupCtrl IDC_DISPLAY3DENEDITATTRIBUTES_ATTRIBUTE_DESC;

private _controlClassName = getText (_config >> "control");
private _controlConfig = configFile >> "Cfg3DEN" >> "Attributes" >> _controlClassName >> "Controls" >> "Value";
private _columnsCount = getNumber (_controlConfig >> "columns");
private _maxIndex = _columnsCount - 1;

for "_i" from 0 to _maxIndex do {
  if (_value isEqualTo (_ctrlToolbox lbValue _i)) exitWith {
    _ctrlToolbox lbSetCurSel _i;
  };
};

private _descriptions = getArray (_controlConfig >> QGVAR(descriptions));

if (_descriptions isNotEqualTo []) then {
  // Save references
  _ctrlToolbox setVariable [QGVAR(description), _ctrlDescription];
  _ctrlToolbox setVariable [QGVAR(descriptions), _descriptions];
  // Prep sel changed handler (prep in separate var so we can call it initially)
  private _curSelChanged = {
    params ["_control", "_selectedIndex"];

    private _ctrlDescription = _control getVariable QGVAR(description);
    private _descriptions = _control getVariable QGVAR(descriptions);

    // Update description with option's description
    private _indexDescription = _descriptions param [_selectedIndex, ""];
    _ctrlDescription ctrlSetStructuredText parseText _indexDescription;

    // Get heights of description and toolbox controls
    private _ctrlDescriptionH = ctrlTextHeight _ctrlDescription;
    private _controlH = (ctrlPosition _control) # 3;

    // Update description height
    private _ctrlDescriptionPos = ctrlPosition _ctrlDescription;
    _ctrlDescriptionPos set [3, _ctrlDescriptionH];
    _ctrlDescription ctrlSetPosition _ctrlDescriptionPos;
    _ctrlDescription ctrlCommit 0;

    // Update group height
    private _controlGroup = ctrlParentControlsGroup _control;
    private _controlGroupPos = ctrlPosition _controlGroup;
    _controlGroupPos set [3, _controlH + _ctrlDescriptionH];
    _controlGroup ctrlSetPosition _controlGroupPos;
    _controlGroup ctrlCommit 0;
  };

  // Set initial description
  [_ctrlToolbox, lbCurSel _ctrlToolbox] call _curSelChanged;

  // Add event handler
  _ctrlToolbox ctrlAddEventHandler ["ToolBoxSelChanged", _curSelChanged];
};

// Init dynamic attribute
private _initData = [_this, _config, _value, {
  _this ctrlAddEventHandler ["ToolBoxSelChanged", {
    // Exec update in next frame to allow description height to update
    _this spawn {
      params ["_control", "_selectedIndex"];
      sleep 0.001;

      private _value = _control lbValue _selectedIndex;
      [ctrlParentControlsGroup _control, _value] call FUNC(updateDynamicAttribute);
    };
  }];
}, _ctrlToolbox] call FUNC(initDynamicAttribute);
