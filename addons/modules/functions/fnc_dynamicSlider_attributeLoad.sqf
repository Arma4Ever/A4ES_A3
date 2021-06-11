#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicSlider attributeLoad handler
 */

private _ctrlSlider = _this controlsgroupctrl 100;
private _ctrlSliderEdit = _this controlsgroupctrl 101;

// Setup slider range
private _range = getArray (_config >> QGVAR(range));
private _valueUnit = getText (_config >> QGVAR(valueUnit));
private _valueCoef = getNumber (_config >> QGVAR(valueCoef));

if (_range isEqualTo []) then {
  _range = [0, 1];
};

if (_valueCoef isEqualTo 0) then {
  _valueCoef = 1;
};

if (_valueUnit isEqualTo "%" && {_range isEqualTo [0, 1]}) then {
  _range = [0, 100];
  _valueCoef = 0.01;
};

_ctrlSlider sliderSetRange _range;

_ctrlSlider setVariable [QGVAR(valueUnit), _valueUnit];
_ctrlSlider setVariable [QGVAR(sliderEdit), _ctrlSliderEdit];
_ctrlSlider setVariable [QGVAR(valueCoef), _valueCoef];

_ctrlSliderEdit setVariable [QGVAR(sliderControl), _ctrlSlider];
_ctrlSliderEdit setVariable [QGVAR(valueUnit), _valueUnit];

_ctrlSlider ctrlAddEventHandler ["sliderPosChanged", {
  params ["_control"];

  private _valueUnit = _control getVariable [QGVAR(valueUnit), ""];
  private _value = sliderPosition _control;
  private _ctrlEdit = _control getVariable [QGVAR(sliderEdit), controlNull];

  _ctrlEdit ctrlSetText format ["%1%2", _value toFixed 0, _valueUnit];
}];

_ctrlSliderEdit ctrlAddEventHandler ["killFocus", {
  params ["_control"];

  private _ctrlSlider = _control getVariable [QGVAR(sliderControl), controlNull];
  private _valueUnit = _control getVariable [QGVAR(valueUnit), ""];

  private _sliderRange = sliderRange _ctrlSlider;

  private _textArray = toArray (ctrlText _control);
  private _value = parseNumber (toString (_textArray - (_textArray - (toArray '.01234567892'))));

  _value = ((round _value) max (_sliderRange # 0)) min (_sliderRange # 1);

  _control ctrlSetText format ["%1%2", _value, _valueUnit];
  _ctrlSlider sliderSetPosition _value;
}];

_value = (round (_value / _valueCoef)) max (_range # 0) min (_range # 1);

_ctrlSliderEdit ctrlSetText (format ["%1%2", _value, _valueUnit]);
_ctrlSlider sliderSetPosition _value;

// Init dynamic attribute
private _initData = [_this, _config, _value, {
    // Do not support updates for performance & usability reasons
}, nil] call FUNC(initDynamicAttribute);
