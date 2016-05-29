/*
 * Author: SzwedzikPL
 * Function for looped animation in doAnimation module
 */
#include "script_component.hpp"

params ["_units", "_anim", "_loopAnim", "_loopCondition"];

_units = _units select {alive _x};
if (count _units == 0) exitWith {systemchat "Koniec petli animacji - brak jednostek";};

if (!(_units call _loopCondition)) exitWith {systemchat "Koniec petli animacji";};

if (!isMultiplayer) then {systemchat format ["Wykonuje animacje: %1", _anim];};

{[_x, _anim, 2, false] call ace_common_fnc_doAnimation;} forEach _units;

if (_loopAnim) then {
    [{
        params ["_units", "_anim"];
        private _aliveUnits = _units select {alive _x};
        (count _aliveUnits == 0) || {(animationstate (_aliveUnits select 0) != _anim)}
    }, DFUNC(doAnimationGlobal), [_units, _anim, _loopAnim, _loopCondition]] call CBA_fnc_waitUntilAndExecute;
};
