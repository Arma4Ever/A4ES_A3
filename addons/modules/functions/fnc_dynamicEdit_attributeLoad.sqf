#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicEdit attributeLoad handler
 */

// Original BI function
private _control = _this controlsGroupCtrl 100;

if (typename _value != typename '') then {
  _value = str _value;
};

_control ctrlSetText _value;

// Init dynamic control
[_this, _config, _value] call FUNC(initDynamicAttribute);
