#include "script_component.hpp"

params ["_target", "_player", "_menuActions", "_menuPath"];

if(count _menuPath > 0) then {
	{
        (_menuActions select _x) params ["_action", "_actionChildren"];
        _action params ["_actionID", "_actionName", "_actionIcon", "_actionAct", "_actionCond", "_actionChildrenScript", "_actionParams"];

		if(str _actionChildrenScript != "{}") then {
			_scriptedChildren = [_target, _player, _actionParams] call _actionChildrenScript;

            if(typename _actionChildren != typename []) then {_actionChildren = [];};

			_actionChildren = _scriptedChildren;
		};

		_menuActions = _actionChildren;
	} foreach _menuPath;
};

_menuActions
