/*
 * Author: SzwedzikPL
 * Enable group AI (part of cache system)
 */
#include "script_component.hpp"

params ["_group"];

private _groupUnits = units _group;
private _groupLeader = leader _group;

if(!local _groupLeader) exitWith {
    _group remoteExecCall [QFUNC(enableGroupAI), _groupLeader, false];
};

{
    private _unit = _x;
    if(local _unit && {!isObjectHidden _unit}) then {
        {
            _unit enableAI _x;
        } forEach ["TARGET","AUTOTARGET","MOVE","ANIM","TEAMSWITCH","FSM","AIMINGERROR","SUPPRESSION","CHECKVISIBLE","COVER","AUTOCOMBAT"];
        _unit call FUNC(loadSpecialStates);
    };
} forEach _groupUnits;
