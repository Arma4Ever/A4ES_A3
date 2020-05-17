#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN ranks combo control attributeLoad handler
 */

_ctrlCombo = _this controlsGroupCtrl 100;
_cfgValues = _config >> 'Values';
if (isclass _cfgValues) then {
  {
    _lbadd = _ctrlCombo lbadd gettext (_x >> 'name');

    _ctrlCombo lbsetdata [_lbadd, configName _x];
    _ctrlCombo lbsetpicture [_lbadd, getText (_x >> 'icon')];

    if (getnumber (_x >> 'default') > 0) then {
      _ctrlCombo lbsetcursel _lbadd;
    };

	} foreach configproperties [_cfgValues, 'isclass _x'];
};

if (lbsize _ctrlCombo == 0) then {
  {
    _lbAdd = _ctrlCombo lbadd _x;
    _ctrlCombo lbsetvalue [_lbAdd, 1 - _foreachindex];
    _ctrlCombo lbsetdata [_lbAdd, str (1 - _foreachindex)];
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
