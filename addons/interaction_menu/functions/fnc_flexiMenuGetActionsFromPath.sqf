#include "script_component.hpp"

params ["_target", "_player", "_menuActions", "_menuPath"];

if(count _menuPath > 0) then {
	{
		private ["_action", "_children", "_actionID", "_actionName", "_actionIcon", "_actionAct", "_actionCond", "_actionChildrenScript", "_actionParams"];

		_action = (_menuActions select _x) select 0;
		_children = (_menuActions select _x) select 1;
		_actionID = _action select 0;
		_actionName = _action select 1;
		_actionIcon = _action select 2;
		_actionAct = _action select 3;
		_actionCond = _action select 4;
		_actionChildrenScript = _action select 5;
		_actionParams = _action select 6;

		if(str _actionChildrenScript != "{}") then {
			_scriptedChildren = [_target, _player, _actionParams] call _actionChildrenScript;
			copyToClipboard str _scriptedChildren;
			_children append _scriptedChildren;

		};

		_menuActions = _children;

	} foreach _menuPath;
};

_menuActions