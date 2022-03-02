#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for curator module
 */

params ["_module", "_values"];

private _warnings = [];

private _class = _values getVariable [QGVAR(objectClass), ""];
if (_class isEqualTo "") then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(fortifyObject_Warning_ObjectClassEmpty_Desc),
    QGVAR(objectClass)
  ];
} else {
  if !(isClass (configFile >> "CfgVehicles" >> _class)) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(fortifyObject_Warning_InvalidObjectClass_Desc),
      QGVAR(objectClass)
    ];
  };
};

_warnings
