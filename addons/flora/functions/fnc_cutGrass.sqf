#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Cut grass action
 */

params ["_player"];

TRACE_1("cutGrass",_player);

[4, 0, {
  private _targetPos = ace_player getPos [1, getDir ace_player];
  _targetPos set [2, getTerrainHeightASL _targetPos];
  private _cutter = createSimpleObject ["a3\structures_f\system\cluttercutter_medium_f.p3d", _targetPos, false];

  [LLSTRING(cutGrass_grassCut), 2] call ACEFUNC(common,displayTextStructured);
  // Reset animation
  [ace_player, "", 1] call ACEFUNC(common,doAnimation);
}, {
  // Reset animation
  [ace_player, "", 1] call ACEFUNC(common,doAnimation);
}, LLSTRING(cutGrass_cuttingGrass), {true}] call ACEFUNC(common,progressBar);

// Play animation
[_player, "AinvPknlMstpSnonWnonDnon_medic4"] call ACEFUNC(common,doAnimation);
