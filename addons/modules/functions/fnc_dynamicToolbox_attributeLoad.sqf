#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicToolbox attributeLoad handler
 */

private _ctrlToolbox = _this controlsGroupCtrl 100;

private _controlClassName = getText (_config >> "control");
private _columnsCount = getNumber (configFile >> "Cfg3DEN" >> "Attributes" >> _controlClassName >> "Controls" >> "Value" >> "columns");
private _maxIndex = _columnsCount - 1;

for "_i" from 0 to _maxIndex do {
  if (_value isEqualTo (_ctrlToolbox lbValue _i)) exitWith {
    _ctrlToolbox lbSetCurSel _i;
  };
};

// Init dynamic attribute
private _initData = [_this, _config, _value, {
  _this ctrlAddEventHandler ["ToolBoxSelChanged", {
    params ["_control", "_selectedIndex"];
    
    private _value = _control lbValue _selectedIndex;
    [ctrlParentControlsGroup _control, _value] call FUNC(updateDynamicAttribute);
  }];
}, _ctrlToolbox] call FUNC(initDynamicAttribute);
