#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds action for leader remove from squad self menu action
 */

params ["", "_player"];

private _squad = _player call FUNC(getUnitSquad);
if (isNull _squad) exitWith {[]};

private _units = _squad call FUNC(getSquadUnits);
if ((count _units) < 2) exitWith {[]};

// Remove player from list
_units = _units - [_player];

private _actions = [];

{
  private _name = _x call EFUNC(common,getUnitName);

  _actions pushback [
    [
      format ["%1_%2", QGVAR(removeFromSquad), _name],
      _name,
      _x getVariable [QEGVAR(squadradar,baseIcon), ""],
      {
        _target call FUNC(leaveSquadClient);
      },
      {true}
    ] call ACEFUNC(interact_menu,createAction),
    [],
    _x
  ];
  false
} count _units;

_actions
