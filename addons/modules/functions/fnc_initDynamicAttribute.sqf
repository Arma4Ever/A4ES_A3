#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init dynamic attribute
 */

params ["_controlGroup", "_config", "_value", "_observer", "_observerParams"];

private _configName = configName _config;
private _controlGroupClass = ctrlClassName _controlGroup;

// Exit if framework disabled for this display
if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
  LOG_1("Skipping init of dynamic attribute '%1' (framework disabled for current display).",_configName);
};
private _observeValue = (getNumber (_config >> QGVAR(observeValue))) isEqualTo 1;
private _parsedValue = '';

if (_observeValue) then {
  private _attributeSaveFunction = getText (configFile >> "Cfg3DEN" >> "Attributes" >> _controlGroupClass >> "attributeSave");

  // Exit if there's no attributeSave function in control's config
  if (_attributeSaveFunction isEqualTo "") then {
    LOG_1("Missing attributeSave property in dynamic attribute '%1'.",_configName);

    // Use simple return as save attribute function
    _attributeSaveFunction = "_value";
  };

  // Compile function
  _attributeSaveFunction = compile _attributeSaveFunction;

  // Parse value
  _parsedValue = [_this, _attributeSaveFunction] call {
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
  GVAR(dynamicAttributesValues) setVariable [_configName, _parsedValue];

  // Add observer
  _observerParams call _observer;
};

private _conditionActive = getText (_config >> QGVAR(conditionActive));
private _isReactive = !(_conditionActive isEqualTo "");

if (_isReactive) then {
  // Save compiled condition
  _controlGroup setVariable [QGVAR(conditionActive), compile _conditionActive];

  // Register attribute as reactive
  GVAR(reactiveAttributes) pushBackUnique _controlGroup;
};

LOG_5("Inited dynamic attribute '%1' (observeValue: %2 isReactive: %3 parsedValue: %4 condition active: '%5').",_configName,str _observeValue,str _isReactive,str _parsedValue,_conditionActive);
