#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Setups initial module variables
 */

params ["_module"];

// Save entityID in case of future unregistration
_module setVariable [QGVAR(entityID), get3DENEntityID _module];

private _moduleValues = _module getVariable QGVAR(moduleValues);
#ifdef DEBUG_MODE_FULL
private _valuesFromModule = true;
#endif

// Create module values namespace if not created before
if (isNil "_moduleValues") then {
  _moduleValues = false call CBA_fnc_createNamespace;

  // Apply values to namespace
  private _attributesConfigs = (
    QUOTE((getNumber (_x >> QQGVAR(observeValue))) isEqualTo 1) configClasses (
      configFile >> "CfgVehicles" >> (typeOf _module) >> "Attributes"
    )
  );

  {
    private _property = getText (_x >> "property");
    private _propertyValue = _module get3DENAttribute _property;
    if ((count _propertyValue) > 0) then {
      _propertyValue = _propertyValue # 0;
    };

    _moduleValues setVariable [configName _x, _propertyValue];
  } forEach _attributesConfigs;

  // Save namespace in module
  _module setVariable [QGVAR(moduleValues), _moduleValues];

  #ifdef DEBUG_MODE_FULL
  _valuesFromModule = false;
  #endif
};

#ifdef DEBUG_MODE_FULL
private _valuesList = '';
{
  _valuesList = format ['%1%2 = %3 ', _valuesList, _x, _moduleValues getVariable _x];
} forEach (allVariables _moduleValues);
INFO_4("Module '%1' (ID: %2) inited (values: '%3' loaded from module: %4).",typeof _module,str get3DENEntityID _module,_valuesList,str _valuesFromModule);
#endif

_moduleValues
