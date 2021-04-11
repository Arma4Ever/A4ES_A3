#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Setups initial module variables
 */

params ["_module", ["_validate", true, [true]]];

// Save entityID in case of future unregistration
_module setVariable [QGVAR(entityID), get3DENEntityID _module];

private _moduleValues = _module getVariable [QGVAR(moduleValues), (false call CBA_fnc_createNamespace)];
private _moduleValuesProperties = _module getVariable QGVAR(moduleValueProperties);

// Setup list linking attributes with properties
if (isNil "_moduleValuesProperties") then {
  _moduleValuesProperties = [];

  // Apply values to namespace
  private _attributesConfigs = (
    QUOTE((getNumber (_x >> QQGVAR(observeValue))) isEqualTo 1) configClasses (
      (configOf _module) >> "Attributes"
    )
  );

  {
    _moduleValuesProperties pushBack [getText (_x >> "property"), configName _x];
  } forEach _attributesConfigs;

  // Cache list for future updates
  _module setVariable [QGVAR(moduleValueProperties), _moduleValuesProperties];
};

// Update module values
{
  _x params ["_property", "_className"];
  private _propertyValue = _module get3DENAttribute _property;
  if ((count _propertyValue) > 0) then {
    _propertyValue = _propertyValue # 0;
  };

  _moduleValues setVariable [_className, _propertyValue];
} forEach _moduleValuesProperties;

// Save namespace in module
_module setVariable [QGVAR(moduleValues), _moduleValues];

#ifdef DEBUG_MODE_FULL
private _valuesList = '';
{
  _valuesList = format ['%1%2 = %3 ', _valuesList, _x, _moduleValues getVariable _x];
} forEach (allVariables _moduleValues);
LOG_4("Module '%1' (ID: %2) values updated (values: '%3' validate: %4).",typeof _module,str get3DENEntityID _module,_valuesList,str _validate);
#endif

if (_validate) then {
  [_module, _moduleValues] call FUNC(validateEntity);
};

_moduleValues
