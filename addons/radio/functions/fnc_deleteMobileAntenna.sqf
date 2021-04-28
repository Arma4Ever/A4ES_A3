#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes mobile antenna from registry
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
