#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handler for draw3D, draws players icons during curator remote controll
 */

if !(GVAR(showPlayerIcons)) exitWith {};

if ((CBA_missionTime - GVAR(drawPlayersLastCacheRefresh)) >= DRAWPLAYERSICONS_CACHE_LIFETIME) then {
  GVAR(drawPlayersCache) = ([switchableUnits, playableUnits] select isMultiplayer) select {
    (_x distance ace_player) < DRAWPLAYERSICONS_MAXDISTANCE
  };
  GVAR(drawPlayersLastCacheRefresh) = CBA_missionTime;
};

{
  private _distanceScale = linearConversion [
    DRAWPLAYERSICONS_MAXDISTANCE,
    0,
    _x distance ace_player,
    0,
    1,
    true
  ];
  private _iconSize = 5 * _distanceScale;

  drawIcon3D [
    "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa",
    [side group _x] call BIS_fnc_sideColor,
    _x modelToWorldVisual [0, 0, 2.5],
    _iconSize,
    _iconSize,
    0,
    "",
    1,
    0.04,
    "PuristaMedium"
  ];
  drawIcon3D [
    "",
    [1, 1, 1, 1],
    _x modelToWorldVisual [0, 0, 2.3],
    0,
    0,
    0,
    _x call EFUNC(common,getUnitName),
    2,
    0.037 * _distanceScale,
    "PuristaMedium"
  ];
} forEach GVAR(drawPlayersCache);
