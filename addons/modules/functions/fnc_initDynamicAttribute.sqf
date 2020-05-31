#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init dynamic attribute
 */

params ["_controlGroup", "_config", "_value"];

private _inited = false;
private _configName = configName _config;
private _controlGroupClass = ctrlClassName _controlGroup;

// Exit if framework disabled for this display
if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
  LOG_1("Skipping init of dynamic attribute '%1', framework disabled for current display",_configName);
  _inited
};

private _attributeSaveFunction = getText (configFile >> "Cfg3DEN" >> "Attributes" >> _controlGroupClass >> "attributeSave");

// Exit if there's no attributeSave function in control's config
if (_attributeSaveFunction isEqualTo "") then {
  LOG_1("Missing attributeSave property in dynamic attribute '%1'",_configName);

  // Use simple return as save attribute function
  _attributeSaveFunction = "_value";
};

// Compile function
_attributeSaveFunction = compile _attributeSaveFunction;

// Parse value
private _parsedValue = [_this, _attributeSaveFunction] call {
  params ["_params", "_fnc"];
  private _controlGroup = _params select 0;

  // Do not use private to allow access from attributeSave function
  _config = _params select 1;
  _value = _params select 2;

  // Return parsed value
  _controlGroup call _fnc
};

// Setup vars for future access
_controlGroup setVariable [QGVAR(attributeConfig), _config];
_controlGroup setVariable [QGVAR(attributeSaveFunction), _attributeSaveFunction];
GVAR(dynamicControlsValues) setVariable [_configName, _parsedValue];

private _activeCondition = getText (_config >> QGVAR(activeCondition));

_inited = true;

LOG_2("Inited dynamic attribute '%1', active condition: '%3'",_configName,_activeCondition);

// Don't register control as reactive if control has no condition
if (_activeCondition isEqualTo "") exitWith {_inited};

// Save compiled condition for refreshes
_controlGroup setVariable [QGVAR(activeCondition), compile _activeCondition];

// Register control as reactive
GVAR(reactiveAttributes) pushBackUnique _controlGroup;

_inited
