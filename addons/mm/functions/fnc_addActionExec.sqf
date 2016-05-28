/*
 * Author: SzwedzikPL
 * Exec added action
 */
#include "script_component.hpp"

params ["_target", "_player", "_actionParams"];
_actionParams params ["_actionID", "_actionCodeLocal", "_actionCodeGlobal", "_actionTarget", "_actionDisposable"];

//Exec local code
[] call _actionCodeLocal;

//Exec global code
if (str _actionCodeGlobal != "{}") then {
    _actionCodeGlobal remoteExecCall ["bis_fnc_call", 0];
};

if (_actionDisposable) then {
    [_target, 0, ["ACE_MainActions", _actionID]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", _actionTarget, true];
};
