#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members state icons
 */

LOG("Refreshing members state icons");

{
  private _icon = _x getVariable [QGVAR(baseIcon), ""];
  private _iconColor = nil;

  if (_x getVariable ["ACE_isUnconscious", false] || {!(alive _x)}) then {
    _icon = "\a3\3den\data\cfgwaypoints\support_ca.paa";
    _iconColor = [[0.82, 0.15, 0.15], "#d22727"];
  };

  if (_x getVariable [QEGVAR(nametags,isSpeaking), false]) then {
    _icon = "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\mutevon_ca.paa";
  };

  _x setVariable [QGVAR(icon), _icon];
  _x setVariable [QGVAR(iconColor), _iconColor];
} forEach GVAR(currentSquadUnits);
