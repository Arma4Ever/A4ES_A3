#include "script_component.hpp"

params ["_target", "_player", "_menuActions", "_menuPath"];

if (count _menuPath > 0) then {
    {
        (_menuActions select _x) params ["_action", "_actionChildren", "_actionChildrenTarget"];
        //_action params ["_actionID", "_actionName", "_actionIcon", "_actionAct", "_actionCond", "_actionChildrenScript", "_actionParams"];
        _action params ["", "", "", "", "", "_actionChildrenScript", "_actionParams"];

        if (!(_actionChildren isEqualType [])) then {_actionChildren = [];};

        if (str _actionChildrenScript != "{}") then {

            if (isNil "_actionChildrenTarget") then {_actionChildrenTarget = _target;};
            _scriptedChildren = [_actionChildrenTarget, _player, _actionParams] call _actionChildrenScript;

            if (count _scriptedChildren > 0) then {
                private _newActionChildren = [];
                private _scriptedChildrenIDs = [];
                {
                    private _childID = (_x select 0) select 0;
                    _scriptedChildrenIDs pushBack _childID;
                } forEach _scriptedChildren;
                {
                    private _childID = (_x select 0) select 0;
                    if (!(_childID in _scriptedChildrenIDs)) then {
                        _newActionChildren pushback _x;
                    };
                } forEach _actionChildren;
                _newActionChildren append _scriptedChildren;
                _actionChildren = _newActionChildren;
            };
        };

        _menuActions = _actionChildren;
    } foreach _menuPath;
};

_menuActions
