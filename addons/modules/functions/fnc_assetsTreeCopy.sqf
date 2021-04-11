#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Makes copy of 3DEN assets tree in array form
 */

LOG_1("Creating copy of 3DEN assets tree (types: %1)",str _this);

private _display = findDisplay 313;
private _panelRight = _display displayCtrl 1021;
private _panelRightCreate = _panelRight controlsGroupCtrl 1039;
private _create = _panelRightCreate controlsGroupCtrl 1049;
private _westTree = _create controlsGroupCtrl 56;
private _eastTree = _create controlsGroupCtrl 57;
private _indTree = _create controlsGroupCtrl 58;
private _civTree = _create controlsGroupCtrl 59;

private _treeCopy = [];

{
	_x params ["_name", "_control", "_picture"];
	private _tree = [_control, [], _this] call FUNC(assetsTreeParse);

  if (_tree isNotEqualTo []) then {
    _treeCopy pushBack [_name, _tree, [_picture, ""]];
  };
} forEach [
	["BLUFOR", _westTree, "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_west_ca.paa"],
	["OPFOR", _eastTree, "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_east_ca.paa"],
	["INDEP", _indTree, "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_guer_ca.paa"],
	["CIV", _civTree, "\a3\3DEN\Data\Displays\Display3DEN\PanelRight\side_civ_ca.paa"]
];

_treeCopy
