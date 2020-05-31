#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates dynamic attribute value & triggers reactive attributes update
 */
params ["_controlGroup"];

// Do not use private to allow access from attributeSave function
_config = _controlGroup getVariable QGVAR(attributeConfig);
_value = _this select 1;

private _attributeSaveFunction = _controlGroup getVariable QGVAR(attributeSaveFunction);
private _configName = configName _config;
private _parsedValue = _controlGroup call _attributeSaveFunction;

LOG_2("Updating dynamic attribute '%1' with value %2",_configName,_parsedValue);

// Update control value
GVAR(dynamicAttributesValues) setVariable [_configName, _parsedValue];

// Trigger refresh of reactive attributes
call FUNC(refreshReactiveAttributes);
