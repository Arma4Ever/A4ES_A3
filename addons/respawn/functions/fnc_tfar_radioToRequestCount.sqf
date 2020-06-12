#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns radios to replace by TFAR, assigns inherited radio from old unit
 */

private _radios = _this call TFAR_fnc_radioToRequestCountOriginal;

if !(GVAR(inheritedRadio) isEqualTo "") then {
  _radios = _radios - [GVAR(inheritedRadio)];
  TFAR_currentUnit linkItem GVAR(inheritedRadio);
  GVAR(inheritedRadio) = "";
};

_radios
