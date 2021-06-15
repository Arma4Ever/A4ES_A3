#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handler for draw3D, draws players icons during curator remote controll
 */

if !(GVAR(showPlayerIcons)) exitWith {};

if ((CBA_missionTime - GVAR(drawPlayersLastCacheRefresh)) >= DRAWPLAYERSICONS_CACHE_LIFETIME) then {
  private _players = ([switchableUnits, playableUnits] select isMultiplayer) select {
    ((_x distance ace_player) < DRAWPLAYERSICONS_MAXDISTANCE) &&
    // Filter out vehicle crews
    {(effectiveCommander (vehicle _x)) isEqualTo _x}
  };
  GVAR(drawPlayersCache) = _players apply {
    // Show data of effective vehicle commander (with crew count)
    private _vehicle = vehicle _x;
    private _player = effectiveCommander _vehicle;
    private _name = _player call EFUNC(common,getUnitName);
    private _crewCount = count (crew _vehicle);
    if (_crewCount > 1) then {
      _name = _name + ("+ " + (str (_crewCount - 1)));
    };
    [_vehicle, _name, [side (group _x)] call BIS_fnc_sideColor]
  };
  GVAR(drawPlayersLastCacheRefresh) = CBA_missionTime;
};

private _colorWhite = [1, 1, 1, 1];
private _modelIcon = [0, 0, 2.5];
private _modelName = [0, 0, 2.3];

{
  private _unit = _x # 0;
  private _distance = _unit distance ace_player;
  private _distanceScale = linearConversion [
    DRAWPLAYERSICONS_MAXDISTANCE,
    0,
    _distance,
    0,
    1,
    true
  ];

  private _iconSize = 5 * _distanceScale;

  drawIcon3D [
    "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa",
    _x # 2,
    _unit modelToWorldVisual _modelIcon,
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
    _colorWhite,
    _unit modelToWorldVisual _modelName,
    0,
    0,
    0,
    format ["%1 (%2m)", _x # 1, _distance toFixed 0],
    2,
    0.037 * _distanceScale,
    "PuristaMedium"
  ];
} forEach GVAR(drawPlayersCache);
