#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Draws debug icons on map
 */

params ["_ctrl"];

if !(GVAR(showDebugMap)) exitWith {};

{
  _x params ["", "_pos", "_color", "_a", "_b", "_angle", "_isRect", "_syncs"];
  if (_isRect) then {
    _ctrl drawRectangle [_pos, _a, _b, _angle, _color, ""];
  } else {
    _ctrl drawEllipse [_pos, _a, _b, _angle, _color, ""];
  };
  {
    if !(isNull _x) then {
      _ctrl drawLine [
        getPos _x,
      	_pos,
      	_color
      ];
    };
  } forEach _syncs;
  _ctrl drawIcon ["\a3\Ui_f\data\IGUI\Cfg\IslandMap\iconSensor_ca.paa", _color, _pos, 24, 24, 0];
} forEach GVAR(triggersDrawData);

{
  (_x # 3) params ["_pos", "_icon", "_color", "_colorBg", "_colorAct", "_activationRange", "_hasArea", "_a", "_b", "_angle", "_isRect", "_syncs"];
  if (_hasArea) then {
    if (_isRect) then {
      _ctrl drawRectangle [_pos, _a, _b, _angle, _color, ""];
    } else {
      _ctrl drawEllipse [_pos, _a, _b, _angle, _color, ""];
    };
  };

  if (_activationRange > 0) then {
    // Make activation range same color as triggers
    _ctrl drawEllipse [_pos, _activationRange, _activationRange, 0, _colorAct, ""];
  };

  {
    if !(isNull _x) then {
      _ctrl drawLine [
        getPos _x,
      	_pos,
      	_color
      ];
    };
  } forEach _syncs;

  _ctrl drawIcon ["\a3\3DEN\Data\Cfg3DEN\Logic\textureBackgroundModule_ca.paa", _colorBg, _pos, 40, 40, 0];
  _ctrl drawIcon [_icon, _color, _pos, 32, 32, 0];
} forEach GVAR(modulesDrawData);

{
  _x params ["_entity", "_icon", "_color", "_waypointsData"];

  if (_waypointsData isNotEqualTo []) then {
    private _prevPos = getPos _entity;
    {
      _ctrl drawArrow [
        _prevPos,
        _x,
        _color
      ];
      _prevPos = _x;
    } forEach _waypointsData;
  };
  if (_icon isNotEqualTo "") then {
    _ctrl drawIcon [_icon, _color, getPos _entity, 24, 24, getDir _entity];
  };
} forEach GVAR(entitiesDrawData);
