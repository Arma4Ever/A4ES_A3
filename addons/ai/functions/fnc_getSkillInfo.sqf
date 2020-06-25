#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns skill info based on given skill level
 */

params ["_skill"];

private _skillLevelsCfg = configFile >> QGVAR(skillLevels);
private _skillRanges = getArray (_skillLevelsCfg >> "ranges");

// Reverse ranges from top to bottom skill
reverse _skillRanges;

// Find index of first skill range with min not greater than skill
private _index = _skillRanges findIf {!(_skill < (_x # 0))};
private _skillLevel = (_skillRanges select _index) # 1;
private _skillLevelCfg = (_skillLevelsCfg >> _skillLevel);

[
  getText (_skillLevelCfg >> "name"),
  getText (_skillLevelCfg >> "description")
]
