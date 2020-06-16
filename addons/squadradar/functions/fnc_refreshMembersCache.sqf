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
    if (_x getVariable ["ACE_isUnconscious", false] || {!(alive _x)}) then {
      // Exit if player is not medic
      if !(ace_player call EFUNC(medical,isMedic)) exitWith {};

      _icon = "\a3\3den\data\cfgwaypoints\support_ca.paa";
      _iconColor = [[0.82, 0.15, 0.15], "#d22727"];
      _isSpecialState = true;
      _checkFOV = true;
    };

    if (_x getVariable [QEGVAR(nametags,isSpeaking), false]) then {
      _icon = "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\mutevon_ca.paa";
      _isSpecialState = true;
    };
  };

  [_x, [_baseIcon, _icon], [_color, _iconColor], _isSpecialState, false, _checkFOV]
};

END_COUNTER(refreshMembersCache);

// Refeesh draw cache
call FUNC(refreshDrawCache);
