#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns throwInGrenade action children
 */

params ["_target", "_player"];

private _actions = [];
private _supportedGrenades = uiNamespace getVariable [QGVAR(hatchGrenadeClasses), []];
{
  _x params ["_className", "", "", "_type"];
  if ((_type isEqualTo 0) && {_className in _supportedGrenades}) then {
    private _magConfig = (configFile >> "CfgMagazines" >> _className);
    private _action = [
      _className,
      getText (_magConfig >> "displayName"),
      getText (_magConfig >> "picture"),
      {_this call FUNC(throwInGrenade)},
      {true},
      {},
      _className
    ] call ACEFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _target];
  };
} forEach (magazinesAmmoFull _player);

_actions
