#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN skill attributeLoad handler
 */

private _ctrlSlider = _this controlsgroupctrl 100;
private _ctrlSliderEdit = _this controlsgroupctrl 101;
private _ctrlSliderDesc = _this controlsgroupctrl 105;

_ctrlSlider setVariable [QGVAR(sliderDesc), _ctrlSliderDesc];
_ctrlSliderEdit setVariable [QGVAR(slider), _ctrlSlider];

// Init slider functionality
[_ctrlSlider, _ctrlSliderEdit, "%", _value] call bis_fnc_initSliderValue;

private _sliderPosChanged = {
  params ["_control", "_newValue"];
  private _skillInfo = _newValue call FUNC(getSkillInfo);
  _control ctrlSetTooltip (_skillInfo # 0);

  private _ctrlSliderDesc = _control getVariable QGVAR(sliderDesc);
  _ctrlSliderDesc ctrlSetStructuredText parseText (_skillInfo # 1);
};

_ctrlSlider ctrlAddEventHandler ["sliderPosChanged", _sliderPosChanged];
_ctrlSliderEdit ctrlAddEventHandler ["killFocus", {
  _this spawn {
    params ["_control"];
    private _ctrlSlider = _control getVariable QGVAR(slider);
    private _ctrlSliderDesc = _ctrlSlider getVariable QGVAR(sliderDesc);

    // Wait for slider update
    sleep 0.001;

    private _newValue = sliderPosition _ctrlSlider;
    private _skillInfo = _newValue call FUNC(getSkillInfo);

    _ctrlSlider ctrlSetTooltip (_skillInfo # 0);
    _ctrlSliderDesc ctrlSetStructuredText parseText (_skillInfo # 1);
  };
}];

[_ctrlSlider, _value] call _sliderPosChanged;
