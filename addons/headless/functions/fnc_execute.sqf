#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Executes given function on least loaded headless client (or locally if none found)
 */

params ["_function", "_params"];
TRACE_1('execute',_function);

if !(isServer) exitWith {};

private _client = 0 call FUNC(getBestClient);

// Client is null, exec locally instead
if (isNull _client) exitWith {
	ERROR_1('getBestClient failed to find client, executing locally instead',_function);
	_params spawn (missionNamespace getVariable [_function, {}]);
};

// Count executes for selecting best client if execute fnc is called multiple times in same frame
_client setVariable [QGVAR(executes), (_client getVariable [QGVAR(executes), 0]) + 1];

// Execute function on selected client
TRACE_3('Executing function on headless client',_function,_client,owner _client);
_params remoteExec [_function, owner _client];
