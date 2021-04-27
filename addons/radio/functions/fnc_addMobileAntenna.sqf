#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds mobile antenna for updating player's TFAR multiplicators
 */

params ["_antennaObj"];
TRACE_1("addMobileAntenna",_antennaObj);

private _index = GVAR(mobileAntennas) pushBackUnique _antennaObj;

// Update multiplicators if new antenna was registered
if (_index isNotEqualTo -1) then {
  if (GVAR(updateMultiplicatorsPFH) isEqualTo -1) then {
    GVAR(updateMultiplicatorsPFH) = [{0 call FUNC(updatePlayerMultiplicators)}, 5, []] call CBA_fnc_addPerFrameHandler;
  };

  [{0 call FUNC(updatePlayerMultiplicators)}, [], 0.25] call CBA_fnc_waitAndExecute;
};
