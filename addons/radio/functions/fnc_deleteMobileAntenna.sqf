#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds mobile antenna for updating player's TFAR multiplicators
 */

params ["_antennaObj"];
TRACE_1("deleteMobileAntenna",_antennaObj);

// Exit on dedicated & headless
if !(hasInterface) exitWith {};

private _index = GVAR(mobileAntennas) find _antennaObj;

// Update multiplicators if antenna was removed
if (_index isNotEqualTo -1) then {
  GVAR(mobileAntennas) deleteAt _index;
  0 call FUNC(updatePlayerMultiplicators);
};
