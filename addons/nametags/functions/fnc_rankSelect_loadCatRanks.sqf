#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Loads current cat ranks and selects current rank for 3DEN dynamicClassSelect
 */

params ["_catId", "_rank", "_ctrlRanksCombo", "_ranksData"];
_ranksData params ["", "_catsRanks"];
TRACE_4("rankSelect_loadCatRanks",_catId,_rank,_ctrlRanksCombo,_catsRanks);

// Clear ranks
lbClear _ctrlRanksCombo;

// Load cat ranks
private _ranks = _catsRanks getOrDefault [_catId, []];
private _currentRankIndex = 0;

{
  _x params ["_id", "_name", "_icon"];
  private _index = _ctrlRanksCombo lbAdd _name;
  _ctrlRanksCombo lbSetData [_index, _id];
  _ctrlRanksCombo lbSetPicture [_index, _icon];
  if (_id isEqualTo _rank) then {
    _currentRankIndex = _index;
  };
} forEach _ranks;

// Select current rank
_ctrlRanksCombo lbSetCurSel _currentRankIndex;
