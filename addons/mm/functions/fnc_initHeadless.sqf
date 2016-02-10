/*
 * Author: SzwedzikPL
 * Init headless client
 */
#include "script_component.hpp"

if(!isServer) exitWith {};
if(!isMultiplayer) exitWith {};
if(is3DENMultiplayer) exitWith {};
if(isNil "a3c_headlessClient" || {isNull a3c_headlessClient}) exitWith {};

private _headlessOwner = owner a3c_headlessClient;
{_x setGroupOwner _headlessOwner;nil} count allGroups;

{systemChat localize LSTRING(Headless_Inited);} remoteExec ["BIS_fnc_call", true];
