#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN skill load handler
 */

_ctrlGroup = _this # 0;
private _ctrlSlider = _ctrlGroup controlsgroupctrl 100;
private _ctrlSliderDesc = _ctrlGroup controlsgroupctrl 105;
_ctrlSlider setVariable [QGVAR(sliderDesc), _ctrlSliderDesc];

[
  _ctrlSlider,
  _ctrlGroup controlsgroupctrl 101
] call bis_fnc_initSliderValue;

_ctrlSlider ctrlAddEventHandler ["sliderPosChanged", {
  params ["_control", "_newValue"];
  private _skillInfo = _newValue call FUNC(getSkillInfo);
  _control ctrlSetTooltip (_skillInfo # 0);

  private _ctrlSliderDesc = _control getVariable QGVAR(sliderDesc);
  _ctrlSliderDesc ctrlSetStructuredText parseText (_skillInfo # 1);
}];
