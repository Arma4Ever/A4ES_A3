#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Draws squad memberlist
 */

params [["_refreshMembersData", false, [false]]];

LOG_1("Drawing memberlist (refreshMembersData: %1)",str _refreshMembersData);

if (_refreshMembersData) then {
  call FUNC(refreshMembersData);
};

BEGIN_COUNTER(drawMemberlist);

private _listMaxCount = 6;

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
private _controlMemberlist = _display displayCtrl IDC_RSCRADAR_MEMBERLIST;
private _columns = _controlMemberlist getVariable [QGVAR(columns), []];
private _columnsMaxIndex = (ceil ((count GVAR(currentSquadUnits)) / _listMaxCount)) - 1;


// TODO: optimize<

private _columnWidth = (pixelW * 130) * GVAR(memberlistColumnWidthScale);
private _columnHeight = pixelH * 128;

{ctrlDelete _x;} forEach _columns;
_columns = [];
for "_i" from 0 to _columnsMaxIndex do {
  private _column = _display ctrlCreate ["RscStructuredText", -1, _controlMemberlist];
  _column ctrlSetPosition [
    _columnWidth * _i,
    0,
    // Make extra space for longer nicknames - if column text will overlap
    // user can change column width from settings
    _columnWidth * 1.5,
    _columnHeight
  ];

  _column ctrlCommit 0;
  _columns pushBack _column;
};
_controlMemberlist setVariable [QGVAR(columns), _columns];

// Update memberlist group control width
/*
private _controlMemberlistPos = ctrlPosition _controlMemberlist;
_controlMemberlistPos set [3, _columnWidth * _columnsMaxIndex];
_controlMemberlist ctrlSetPosition _controlMemberlistPos;
*/
_controlMemberlist ctrlSetBackgroundColor [0, 0, 0, 1];
_controlMemberlist ctrlCommit 0;

// TODO: >optimize

private _columnTexts = _columns apply {[]};
private _columnIndex = 0;

private _iconSize = 0.9 * GVAR(uiHScale);
private _nameSize = 1 * GVAR(uiHScale);

{
  _x params ["_unit", "_icons", "_colors", "_isSpecialState", "_showSpecialState"];

  (_columnTexts # _columnIndex) pushBack format [
    "<t color='%1' size='%2' shadow='1' valign='middle'><img image='%3' size='%4' color='%5'/> %6</t>",
    _colors # 0,
    _nameSize,
    _icons select (_isSpecialState && _showSpecialState),
    _iconSize,
    (_colors select (_isSpecialState && _showSpecialState)) # 1,
    _unit getVariable ["ACE_Name", localize ELSTRING(nametags,NoName)]
  ];
  if (((_forEachIndex + 1) % _listMaxCount) isEqualTo 0) then {
    _columnIndex = _columnIndex + 1;
  };
} forEach GVAR(membersCache);

{
  (_columns # _forEachIndex) ctrlSetStructuredText parseText (_x joinString "<br/>");
} forEach _columnTexts;

END_COUNTER(drawMemberlist);
