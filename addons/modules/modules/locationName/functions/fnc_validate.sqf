#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * Validator for locationName module
 */

params ["_module", "_values"];

private _warnings = [];

if (_values getVariable [QGVAR(replaceName), "false"]) then {
  private _name = _values getVariable [QGVAR(customName), ""];
  if (_name isEqualTo "") then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(locationName_Warning_CustomNameEmpty_Desc),
      QGVAR(customName)
    ];
  };
};

_warnings