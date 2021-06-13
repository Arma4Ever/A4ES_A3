#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit rank & icon
 */

params ["_unit"];

private _rankName = _unit getVariable [QGVAR(rankName), ""];
private _rankIcon = _unit getVariable [QGVAR(rankIcon), ""];
private _rankImportance = _unit getVariable [QGVAR(rankImportance), 0];

if (_rankName == "") then {
  private _ranksConfig = configFile >> QGVAR(ranks);
  private _rankClass = getText ((configOf _unit) >> QGVAR(rank));

  // Reset rank class if invalid rank
  if ((_rankClass isNotEqualTo "") && {!(isClass (_ranksConfig >> _rankClass))}) then {
    _rankClass = "";
  };

  // Second priority - 3DEN rank class
  if (_rankClass isEqualTo "") then {
    _rankClass = _unit getVariable [QGVAR(rank), ""];
  };

  // Parse rank class
  if (_rankClass isNotEqualTo "") then {
    private _rankConfig = _ranksConfig >> _rankClass;
    if !(isClass _rankConfig) exitWith {};

    _rankName = getText (_rankConfig >> 'name');
    _rankIcon = getText (_rankConfig >> 'icon');
    _rankImportance = getNumber (_rankConfig >> 'importance');
  };

  // If no rank class or wrong class - fallback to vanilla rank
  if (_rankName isEqualTo "") then {
    private _rank = rank _unit;
    _rankName = localize format ["str_%1", _rank];
    _rankIcon = format ["a3\UI_F\data\GUI\Cfg\Ranks\%1_gs.paa", _rank];
    _rankImportance = rankId _unit;
  };

  // Save rank name & icon
  _unit setVariable [QGVAR(rankName), _rankName];
  _unit setVariable [QGVAR(rankIcon), _rankIcon];
  _unit setVariable [QGVAR(rankImportance), _rankImportance];
};

[_rankName, _rankIcon, _rankImportance]
