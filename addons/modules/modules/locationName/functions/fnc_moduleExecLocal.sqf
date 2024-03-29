#include "script_component.hpp"
/*
 * Author: Krzyciu
 * locationName module local exec function
 */

params ["_mapLocation", "_customName", "_locationType"];

if (!hasInterface) exitWith {
  TRACE_1("locationName_moduleExecLocal abort: no interface",_customName);
};

private _editableLocation = createLocation [_mapLocation];
_editableLocation setType _locationType;
_editableLocation setText _customName;
