#include "script_component.hpp"
/*
 * Author: 3Mydlo3, ACE Team, SzwedzikPL
 * Function creates curator module
 */

if (!isServer) exitWith {};

if (isNull GVAR(curatorGroup)) then {
  // 1. check curator modules
  // 2. check other modules
  // 3. create new group

  _group = createGroup sideLogic;
  _group deleteGroupWhenEmpty true;
  GVAR(curatorGroup) = _group;
};

private _zeus = GVAR(curatorGroup) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
GVAR(curators) pushBack _zeus;
_zeus setVariable ["Addons", 3, true];
_zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
_zeus setCuratorCoef ["Place", 0];
_zeus setCuratorCoef ["Delete", 0];

_zeus
