#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes members cache
 */

LOG("Refreshing members cache");

BEGIN_COUNTER(refreshMembersCache);

// Build squad members cache
GVAR(membersCache) = GVAR(currentSquadUnits) apply {
  private _baseIcon = _x getVariable [QGVAR(baseIcon), ""];
  private _icon = _baseIcon;
  private _color = _x getVariable [QEGVAR(nametags,unitColor), [[1, 1, 1], "#ffffff"]];
  private _iconColor = _color;
  private _isSpecialState = false;
  private _checkFOV = false;

  if (GVAR(showSpecialStates)) then {
    switch true do {
      case (
        (_x getVariable ["ACE_isUnconscious", false] || {!(alive _x)}) &&
        {(ace_player call EFUNC(medical,isMedic))}
      ): {
        _icon = "\a3\3den\data\cfgwaypoints\support_ca.paa";
        _iconColor = [[0.82, 0.15, 0.15], "#d22727"];
        _isSpecialState = true;
        _checkFOV = true;
      };
      case (_x getVariable [QEGVAR(nametags,isSpeaking), false]): {
        _icon = "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\mutevon_ca.paa";
        _isSpecialState = true;
      };
      case (_x getVariable [QGVAR(hasCustomSpecialIcon), false]): {
        private _customSpecialIconData = _x getVariable [QGVAR(customSpecialIcon), []];
        _customSpecialIconData params ["_customIcon", "_customIconColor", "_custonIconCheckFOV"];
        _icon = _customIcon;
        _iconColor = _customIconColor;
        _isSpecialState = true;
        _checkFOV = _custonIconCheckFOV;
      };
    };
  };

  [_x, [_baseIcon, _icon], [_color, _iconColor], _isSpecialState, false, _checkFOV]
};

END_COUNTER(refreshMembersCache);

// Refeesh draw cache
call FUNC(refreshDrawCache);
