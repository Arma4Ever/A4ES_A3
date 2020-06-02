#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Sets entity warnings
 */

params ["_entity", "_warnings"];

private _entityID = _entity getVariable [QGVAR(entityID), get3DENEntityID _entity];
private _entityIDVarName = str _entityID;
private _warningsTree = (findDisplay IDD_DISPLAY3DEN) displayCtrl IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_TREE;

// Get entity warning data
private _warningsData = GVAR(warningsData) getVariable [_entityIDVarName, [[]]];
_warningsData params ["_currentWarnings"];

// Exit if new warnings are the same as current warnings
if (_currentWarnings isEqualTo _warnings) exitWith {
  INFO_4("Setting entity '%1' (ID: %2) warnings skipped. New warnings are equal to current warnings (%3 = %4).",typeof _entity,_entityIDVarName,str _warnings,str _currentWarnings);
};

INFO_4("Setting entity '%1' (ID: %2) warnings to %3 (data: %4).",typeof _entity,_entityIDVarName,str _warnings,str _warningsData);

private _index = -1;

for "_i" from 0 to ((_warningsTree tvCount []) - 1) do {
  if ((_warningsTree tvValue [_i]) isEqualTo _entityID) exitWith {
    _index = _i;
  };
};

if !(_warnings isEqualTo []) then {
  // Add entity to warnings tree if not added yet
  if (_index isEqualTo -1) then {
    private _entityConfig = configFile >> "CfgVehicles" >> (typeOf _entity);
    private _displayName = getText (_entityConfig >> "displayName");
    private _icon = getText (_entityConfig >> "portrait");

    // Use default icon if there's none
    if (_icon isEqualTo "") then {
      _icon = "\A3\modules_f\data\portraitModule_ca.paa";
    };

    // Add warning to warnings tree
    _index = _warningsTree tvAdd [[], _displayName];
    _warningsTree tvSetPicture [[_index], _icon];
    _warningsTree tvSetValue [[_index], _entityID];
  };

  // Clear current entity warnings tree
  for "_i" from 0 to ((_warningsTree tvCount [_index]) - 1) do {
    _warningsTree tvDelete [_index, _i];
  };

  // Add entity warnings to warnings tree
  {
    private _warning = _x;
    // Use warning title if warning has description
    if (_warning isEqualType []) then {
      _warning = _warning # 0;
    };

    private _warningIndex = _warningsTree tvAdd [[_index], _warning];
    _warningsTree tvSetPicture [[_index, _warningIndex], QPATHTOF(data\leftpanel\warning.paa)];
    _warningsTree tvSetValue [[_index, _warningIndex], _entityID];
  } forEach _warnings;

  // Expand updated warning tree
  _warningsTree tvExpand [_index];

  // Update warnings data
  GVAR(warningsData) setVariable [_entityIDVarName, [_warnings]];

  // Update entities list
  GVAR(warningsEntities) pushBackUnique _entityID;
} else {
  // Remove entity warnings from warnings tree
  if !(_index isEqualTo -1) then {
    _warningsTree tvDelete [_index];
  };

  // Cleanup warnings data
  GVAR(warningsData) setVariable [_entityIDVarName, nil];

  // Update entities list
  GVAR(warningsEntities) deleteAt (GVAR(warningsEntities) find _entityID);
};

// Update warnings tab UI
call FUNC(updateWarningsTabUI);
