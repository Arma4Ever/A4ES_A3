#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets unique id attribute on given module
 */

params ["_logic", "_attribute", "_format"];

private _id = (_logic get3DENAttribute _attribute) param [0, ""];
if (_id isEqualTo "") then {
  _id = format [_format, get3DENEntityID _logic];
  TRACE_2("Setuping unique id attribute",_logic,_id);
  _logic set3DENAttribute [_attribute, _id];
};
