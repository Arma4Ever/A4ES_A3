/*
 * Author: SzwedzikPL
 * Init headless client on server
 */
#include "script_component.hpp"

if (!isServer) exitWith {};
if (!isMultiplayer) exitWith {};
if (is3DENMultiplayer) exitWith {};

private _headlessClient = missionNamespace getVariable [QGVAR(headlessClient), objNull];
if (isNull _headlessClient) exitWith {};

private _headlessClientOwner = owner _headlessClient;
if (_headlessClientOwner == 2) exitWith {};

private _groups = allGroups select {!(_x getVariable ["disableHeadless", false])};

//Transfer groups to HC
[_groups] call FUNC(transferGroups);

//Send info to all players
{systemChat localize LSTRING(Headless_Inited);} remoteExec ["BIS_fnc_call", 0];
