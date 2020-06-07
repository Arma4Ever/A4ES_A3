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
private _currentWarnings = GVAR(allWarnings) getVariable [_entityIDVarName, []];

// Exit if new warnings are the same as current warnings
if (_currentWarnings isEqualTo _warnings) exitWith {
  LOG_4("Setting entity '%1' (ID: %2) warnings skipped. New warnings are equal to current warnings (%3 = %4).",typeof _entity,_entityIDVarName,str _warnings,str _currentWarnings);
};

LOG_3("Setting entity '%1' (ID: %2) warnings to %3.",typeof _entity,_entityIDVarName,str _warnings);

// Find current warning index if exists on tree
private _index = -1;
private _treeRootElements = (_warningsTree tvCount []) - 1;
for "_i" from 0 to _treeRootElements do {
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
  private _treeWarningsCount = (_warningsTree tvCount [_index]) - 1;
  for "_i" from 0 to _treeWarningsCount do {
    _warningsTree tvDelete [_index, 0];
  };

  // Add entity warnings to warnings tree
  {
    _x params ["_warning", ["_description", ""]];
    private _warningIndex = _warningsTree tvAdd [[_index], _warning];
    private _path = [_index, _warningIndex];
    _warningsTree tvSetPicture [_path, QPATHTOF(data\leftpanel\warning.paa)];
    _warningsTree tvSetValue [_path, _entityID];
    _warningsTree tvSetTooltip [_path, _description];
  } forEach _warnings;

  // Expand updated warning tree
  _warningsTree tvExpand [_index];

  // Update warnings
  GVAR(allWarnings) setVariable [_entityIDVarName, _warnings];

  // Update entities list
  GVAR(warningsEntities) pushBackUnique _entityID;
} else {
  // Remove entity warnings from warnings tree
  if !(_index isEqualTo -1) then {
    _warningsTree tvDelete [_index];
  };

  // Cleanup warnings
  GVAR(allWarnings) setVariable [_entityIDVarName, nil];

  // Update entities list
  GVAR(warningsEntities) deleteAt (GVAR(warningsEntities) find _entityID);
};

// Sort entities by name
_warningsTree tvSort [[], false];

// Update warnings tab UI
call FUNC(updateWarningsTabUI);
