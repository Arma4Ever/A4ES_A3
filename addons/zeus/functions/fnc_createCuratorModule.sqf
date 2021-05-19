#include "script_component.hpp"
/*
 * Author: 3Mydlo3, ACE Team, SzwedzikPL
 * Function creates curator module
 */

if (!isServer) exitWith {};

if (isNull GVAR(curatorModulesGroup)) then {
  private _group = grpNull;

  if (allCurators isNotEqualTo []) then {
    _group = group (allCurators # 0);
  } else {
    private _modules = entities QEGVAR(modules,curator);

    if (_modules isNotEqualTo []) then {
      _group = group (_modules # 0);
    };
  };

  if (isNull _group) then {
    _group = createGroup sideLogic;
    _group deleteGroupWhenEmpty true;
  };

  GVAR(curatorModulesGroup) = _group;
};

private _module = GVAR(curatorModulesGroup) createUnit ["ModuleCurator_F", [0, 0, 0], [], 0, "NONE"];
_module setVariable ["Addons", 3, true];
_module setVariable ["BIS_fnc_initModules_disableAutoActivation", false];
_module setCuratorCoef ["place", 0];
_module setCuratorCoef ["edit", 0];
_module setCuratorCoef ["delete", 0];
_module setCuratorCoef ["destroy", 0];
_module setCuratorCoef ["group", 0];
_module setCuratorCoef ["synchronize", 0];

_module addEventHandler ["CuratorPinged", {
  _this call FUNC(handleCuratorPinged);
}];

_module
