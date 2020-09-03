#include "script_component.hpp"
/*
 * Author: 3Mydlo3, ACE Team, SzwedzikPL
 * Function creates curator module
 */

if (!isServer) exitWith {};

if (isNull GVAR(curatorGroup)) then {
  private _group = grpNull;

  if !(allCurators isEqualTo []) then {
    _group = group (allCurators # 0);
  } else {
    private _modules = entities QEGVAR(modules,curator);

    if !(_modules isEqualTo []) then {
      _group = group (_modules # 0);
    };
  };

  if (isNull _group) then {
    _group = createGroup sideLogic;
    _group deleteGroupWhenEmpty true;
  };

  GVAR(curatorGroup) = _group;
};

private _zeus = GVAR(curatorGroup) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
GVAR(curators) pushBack _zeus;
_zeus setVariable ["Addons", 3, true];
_zeus setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
_zeus setCuratorCoef ["Place", 0];
_zeus setCuratorCoef ["Delete", 0];

_zeus
