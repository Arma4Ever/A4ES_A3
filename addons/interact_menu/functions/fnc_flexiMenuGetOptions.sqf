#include "script_component.hpp"

params ["_mainTarget", "_player", "_menuActions", "_menuPath"];

private _menuOptions = [];
private _menuAddedOptions = [];

{
    _x params ["_action", "_children", "_target"];
    _action params ["_actionID", "_actionName", "_actionIcon", "_actionAct", "_actionCond", "_actionChildrenScript", "_actionParams"];

    if (isNil "_target") then {_target = _mainTarget;};

    ace_interact_menu_selectedTarget = _target;

    private _actionPath = [];
    _actionPath = _actionPath + _menuPath;
    _actionPath pushBack _forEachIndex;

    GVAR(fleximenuOptionsData) pushBack _actionID;
    missionNamespace setVariable [format["a3cs_fleximenudata_%1", _actionID], [_actionName, _actionPath]];

    if (_actionIcon == "") then {
        _actionIcon = QUOTE(\z\ace\addons\interaction\ui\dot_ca.paa);
    };

    private _actionActive = false;
    if ([_target, _player, _actionParams] call _actionCond) then {_actionActive = true;};

    if (!(_actionID in _menuAddedOptions)) then {
        if (count _children > 0 || str _actionChildrenScript != "{}") then {
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
                [[_actionAct, _actionCond, [_target, _player, _actionParams], _actionID], {_this call FUNC(flexiMenuCallOption)}],
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
