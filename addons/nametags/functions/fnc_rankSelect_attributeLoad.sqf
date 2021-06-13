#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN dynamicClassSelect attributeLoad handler
 */

private _display3DEN = findDisplay 313;

private _ranksData = _display3DEN getVariable [QGVAR(cacheRanksData), []];
if (_ranksData isEqualTo []) then {
  LOG("Ranks data cache empty, loading ranks");
  private _ranksCats = createHashMap;
  private _catsRanks = createHashMap;

  {
    private _id = toLower (configName _x);
    private _name = getText (_x >> "displayName");
    _ranksCats set [_id, _name];
    _catsRanks set [_id, []];
  } foreach (configProperties [configFile >> QGVAR(ranks_categories), 'isClass _x']);

  {
    private _id = toLower (configName _x);
    private _catId = (_id splitString "_") # 0;
    if !(_catId in _catsRanks) then {
      TRACE_2("Unknown rank category",_catId,_id);
      continue;
    };
    private _ranks = _catsRanks get _catId;
    _ranks pushBack [
      _id,
      getText (_x >> "name"),
      getText (_x >> "icon")
    ];
    _catsRanks set [_catId, _ranks];
  } foreach (configProperties [configFile >> QGVAR(ranks), 'isClass _x']);

  TRACE_2("Ranks cache setuped",_ranksCats,_catsRanks);
  _ranksData = [_ranksCats, _catsRanks];
  _display3DEN setVariable [QGVAR(cacheRanksData), _ranksData];
};

private _ctrlRanksCombo = _this controlsGroupCtrl 100;
private _ctrlRanksCatCombo = _this controlsGroupCtrl 1091;

// Get current cat
private _currentCatId = "default";
if (_value isNotEqualTo "") then {
  _currentCatId = (_value splitString "_") # 0;
};

// Load cats
_ranksData params ["_ranksCats"];
private _currentCatIndex = 0;
{
  private _index = _ctrlRanksCatCombo lbAdd _y;
  _ctrlRanksCatCombo lbSetData [_index, _x];
  if (_x isEqualTo _currentCatId) then {
    _currentCatIndex = _index;
  };
} forEach _ranksCats;

// Select current cat
_ctrlRanksCatCombo lbSetCurSel _currentCatIndex;

// Load current rank
[_currentCatId, _value, _ctrlRanksCombo, _ranksData] call FUNC(rankSelect_loadCatRanks);

// Update ranks on category change
_ctrlRanksCatCombo setVariable [QGVAR(ranksCombo), _ctrlRanksCombo];
_ctrlRanksCatCombo ctrlAddEventHandler ["LBSelChanged", {
  params ["_control", "_selectedIndex"];

  private _display3DEN = findDisplay 313;
  private _catId = _control lbData _selectedIndex;
  private _ctrlRanksCombo = _control getVariable QGVAR(ranksCombo);
  private _ranksData = _display3DEN getVariable [QGVAR(cacheRanksData), []];

  [_catId, "", _ctrlRanksCombo, _ranksData] call FUNC(rankSelect_loadCatRanks);
}];
