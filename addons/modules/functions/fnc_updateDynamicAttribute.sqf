#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates dynamic attribute value & triggers attributes update
 */
params ["_controlGroup"];

// Do not use private to allow access from attributeSave function
_config = _controlGroup getVariable QGVAR(attributeConfig);
_value = _this select 1;

private _attributeSaveFunction = _controlGroup getVariable QGVAR(attributeSaveFunction);
private _configName = configName _config;
private _parsedValue = _controlGroup call _attributeSaveFunction;

LOG_2("Updating dynamic attribute '%1' (value: %2).",_configName,str _parsedValue);

// Update control value
GVAR(dynamicAttributesValues) setVariable [_configName, _parsedValue];

// Update module values
GVAR(dynamicAttributesModule) setVariable [QGVAR(moduleValues), GVAR(dynamicAttributesValues)];

// Validate module
private _warnings = [
  GVAR(dynamicAttributesModule),
  GVAR(dynamicAttributesValues),
  // Don't update warnings, this is just validation of temporary values
  false
] call FUNC(validateEntity);

// Trigger module warnings refresh
[_warnings] call FUNC(refreshModuleWarnings);

// Trigger refresh of attributes
call FUNC(refreshAttributes);
