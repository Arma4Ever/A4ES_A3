/*
 * Author: SzwedzikPL
 * Killed handler for genAttack units
 */
#include "script_component.hpp"

params [["_groups", [], [[]]]];

//if not server call it on server
if (!isServer) exitWith {_this remoteExecCall [QFUNC(transferGroups), 2, false];};

private _headlessClient = missionNamespace getVariable [QGVAR(headlessClient), objNull];
if (isNull _headlessClient) exitWith {};

private _headlessClientOwner = owner _headlessClient;
if (_headlessClientOwner == 2) exitWith {};

//transfer groups to HC
{_x setGroupOwner _headlessClientOwner;} forEach _groups;
