#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Add character info
player createDiarySubject [QGVAR(characterInfo), localize LSTRING(Character)];

// TODO: Add A3CS settings with info about enabled/disabled features (i.e. disabled squad radar)
// This will remove needless confusion

private _rankInfo = player call EFUNC(nametags,getUnitRank);
private _traits = (player call EFUNC(common,getUnitTraitsNames)) joinString ", ";

if (_traits isEqualTo "") then {
  _traits = localize ELSTRING(common,None);
};

private _characterDesc = player getVariable [QGVAR(characterDesc), ""];

// Add character description if present
if !(_characterDesc isEqualTo "") then {
  player createDiaryRecord [QGVAR(characterInfo), [
    localize LSTRING(CharacterDesc_Title),
    "<font size='20'>" + (localize LSTRING(CharacterDesc)) + "</font><br/><br/><font size='15'>" + _characterDesc + "</font>"
  ], taskNull, "", false];
};

player createDiaryRecord [QGVAR(characterInfo), [
  localize LSTRING(CharacterInfo_Title),
  format [
    "<font size='20'>%1</font><br/><br/><font size='16'>%2</font><br/><font size='15'>%3</font><br/><br/><font size='16'>%4</font><br/><font size='15'>%5</font>",
    localize LSTRING(CharacterInfo),
    localize ELSTRING(common,rank),
    _rankInfo # 0,
    localize ELSTRING(common,traits),
    _traits
  ]
], taskNull, "", false];
