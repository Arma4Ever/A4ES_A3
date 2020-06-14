#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Refreshes squad members state icons
 */

LOG("Refreshing members state icons");

{
  _x setVariable [QGVAR(icon), _x getVariable [QGVAR(baseIcon), ""]];

  if (_x getVariable ["ACE_isUnconscious", false] || {!(alive _x)}) then {
    _x setVariable [QGVAR(icon), "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\support_ca.paa"],
  };

  if (_x getVariable [QEGVAR(nametags,isSpeaking), false]) then {
    _x setVariable [QGVAR(icon), "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\mutevon_ca.paa"],
  };
} forEach allUnits;
