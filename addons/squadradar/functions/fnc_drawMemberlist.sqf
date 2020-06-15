#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Draws squad memberlist
 */

params [["_refreshMembersCache", false, [false]]];

LOG_1("Drawing memberlist (refreshMembersCache: %1)",str _refreshMembersCache);

if (_refreshMembersCache) then {
  call FUNC(refreshMembersCache);
};

BEGIN_COUNTER(drawMemberlist);

private _listMaxCount = 6;

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
private _controlMemberlist = _display displayCtrl IDC_RSCRADAR_MEMBERLIST;
private _columns = _controlMemberlist getVariable [QGVAR(columns), []];
private _columnsMaxIndex = (ceil ((count GVAR(currentSquadUnits)) / _listMaxCount)) - 1;


// TODO: optimize<

private _columnWidth = (pixelW * 140) * GVAR(memberlistColumnWidthScale);
private _columnHeight = pixelH * 128;

{ctrlDelete _x;} forEach _columns;
_columns = [];
for "_i" from 0 to _columnsMaxIndex do {
  private _column = _display ctrlCreate ["RscStructuredText", -1, _controlMemberlist];
  _column ctrlSetPosition [
    _columnWidth * _i,
    0,
    _columnWidth,
    _columnHeight
  ];

  _column ctrlSetBackgroundColor [0.1 * _i, 0, 0, 0.1];
  _column ctrlCommit 0;
  _columns pushBack _column;
};
_controlMemberlist setVariable [QGVAR(columns), _columns];

// TODO: >optimize

private _columnTexts = _columns apply {[]};
private _columnIndex = 0;

{
  private _color = _x getVariable [QGVAR(color), "#ffffff"];
  private _iconColor = _color;
  private _inRange = (_x distance ace_player) < RADAR_MAX_UNIT_DISTANCE;
  if (_inRange) then {
    _iconColor = _x getVariable [QGVAR(iconColor), _color];
  };

  (_columnTexts # _columnIndex) pushBack format [
    "<t color='%1'><img image='%2' color='%3'/> %4</t>",
    _color,
    _x getVariable [
      [QGVAR(baseIcon), QGVAR(icon)] select _inRange,
      ""
    ],
    _iconColor,
    _x getVariable ["ACE_Name", localize ELSTRING(nametags,NoName)]
  ];
  if (((_forEachIndex + 1) % _listMaxCount) isEqualTo 0) then {
    _columnIndex = _columnIndex + 1;
  };
} forEach GVAR(currentSquadUnits);

{
  (_columns # _forEachIndex) ctrlSetStructuredText parseText (_x joinString "<br/>");
} forEach _columnTexts;

END_COUNTER(drawMemberlist);
