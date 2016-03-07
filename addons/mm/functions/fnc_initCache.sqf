/*
 * Author: SzwedzikPL
 * Init cache system
 */
#include "script_component.hpp"

if(!isServer) exitWith {};
if(is3DEN) exitWith {};
if(!isMultiplayer && ((tolower missionName) in ["intro","intro1","intro_new"])) exitWith {};

//log mission name to add this to ignored
A3CS_LOGINFO_1("initCache: %1",missionName)

if(!GVAR(cacheEnabled)) exitWith {};
if(GVAR(cacheInited)) exitWith {};

GVAR(cacheInited) = true;
GVAR(cachedGroups) = [];
GVAR(cacheGroups) = [];

private _playableUnits = [[player], playableUnits] select isMultiplayer;
{
    private _group = _x;
    private _groupUnits = units _group;
    private _playableInGroup = _groupUnits arrayIntersect _playableUnits;
    if((count _playableInGroup) == 0 && {!(_group in GVAR(cacheGroups))}) then {
        GVAR(cacheGroups) pushBack _group;
    };
} forEach allGroups;

GVAR(cacheIndex) = 0;

{systemChat localize LSTRING(Cache_Inited);} remoteExec ["BIS_fnc_call", 0];
[FUNC(cacheHandler), 0.1, []] call CBA_fnc_addPerFrameHandler;
