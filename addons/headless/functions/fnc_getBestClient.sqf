#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns least loaded headless client
 */
TRACE_1('getBestClient',isServer);
if !(isServer) exitWith {objNull};

private _clients = missionNamespace getVariable [QGVAR(headlessClients), []];
if (_clients isEqualTo []) exitWith {objNull};

// If only 1 headless is present, we don't have a choice
if ((count _clients) == 1) exitWith {_clients # 0};

private _possibleClients = [];

if ((GVAR(lastAIBasedSelection) + 3) > CBA_missionTime) then {
	// Last AI based selection was fewer than 3 seconds ago. In 3 seconds 
	// AI count can't really change that much. Instead, we'll use executes
	// count to make sure we don't execute multiple functions on the same 
	// client in case there're executed in short period of time.
	_possibleClients = _clients apply {
		[_x getVariable [QGVAR(executes), 0], _x]
	};

	TRACE_3('Selecting best client based on executes count',_possibleClients,GVAR(lastAIBasedSelection),CBA_missionTime);
} else {
	// Reset executions for possible counting in case of rapid exectuion
	{_x setVariable [QGVAR(executes), 0];} forEach _clients;

	private _allUnits = allUnits;
	_possibleClients = _clients apply {
		private _owner = owner _x;
		[{(owner _x) == _owner && {alive _x}} count _allUnits,_x]
	};

	TRACE_3('Selecting best client based on alive local AI count',_possibleClients,GVAR(lastAIBasedSelection),CBA_missionTime);
	GVAR(lastAIBasedSelection) = CBA_missionTime;
};

if (_possibleClients isEqualTo []) exitWith {objNull};

// Select least loaded client
_possibleClients sort true;
(_possibleClients # 0) # 1
