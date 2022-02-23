#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Converts module logic unit into namespace (simple object)
 */

params ["_logic"];
TRACE_1("convertToNamespace", _logic);

//private _namespace = createSimpleObject ["a3\weapons_f\empty.p3d", getPosWorld _logic, false];
private _namespace = createSimpleObject ["CBA_NamespaceDummy", getPosASL _logic, false];

// Get module attributes
private _attributes = "true" configClasses ((configOf _logic) >> "Attributes");
_attributes = _attributes apply {configName _x};
// Get global attributes
private _globalAttributes = "getNumber (_x >> '__isLocalAttr') == 0" configClasses ((configOf _logic) >> "Attributes");
_globalAttributes = _globalAttributes apply {configName _x};

// Save area var
_namespace setVariable ["objectarea", _logic getVariable "objectarea", true];

// Rewrite all attribute variables
{
  if (isNil {_logic getVariable _x}) then {continue;};
  #ifdef DEBUG_MODE_FULL
  private _globalAttr = _x in _globalAttributes;
  TRACE_2("Convert var",_x,_globalAttr);
  #endif
  _namespace setVariable [_x, _logic getVariable _x, _x in _globalAttributes];
} forEach _attributes;

TRACE_2("Logic converted",_logic,_namespace);

_namespace
