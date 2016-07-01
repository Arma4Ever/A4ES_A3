#include "script_component.hpp"

_this spawn {
    while {dialog} do {
        closeDialog 0;
    };

    sleep 0.01;

    params ["_actionCode", "_actionCond", "_actionParams", "_actionID"];
    _actionParams params ["_target", "_player", "_actionCodeParams"];

    if ([_target, _player, _actionCodeParams] call _actionCond) then {
        [_target, _player, _actionCodeParams] call _actionCode;
    } else {
        [localize LSTRING(Action_Canceled), 2, _player] call ace_common_fnc_displayTextStructured;
    };
};
