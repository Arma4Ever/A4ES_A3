#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN dynamicCombo attributeLoad handler
 */

private _control = _this controlsGroupCtrl 100;

private _options = [];

// Read options from attribute config
private _attributeValuesConfig = _config >> 'Values';
if (isClass _attributeValuesConfig) then {
  {
    private ["_optionValue"];

    if (isNumber (_x >> 'value')) then {
      _optionValue = getNumber (_x >> 'value');
    } else {
      _optionValue = getText (_x >> 'value');
    };

    _options pushback [
      getText (_x >> 'name'),
      _optionValue,
      ((getNumber (_x >> 'default')) isNotEqualTo 0),
      getText (_x >> 'tooltip'),
      getText (_x >> 'picture'),
      getText (_x >> 'pictureRight')
    ];
  } foreach configProperties [_attributeValuesConfig, 'isClass _x'];
};

// Get options from insert function
private _hasInsertFunction = false;
private _insertFunctionName = getText (_config >> QGVAR(insertValues));
if (_insertFunctionName isNotEqualTo "") then {
  private _insertFunction = missionNamespace getVariable [_insertFunctionName, ''];
  if (_insertFunction isEqualType {}) then {
    _hasInsertFunction = true;
    private _insertOptions = GVAR(dynamicAttributesModule) call _insertFunction;
    if (_insertOptions isEqualType []) then {
      _options append _insertOptions;
    } else {
      ERROR_1("InsertValues function of '%1' attribute returned wrong type.",configName _config);
    };
  } else {
    ERROR_2("Missing insertValues function of attribute '%1' (function name '%2')",configName _config,_insertFunctionName);
  };
};

// Add options to control
{
  _x params [
    ["_name", ""], ["_value", 0], ["_isDefault", false],
    ["_tooltip", ""], ["_picture", ""], ["_pictureRight", ""]
  ];

  private _option = _control lbAdd _name;
  if (_value isEqualType 0) then {
    _control lbSetData [_option, str _value];
    _control lbSetValue [_option, _value];
  } else {
    _control lbSetData [_option, _value];
  };

  _control lbSettooltip [_option, _tooltip];
  _control lbSetPicture [_option, _picture];
  _control lbSetPictureRight [_option, _pictureRight];

  if (_isDefault) then {
    _control lbSetCurSel _option;
  };
} forEach _options;

// Add enable/disable options if options are empty (and insert function is not present - sometimes it is desirable to have empty options list)
if ((lbSize _control) isEqualTo 0 && !_hasInsertFunction) then {
  {
    private _option = _control lbAdd _x;
    private _value = 1 - _forEachIndex;
    _control lbSetValue [_option, _value];
    _control lbSetData [_option, str _value];
  } forEach [localize 'str_enabled', localize 'str_disabled'];
};

// Normalize control value
if (_value isEqualType true) then {
  _value = parseNumber _value;
} else {
  if (_value isEqualType '') then {
    _value = tolower _value;
  };
};

// Select option with current value
for '_i' from 0 to (lbSize _control - 1) do {
  if (_value in [
    parseNumber (_control lbData _i),
    toLower (_control lbData _i),
    _control lbValue _i
  ]) exitwith {
    _control lbSetCurSel _i;
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
