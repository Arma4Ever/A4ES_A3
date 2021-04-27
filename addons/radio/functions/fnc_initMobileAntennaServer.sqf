#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Mobile antenna server init
 */

params ["_antennaObj"];
TRACE_1("initMobileAntennaServer",_antennaObj);

// Antennas are ThingX objects, should always have dyn sim enabled 
_antennaObj enableDynamicSimulation true;
