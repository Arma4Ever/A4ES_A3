#include "script_component.hpp"
/*
 * Author: Jonpas, SzwedzikPL
 * Handles draw settings change event
 */

if (isNil QGVAR(drawHandler) && {GVAR(show3DNameTag) != 0 || {GVAR(show2DNameTag)}}) then {
  GVAR(drawHandler) = addMissionEventHandler ["Draw3D", {
    _this call FUNC(onDraw3D);
  }];
} else {
  if (!isNil QGVAR(drawHandler) && {GVAR(show3DNameTag) == 0} && {!GVAR(show2DNameTag)}) then {
    removeMissionEventHandler ["Draw3D", GVAR(drawHandler)];
    GVAR(drawHandler) = nil;
  };
};

if (!GVAR(show2DNameTag)) then {
  call FUNC(clear2DNameTag);
};
