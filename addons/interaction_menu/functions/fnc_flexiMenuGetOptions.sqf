#include "script_component.hpp"

params ["_target", "_player", "_menuActions", "_menuPath"];

private ["_menuOptions", "_menuAddedOptions"];

_menuOptions = [];
_menuAddedOptions = [];

{
	private ["_action", "_children", "_actionID", "_actionName", "_actionIcon", "_actionAct", "_actionCond", "_actionChildrenScript", "_actionParams"];

	_action = _x select 0;
	_children = _x select 1;
	_actionID = _action select 0;
	_actionName = _action select 1;
	_actionIcon = _action select 2;
	_actionAct = _action select 3;
	_actionCond = _action select 4;
	_actionChildrenScript = _action select 5;
	_actionParams = _action select 6;

	private ["_actionPath", "_actionActive"];

	_actionPath = [];
	_actionPath = _actionPath + _menuPath;
	_actionPath pushBack _foreachIndex;

	GVAR(fleximenuOptionsData) pushBack _actionID;
	missionNamespace setVariable [format["a3cs_fleximenudata_%1", _actionID], [_actionName, _actionPath]];

	if(_actionIcon == "") then {
		_actionIcon = QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa);
	};

	_actionActive = false;
	if([_target, _player, _actionParams] call _actionCond) then {_actionActive = true;};

	if(!(_actionID in _menuAddedOptions)) then {
		if(count _children > 0 || str _actionChildrenScript != "{}") then {
			_menuOptions pushback [
				format ["%1 >",_actionName],
				"",
				_actionIcon,
				"",
				[QUOTE(PATHTOF(flexiMenu.sqf)), _actionID, 1],
				-1,
				_actionActive,
				_actionActive
			];
		} else {
			_menuOptions pushback [
				_actionName,
				[[_actionAct, [_target, _player, _actionParams], _actionID], {_this call FUNC(flexiMenuCallOption)}],
				_actionIcon,
				"",
				"",
				-1,
				1,
				_actionActive
			];
		};
		_menuAddedOptions pushBack _actionID;
	};
} foreach _menuActions;

_menuOptions