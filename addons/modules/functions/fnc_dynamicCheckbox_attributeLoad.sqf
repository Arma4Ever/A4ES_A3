#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicCheckbox attributeLoad handler
 */

private _ctrlCheckbox = _this controlsGroupCtrl 100;
_ctrlCheckbox cbSetChecked _value;

// Init dynamic attribute
private _initData = [_this, _config, _value, {
  _this ctrlAddEventHandler ["CheckedChanged", {
    params ["_control", "_value"];

    [ctrlParentControlsGroup _control, _value] call FUNC(updateDynamicAttribute);
  }];
}, _ctrlCheckbox] call FUNC(initDynamicAttribute);
