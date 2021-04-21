#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Knocks in tanks hatch
 */


[1, _this, {
  (_this # 0) params ["_target"];

  [localize LSTRING(KnockedInHatch), 2] call ACEFUNC(common,displayTextStructured);
  [QGVAR(knockingInHatch), _target, crew _target] call CBA_fnc_targetEvent;
}, {}, localize LSTRING(KnockOnHatch_progress), {true}] call ACEFUNC(common,progressBar);
