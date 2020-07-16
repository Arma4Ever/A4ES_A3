#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit data for name tag draw
 */

params ["_unit", "_getTeamColor"];

private _rank = _unit call FUNC(getUnitRank);

[
  _unit,
  _unit call EFUNC(common,getUnitName),
  _rank # 0,
  _rank # 1,
  if (_getTeamColor) then {
    _unit getVariable [QGVAR(unitColor), [[1,1,1], "#ffffff"]]
  } else {
    [[1,1,1], "#ffffff"]
  },
  _unit call EFUNC(squads,isLeader),
  _unit getVariable [QEGVAR(radio,isSpeaking), false],
  _unit getVariable ["ACE_isUnconscious", false],
  _unit getVariable [QGVAR(specialIcon), ""]
]
