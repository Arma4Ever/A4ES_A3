#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit data for name tag draw
 */

params ["_unit"];

private _rank = _unit call FUNC(getUnitRank);

[
  _unit,
  _unit getVariable ["ACE_Name", localize LSTRING(NoName)],
  _rank # 0,
  _rank # 1,
  _unit getVariable [QGVAR(unitColor), [[1,1,1], "#ffffff"]],
  (leader group _unit) == _unit,
  _unit getVariable [QGVAR(isSpeaking), false],
  _unit getVariable ["ACE_isUnconscious", false],
  _unit getVariable [QGVAR(specialIcon), ""]
]
