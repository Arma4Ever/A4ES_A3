#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * gameType control attributeLoad handler
 */

private _combo = _this controlsGroupCtrl 100;
private _attributesListControl = ctrlParentControlsGroup _this;
private _attributesCategory = ctrlParentControlsGroup _attributesListControl;

{
  private _name = getText (_x >> "name");
  private _tooltip = getText (_x >> QGVAR(description));

  private _option = _combo lbAdd _name;
  _combo lbSetData [_option, configName _x];
  _combo lbSettooltip [_option, _tooltip];
} foreach configProperties [
  (configFile >> "CfgMPGameTypes"),
  QUOTE(isClass _x && isClass (_x >> QQGVAR(rules)))
];

private _currentValue = "Multiplayer" get3DENMissionAttribute "GameType";

for '_i' from 0 to (lbSize _combo - 1) do {
  if ((toLower _currentValue) isEqualTo (toLower (_combo lbData _i))) exitwith {
    _combo lbSetCurSel _i;
    [_combo, _combo lbData _i] call FUNC(gameType_updateDescription);
  };
};

_combo ctrlAddEventHandler ["LBSelChanged", {
  params ["_combo", "_selectedIndex"];

  private _className = _combo lbData _selectedIndex;
  [_combo, _className] call FUNC(gameType_updateDescription);
}];
