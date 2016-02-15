#include "script_component.hpp"

_this spawn {
	while {dialog} do {
	    closeDialog 0;
	};

	sleep 0.01;

	params ["_actionCode", "_actionParams", "_actionID"];

	_actionParams params ["_target", "_player", "_actionCodeParams"];

	[_target, _player, _actionCodeParams] call _actionCode;
};