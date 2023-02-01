#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns true if there are available headless clients to execute on
 */
TRACE_1('canExecute',isServer);

if !(isServer) exitWith {false};

(missionNamespace getVariable [QGVAR(headlessClients), []]) isNotEqualTo []
