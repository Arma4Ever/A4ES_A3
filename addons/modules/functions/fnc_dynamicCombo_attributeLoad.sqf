#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicCombo attributeLoad handler
 */

// Original BI function
_ctrlCombo = _this controlsGroupCtrl 100;
_cfgValues = _config >> 'Values';

if (isclass _cfgValues) then {
  {
    _lbadd = _ctrlCombo lbadd gettext (_x >> 'name');
    if (isnumber (_x >> 'value')) then {
      _valueConfig = getnumber (_x >> 'value');
      _ctrlCombo lbsetdata [_lbadd,str _valueConfig];
      _ctrlCombo lbsetvalue [_lbadd,_valueConfig];
    } else {
      _ctrlCombo lbsetdata [_lbadd,gettext (_x >> 'value')];
    };

    _ctrlCombo lbsetpicture [_lbadd,gettext (_x >> 'picture')];
    _ctrlCombo lbsetpictureright [_lbadd,gettext (_x >> 'pictureRight')];
    _ctrlCombo lbsettooltip [_lbadd,gettext (_x >> 'tooltip')];
    if (getnumber (_x >> 'default') > 0) then {
      _ctrlCombo lbsetcursel _lbadd;
    };
  } foreach configproperties [_cfgValues,'isclass _x'];
};

if (lbsize _ctrlCombo == 0) then {
  {
    _lbAdd = _ctrlCombo lbadd _x;
    _ctrlCombo lbsetvalue [_lbAdd,1 - _foreachindex];
    _ctrlCombo lbsetdata [_lbAdd,str (1 - _foreachindex)];
  } foreach [localize 'str_enabled', localize 'str_disabled'];
};

if (_value isequaltype true) then {
  _value = [0,1] select _value;
} else {
  if (_value isequaltype '') then {
    _value = tolower _value;
  };
};

for '_i' from 0 to (lbsize _ctrlCombo - 1) do {
  if (_value in [parsenumber (_ctrlCombo lbdata _i), tolower (_ctrlCombo lbdata _i), _ctrlCombo lbvalue _i]) exitwith {
    _ctrlCombo lbsetcursel _i;
  };
};

// Exit if framework disabled for this display
if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
  INFO_1("Skipping init of dynamic attribute '%1', framework disabled for current display",ctrlClassName _ctrlCombo);
};

// Init dynamic attribute
private _inited = [_this, _config, _value] call FUNC(initDynamicAttribute);

if (!_inited) exitWith {};

_ctrlCombo ctrlAddEventHandler ["LBSelChanged", {
  params ["_control", "_selectedIndex"];

  private _value = _control lbData _selectedIndex;
  [ctrlParentControlsGroup _control, _value] call FUNC(updateDynamicAttribute);
}];
