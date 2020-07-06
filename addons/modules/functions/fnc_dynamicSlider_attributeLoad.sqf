#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicSlider attributeLoad handler
 */

private _ctrlSlider = _this controlsgroupctrl 100;
private _ctrlSliderEdit = _this controlsgroupctrl 101;

// Setup slider range
private _range = getArray (_config >> QGVAR(range));
if (_range isEqualTo []) then {
  _range = [0, 1];
};
_ctrlSlider sliderSetRange _range;

private _valueUnit = getText (_config >> QGVAR(valueUnit));

// Init slider functionality
[_ctrlSlider, _ctrlSliderEdit, _valueUnit] call bis_fnc_initSliderValue;
// Set current value
[_ctrlSlider, _ctrlSliderEdit, _valueUnit, _value] call bis_fnc_initSliderValue;

// Init dynamic attribute
private _initData = [_this, _config, _value, {
    // Do not support updates for performance & usability reasons
}, nil] call FUNC(initDynamicAttribute);
