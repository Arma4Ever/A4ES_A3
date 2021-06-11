#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicSlider attributeSave handler
 */

private _ctrlSlider = _this controlsgroupctrl 100;

private _value = sliderposition _ctrlSlider;
private _valueCoef = _ctrlSlider getVariable [QGVAR(valueCoef), 1];

_value * _valueCoef
