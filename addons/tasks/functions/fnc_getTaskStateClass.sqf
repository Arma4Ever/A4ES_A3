#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns class of given task state id
 */

params ["_taskStateId"];

[
  "created",
  "assigned",
  "succeeded",
  "failed",
  "canceled"
] param [_taskStateId, "none"]
