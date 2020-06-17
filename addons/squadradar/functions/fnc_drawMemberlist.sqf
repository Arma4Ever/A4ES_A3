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
private _usedColumnWidthScale = _controlMemberlist getVariable [QGVAR(columnWidthScale), 0];
private _columnsMaxIndex = (ceil ((count GVAR(currentSquadUnits)) / _listMaxCount)) - 1;
#ifdef DEBUG_MODE_FULL
private _columnsRebuilded = false;
#endif

if !(
  (count _columns) isEqualTo (_columnsMaxIndex + 1) &&
  _usedColumnWidthScale isEqualTo GVAR(memberlistColumnWidthScale)
) then {
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
  // Save used column width scale
  _controlMemberlist setVariable [QGVAR(columnWidthScale), GVAR(memberlistColumnWidthScale)];
  #ifdef DEBUG_MODE_FULL
  _columnsRebuilded = true;
  #endif
};

private _columnTexts = _columns apply {[]};
private _columnIndex = 0;

private _iconSize = 0.9 * GVAR(uiHScale);
private _nameSize = 1 * GVAR(uiHScale);

{
  _x params ["_unit", "_icons", "_colors", "_isSpecialState", "_showSpecialState"];

  private _textColor = (_colors # 0) # 1;


  private _iconColor = (_colors select (_isSpecialState && _showSpecialState)) # 1;

  (_columnTexts # _columnIndex) pushBack format [
    "<t color='%1' size='%2' shadow='%3' valign='middle'><img image='%4' shadow='%3' size='%5' color='%6'/> %7</t>",
    [(_colors # 0) # 1, GVAR(memberlistOpacity)] call FUNC(hexToHexWithAlpha),
    _nameSize,
    GVAR(memberlistTextShadow),
    _icons select (_isSpecialState && _showSpecialState),
    _iconSize,
    [
      (_colors select (_isSpecialState && _showSpecialState)) # 1,
      GVAR(memberlistOpacity)
    ] call FUNC(hexToHexWithAlpha),
    _unit getVariable ["ACE_Name", localize ELSTRING(nametags,NoName)]
  ];
  if (((_forEachIndex + 1) % _listMaxCount) isEqualTo 0) then {
    _columnIndex = _columnIndex + 1;
  };
} forEach GVAR(membersCache);

{
  (_columns # _forEachIndex) ctrlSetStructuredText parseText (_x joinString "<br/>");
} forEach _columnTexts;

LOG_1("Memberlist drawn (rebuilded columns: %1)",str _columnsRebuilded);

END_COUNTER(drawMemberlist);
