#include "script_component.hpp"
#include "\z\a4es\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Validates entity and updates entity warnings
 */

params ["_entity", ["_values", locationNull, [locationNull]], ["_updateWarnings", true, [true]]];
TRACE_3("validateEntity",_entity,_values,_updateWarnings);

private _className = typeOf _entity;
private _validatorName = GVAR(validatorsCache) getVariable _className;
#ifdef DEBUG_MODE_FULL
private _validatorFromCache = true;
#endif

// Update validators cache
if (isNil "_validatorName") then {
  _validatorName = getText (configFile >> "CfgVehicles" >> _className >> QGVAR(validator));
  GVAR(validatorsCache) setVariable [_className, _validatorName];
  #ifdef DEBUG_MODE_FULL
  _validatorFromCache = false;
  #endif
};

private _validator = missionNamespace getVariable [_validatorName, ''];

// Exit without warnings if entity has no validator
if !(_validator isEqualType {}) exitWith {
  LOG_2("Validating entity '%1' aborted - no validator (tried '%2').",_className,_validatorName);
  []
};

#ifdef DEBUG_MODE_FULL
private _valuesList = '';
{
  _valuesList = format ['%1%2 = %3 ', _valuesList, _x, _values getVariable _x];
} forEach (allVariables _values);
LOG_5("Validating entity '%1' (validator: '%2' values: '%3' read from cache: %4 update warnings: %5).",_className,_validatorName,_valuesList,str _validatorFromCache,str _updateWarnings);
#endif
// Validate entity
private _warnings = [_entity, _values] call _validator;

// Exit without warnings if validator didn't return an array
if !(_warnings isEqualType []) exitWith {
  ERROR_1("Validator of '%1' returned wrong type.",_className);
  []
};

LOG_3("Entity '%1' validated - warnings = %2 (updateWarnings: %3)",_className,str _warnings,str _updateWarnings);

if (_updateWarnings) then {
  // Set entity warnings
  [_entity, _warnings] call FUNC(setEntityWarnings);
};

// Return warnings
_warnings
