#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * Updates gameType description
 */

params ["_combo", "_className"];

private _attributeGroup = ctrlParentControlsGroup _combo;
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

if (_general isNotEqualTo []) then {
  private _generalRules = "";
  {
    _generalRules = _generalRules + format [
      "<img color='#2d9b4c' image='\a3\3den\data\displays\display3dentutorial\picturecompleted_ca.paa'/> <t font='RobotoCondensedBold'>%1</t><br/>",
      _x
    ];
  } forEach _general;

  _text = [_text, format [
    "%1<br/>%2",
    "<t color='#969696'>Zasady:</t>",
    _generalRules
  ]] call _addTextSection;
};

if (_limitations isNotEqualTo []) then {
  private _limitationsRules = "";
  {
    _limitationsRules = _limitationsRules + format [
      "<img color='#cd2323' image='\a3\3den\data\cfgwaypoints\dismiss_ca.paa'/> <t font='RobotoCondensedBold'>%1</t><br/>",
      _x
    ];
  } forEach _limitations;

  _text = [_text, format [
    "%1<br/>%2",
    "<t color='#969696'>Ograniczenia:</t>",
    _limitationsRules
  ]] call _addTextSection;
};

if (_warnings isNotEqualTo []) then {
  private _warningsInfo = "";
  {
    _warningsInfo = _warningsInfo + format [
      "<img color='#cd2323' image='\a3\3den\data\cfgwaypoints\sentry_ca.paa'/> <t font='RobotoCondensedBold'>%1</t><br/>",
      _x
    ];
  } forEach _warnings;

  _text = [_text, format [
    "%1",
    _warningsInfo
  ]] call _addTextSection;
};

_descriptionControl ctrlSetStructuredText parseText ("<br/>" + _text);
private _textHeight = ctrlTextHeight _descriptionControl;
private _descriptionControlPos = ctrlPosition _descriptionControl;
private _descriptionGroupPos = ctrlPosition _descriptionGroup;
_descriptionControlPos set [3, (_descriptionGroupPos # 3) max _textHeight];
_descriptionControl ctrlSetPosition _descriptionControlPos;
_descriptionControl ctrlCommit 0;
