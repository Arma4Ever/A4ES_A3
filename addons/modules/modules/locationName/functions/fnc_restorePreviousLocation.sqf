#include "script_component.hpp"
/*
 * Author: Krzyciu
 * restore previous location parameters
 */

params ["_logic"];

private _previous = _logic getVariable [QGVAR(previous), []];

if (_previous isNotEqualTo []) then {
  _previous#0 setText _previous#1;
  _previous#0 setType _previous#2;
};
