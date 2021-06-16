#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init dyn sim for 3DEN entities (groups & objects)
 */

params ["_entity"];
TRACE_1("initEntityDynSim",_entity);

// Exit if group already inited
if ((_entity get3DENAttribute QGVAR(dynamicSimulationInited)) # 0) exitWith {};

_entity set3DENAttribute ["dynamicSimulation", true];
_entity set3DENAttribute [QGVAR(dynamicSimulationInited), true];
