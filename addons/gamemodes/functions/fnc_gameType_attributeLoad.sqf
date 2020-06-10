#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * gameType control attributeLoad handler
 */

private _combo = _this controlsGroupCtrl 100;
private _attributesListControl = ctrlParentControlsGroup _this;
private _attributesCategory = ctrlParentControlsGroup _attributesListControl;

diag_log format ["_value = %1", _value];

{
  private _pos = ctrlPosition _x;
  _x setVariable [QGVAR(originalHeight), _pos # 3];
} forEach [_this, _attributesListControl, _attributesCategory];

{
  private _name = getText (_x >> "name");
  private _tooltip = getText (_x >> "shortcut");
  private _id = getNumber (_x >> "id");

  private _option = _combo lbAdd _name;
  _combo lbSetData [_option, str _id];
  _combo lbSetValue [_option, _id];
  _combo lbSettooltip [_option, _tooltip];

  _combo setVariable [
    format [QGVAR(className_%1), _id], configName _x
  ];

  diag_log format [QGVAR(className_%1), _id];

} foreach configProperties [
  (configFile >> "CfgMPGameTypes"),
  QUOTE(isClass _x && isClass (_x >> QQGVAR(rules)))
];

for '_i' from 0 to (lbSize _combo - 1) do {
  if (_value in [
    parseNumber (_combo lbData _i),
    toLower (_combo lbData _i),
    _combo lbValue _i
  ]) exitwith {
    _combo lbSetCurSel _i;
    private _className = _combo getVariable [
      format [QGVAR(className_%1), _combo lbValue _i],
      ""
    ];
    diag_log format ["_className = %1", _className];
    [_combo, _className] call FUNC(gameType_updateDescription);
  };
};

_combo ctrlAddEventHandler ["LBSelChanged", {
  params ["_combo", "_selectedIndex"];

  private _className = _combo getVariable [
    format [QGVAR(className_%1), _combo lbValue _selectedIndex],
    ""
  ];
  [_combo, _className] call FUNC(gameType_updateDescription);

}];
