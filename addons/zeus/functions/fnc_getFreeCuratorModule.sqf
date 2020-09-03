#include "script_component.hpp"
/*
 * Author: 3Mydlo3, SzwedzikPL
 * Function returns free curator module or creates new module if no free module available.
 */

private _freeCuratorID = GVAR(curators) findIf {isNull getAssignedCuratorUnit _x};
if (_freeCuratorID isEqualTo -1) exitWith {
  call FUNC(createCuratorModule)
};

GVAR(curators) select _freeCuratorID
