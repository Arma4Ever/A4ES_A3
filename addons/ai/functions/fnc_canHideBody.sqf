#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if body can be hidden
 */

params ["_target"];
TRACE_1("canHideBody",_target);

(
  !(alive _target) &&
  {!(isPlayer _target)} &&
  {!(_target getVariable [QEGVAR(common,isPlayer), false])}
)
