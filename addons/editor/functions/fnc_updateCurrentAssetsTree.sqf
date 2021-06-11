#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates currently opened assets tree
 */
LOG("updateCurrentAssetsTree");

waitUntil {!isNull (findDisplay 313)};

private _display = findDisplay 313;
private _panelRight = _display displayCtrl 1021;
private _panelRightCreate = _panelRight controlsGroupCtrl 1039;
private _create = _panelRightCreate controlsGroupCtrl 1049;
private _westTree = _create controlsGroupCtrl 56;
private _eastTree = _create controlsGroupCtrl 57;
private _indTree = _create controlsGroupCtrl 58;
private _civTree = _create controlsGroupCtrl 59;

private _assetsTree = controlNull;

{
  if (ctrlShown _x) exitWith {
    _assetsTree = _x;
  };
} forEach [_westTree, _eastTree, _indTree, _civTree];

private _currentAssetsTree = uiNamespace getVariable [QGVAR(currentAssetsTree), controlNull];
if (_assetsTree isNotEqualTo _currentAssetsTree) then {
  TRACE_2("updateCurrentAssetsTree: tree changed",_currentAssetsTree,_assetsTree);
  uiNamespace setVariable [QGVAR(currentAssetsTree), _assetsTree];
  GVAR(currentAssetsTreeCount) = 0;
};
