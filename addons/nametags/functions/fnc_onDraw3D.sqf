#include "script_component.hpp"
/*
 * Author: ACE team, SzwedzikPL
 * Handler for draw3D mission EH
 */

if (GVAR(displayInterrupt) || {isNull ACE_player} || {!alive ACE_player} || {vehicle ace_player != ace_player} || {EGVAR(ui,screenshotModeEnabled)}) exitWith {
  call FUNC(clear2DNameTag);
};

if (freeLook) then {
  // No freelook name tag, exit
  if (GVAR(show3DNameTag) != 1 && {GVAR(show3DNameTag) != 3}) exitWith {};

  call FUNC(clear2DNameTag);

  private _targetsData = [[], DFUNC(getAreaTargets), ace_player, QGVAR(areaTargetsCache), 1] call ACEFUNC(common,cachedCall);
  {_x call FUNC(draw3DNameTag)} forEach _targetsData;
} else {
  if (!GVAR(show2DNameTag) && {GVAR(show3DNameTag) != 2} && {GVAR(show3DNameTag) != 3}) exitWith {};

  private _targetData = [[], DFUNC(getCursorTarget), ace_player, QGVAR(cursorTargetCache), 0.25] call ACEFUNC(common,cachedCall);
  // Don't show cursor nametag while aiming
  if (isNil "_targetData" || {cameraView == "gunner"}) exitWith {
    call FUNC(clear2DNameTag);
  };

  private _target = _targetData # 0;

  if (GVAR(show2DNameTag) && {_target != GVAR(last2DCursorTarget)}) then {
    _targetData call FUNC(draw2DNameTag);
  };

  if (GVAR(show3DNameTag) == 2 || {GVAR(show3DNameTag) == 3}) then {
    _targetData call FUNC(draw3DNameTag);
  };
};
