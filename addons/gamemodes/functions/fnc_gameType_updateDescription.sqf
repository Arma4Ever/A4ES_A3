#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * Updates gameType description
 */

params ["_combo", "_className"];

diag_log format ["updateDescription %1 %2", _combo, _className];

private _attributeGroup = ctrlParentControlsGroup _combo;
//private _descriptionControl = _attributeGroup controlsGroupCtrl 702;
private _descriptionGroup = _attributeGroup controlsGroupCtrl 102;
private _descriptionControl = _descriptionGroup controlsGroupCtrl 103;

private _rulesConfig = (configFile >> "CfgMPGameTypes" >> _className >> QGVAR(rules));
private _general = getArray (_rulesConfig >> "general");
private _limitations = getArray (_rulesConfig >> "limitations");
private _warnings = getArray (_rulesConfig >> "warnings");

private _addTextSection = {
  params ["_currentText", "_section"];

  (_currentText + format [
    "%1%2",
    ["<br/>", ""] select (_currentText isEqualTo ""),
    _section
  ])
};

private _text = "";

if !(_general isEqualTo []) then {
  private _generalRules = "";
  {
    _generalRules = _generalRules + format ["- %1<br/>", _x];
  } forEach _general;

  _text = [_text, format [
    "%1<br/>%2 asdasdasd<br/>asdasdasd<br/>asdasdasd<br/>asdasdasd<br/>asdasdasd",
    "Specyfika23:",
    _generalRules
  ]] call _addTextSection;
};

_descriptionControl ctrlSetStructuredText parseText _text;
private _textHeight = ctrlTextHeight _descriptionControl;
private _descriptionControlPos = ctrlPosition _descriptionControl;
_descriptionControlPos set [3, (_descriptionControlPos # 3) max _textHeight];
_descriptionControl ctrlSetPosition _descriptionControlPos;
_descriptionControl ctrlCommit 0;
