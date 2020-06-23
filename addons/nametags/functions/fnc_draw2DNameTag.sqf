#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Draws unit 2D Name Tag
 */

params ["_unit", "_unitName", "_unitRankName", "_unitRankIcon", "_unitColor", "_isLeader", "_isSpeaking", "_isUnconscious", "_specialIcon"];

private _maxDistance = [NAMETAG_2D_MAX_DISTANCE, NAMETAG_2D_MAX_DISTANCE_UNCONSCIOUS] select _isUnconscious;

if ((ace_player distance2D _unit) > _maxDistance || {}) exitWith {};

GVAR(last2DCursorTarget) = _unit;

private _icon = _unitRankIcon;

if (_specialIcon != "") then {
  _icon = _specialIcon;
};

private _margin = ["", "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>"] select GVAR(2DNameTagPosition);
private _traits = "";
if (GVAR(2DNameTagShowTraits)) then {
  _traits = (_unit call EFUNC(common,getUnitTraitsNames)) joinString ", ";
};


QGVAR(2DNameTag) cutText [
  _margin + format [
    QUOTE(<t align='center' font=QUOTE(QUOTE(NAMETAG_2D_FONT))><t shadow='2' color='%1' size=QUOTE(QUOTE(NAMETAG_2D_NAME_SIZE))>%2</t><br/><t shadow='2' size=QUOTE(QUOTE(NAMETAG_2D_RANK_SIZE))>%3 <img image='%4'/></t><br/><t size='1.15' color='#d1d1d1'>%5</t></t>),
    _unitColor # 1, _unitName, _unitRankName, _icon, _traits
  ], "PLAIN", NAMETAG_2D_FADE_IN, false, true
];
QGVAR(2DNameTag) cutFadeOut NAMETAG_2D_INIT_FADE_OUT;
