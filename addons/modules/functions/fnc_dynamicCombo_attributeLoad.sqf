#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicCombo attributeLoad handler
 */

private _control = _this controlsGroupCtrl 100;

private _options = [];

//TODO!
private _insertOptions = _config >> QGVAR(insertOptions);

_cfgValues = _config >> 'Values';

if (isclass _cfgValues) then {
  {
    _lbadd = _control lbadd gettext (_x >> 'name');
    if (isnumber (_x >> 'value')) then {
      _valueConfig = getnumber (_x >> 'value');
      _control lbsetdata [_lbadd,str _valueConfig];
      _control lbsetvalue [_lbadd,_valueConfig];
    } else {
      _control lbsetdata [_lbadd,gettext (_x >> 'value')];
    };

    _control lbsetpicture [_lbadd,gettext (_x >> 'picture')];
    _control lbsetpictureright [_lbadd,gettext (_x >> 'pictureRight')];
    _control lbsettooltip [_lbadd,gettext (_x >> 'tooltip')];
    if (getnumber (_x >> 'default') > 0) then {
      _control lbsetcursel _lbadd;
    };
  } foreach configproperties [_cfgValues,'isclass _x'];
};

if (lbsize _control == 0) then {
  {
    _lbAdd = _control lbadd _x;
    _control lbsetvalue [_lbAdd,1 - _foreachindex];
    _control lbsetdata [_lbAdd,str (1 - _foreachindex)];
  } foreach [localize 'str_enabled', localize 'str_disabled'];
};

if (_value isequaltype true) then {
  _value = [0,1] select _value;
} else {
  if (_value isequaltype '') then {
    _value = tolower _value;
  };
};

for '_i' from 0 to (lbsize _control - 1) do {
  if (_value in [parsenumber (_control lbdata _i), tolower (_control lbdata _i), _control lbvalue _i]) exitwith {
    _control lbsetcursel _i;
  };
};

// Init dynamic attribute
private _initData = [_this, _config, _value, {
  _this ctrlAddEventHandler ["LBSelChanged", {
    params ["_control", "_selectedIndex"];

    private _value = _control lbData _selectedIndex;
    [ctrlParentControlsGroup _control, _value] call FUNC(updateDynamicAttribute);
  }];
}, _control] call FUNC(initDynamicAttribute);
