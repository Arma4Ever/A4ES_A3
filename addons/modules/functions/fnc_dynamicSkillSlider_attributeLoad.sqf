#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicSkillSlider attributeLoad handler
 */

private _ctrlSlider = _this controlsgroupctrl 100;
private _ctrlSliderEdit = _this controlsgroupctrl 101;
private _ctrlSliderDesc = _this controlsgroupctrl 105;

_ctrlSlider setVariable [QGVAR(sliderDesc), _ctrlSliderDesc];
_ctrlSliderEdit setVariable [QGVAR(slider), _ctrlSlider];

// Init slider functionality
[_ctrlSlider, _ctrlSliderEdit] call bis_fnc_initSliderValue;
// Set current value
[_ctrlSlider, _ctrlSliderEdit, "%", _value] call bis_fnc_initSliderValue;

// Make handler as separate function so we can exec it in init
private _onSliderPosChanged = {
  params ["_control", "_newValue"];
  private _ctrlSliderDesc = _control getVariable QGVAR(sliderDesc);
  private _skillInfo = _newValue call EFUNC(ai,getSkillInfo);

  _control ctrlSetTooltip (_skillInfo # 0);
  _ctrlSliderDesc ctrlSetStructuredText parseText (_skillInfo # 1);
};

// Add slider changed eh
_ctrlSlider ctrlAddEventHandler ["sliderPosChanged", _onSliderPosChanged];

// Add edit focus eh
_ctrlSliderEdit ctrlAddEventHandler ["killFocus", {
  params ["_control"];
  private _ctrlSlider = _control getVariable QGVAR(slider);
  private _ctrlSliderDesc = _ctrlSlider getVariable QGVAR(sliderDesc);

  private _newValue = sliderPosition _ctrlSlider;
  private _skillInfo = _newValue call EFUNC(ai,getSkillInfo);

  _ctrlSlider ctrlSetTooltip (_skillInfo # 0);
  _ctrlSliderDesc ctrlSetStructuredText parseText (_skillInfo # 1);
}];

// Update desc for initial value
[_ctrlSlider, _value] call _onSliderPosChanged;

// Init dynamic attribute
private _initData = [_this, _config, _value, {
    // Do not support updates for performance & usability reasons
}, nil] call FUNC(initDynamicAttribute);
