#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes members state cache for radar & memberlist
 */

LOG("Refreshing members state cache");

BEGIN_COUNTER(refreshMembersStateCache);

// Build squad units radar cache list
GVAR(radarMembersCache) = GVAR(currentSquadUnitsRadar) apply {
  private _icon = _x getVariable [QGVAR(baseIcon), ""];
  private _color = _x getVariable [QEGVAR(nametags,unitColor), [[1, 1, 1], "#ffffff"]];
  private _iconColor = _color;
  private _isSpecialState = false;

  if (_x getVariable ["ACE_isUnconscious", false] || {!(alive _x)}) then {
    _icon = "\a3\3den\data\cfgwaypoints\support_ca.paa";
    _iconColor = [[0.82, 0.15, 0.15], "#d22727"];
    _isSpecialState = true;
  };

  if (_x getVariable [QEGVAR(nametags,isSpeaking), false]) then {
    _icon = "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\mutevon_ca.paa";
    _isSpecialState = true;
  };

  // Save vars for memberlist draw
  _x setVariable [QGVAR(icon), _icon];
  _x setVariable [QGVAR(color), _color # 1];
  _x setVariable [QGVAR(iconColor), _iconColor # 1];
  _x setVariable [QGVAR(isSpecialState), _isSpecialState];

  // Save data array for radar draw
  [_x, _icon, _iconColor # 0, _isSpecialState]
};

END_COUNTER(refreshMembersStateCache);

// Refeesh radar draw cache
call FUNC(refreshRadarDrawCache);
