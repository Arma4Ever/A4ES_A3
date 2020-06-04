#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Draws unit 3D Name Tag
 */

params ["_unit", "_unitName", "_unitRankName", "_unitRankIcon", "_unitColor", "_isLeader", "_isSpeaking", "_isUnconscious", "_specialIcon"];

private _distance = ace_player distance2D _unit;

private _maxDistance = [NAMETAG_3D_MAX_DISTANCE, NAMETAG_3D_MAX_DISTANCE_UNCONSCIOUS] select _isUnconscious;
if (_distance > _maxDistance) exitWith {};

private _scale = GVAR(3DNameTagScale);
private _icon = "";

if (_specialIcon != "") then {
  _icon = _specialIcon;
} else {
  if (_isSpeaking && {GVAR(showSpeaking)}) then {
    _icon = format [QPATHTOF(ui\soundwave%1.paa), (floor random 10) min 9];
  } else {
    if (_isLeader && {GVAR(showLeaderIcon)}) then {
      _icon = "\a3\3den\data\attributes\namesound\special_ca.paa";
    };
  };
};

private _textSizeRank = (NAMETAG_3D_RANK_SIZE_BASE * _scale);
private _textSizeName = (NAMETAG_3D_NAME_SIZE_BASE * _scale) - (NAMETAG_3D_TEXT_DISTANCE_FACTOR * (_distance));

private _alphaDistance = _maxDistance / 2;
private _alpha = [(_alphaDistance - ((_distance - 1.5) - _alphaDistance)) * (_maxDistance * 0.01), 1] select (_distance < _alphaDistance || {_isUnconscious});
private _model = (_unit selectionPosition "pilot") vectorAdd [
  0, 0, (NAMETAG_3D_HEIGHT_OFFSET + (NAMETAG_3D_HEIGHT_DISTANCE_FACTOR * _distance))
];

private _nameColor = _unitColor # 0;

_nameColor set [3, _alpha];

drawIcon3D [
  _icon,
  [1, 1, 1, _alpha],
  _unit modelToWorldVisual (_model vectorAdd [0, 0, (_textSizeName - (NAMETAG_3D_NAME_SIZE_BASE * NAMETAG_3D_TEXT_MARGIN)) + (NAMETAG_3D_TEXT_HEIGHT_DISTANCE_FACTOR * _distance)]),
  (NAMETAG_3D_ICON_SIZE * _scale),
  (NAMETAG_3D_ICON_SIZE * _scale),
  0,
  _unitRankName,
  2,
  _textSizeRank,
  NAMETAG_3D_FONT
];

drawIcon3D [
  "",
  _nameColor,
  _unit modelToWorldVisual _model,
  (NAMETAG_3D_ICON_SIZE * _scale),
  (NAMETAG_3D_ICON_SIZE * _scale),
  0,
  _unitName,
  2,
  _textSizeName,
  NAMETAG_3D_FONT
];
