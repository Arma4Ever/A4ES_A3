#include "script_component.hpp"
/*
 * Author: Krzyciu
 * restore previous location parameters
 */

params ["_logic"];

private _previous = _logic getVariable [QGVAR(previous), []];
_previous params ["_mapLocation", "_text", "_locationType"];

if (_previous isNotEqualTo []) then {
  _mapLocation setText _text;
  _mapLocation setType _locationType;
};
