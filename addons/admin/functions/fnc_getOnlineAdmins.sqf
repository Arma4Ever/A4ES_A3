/*
 * Author: SzwedzikPL
 * Get online admins
 */
#include "script_component.hpp"

params [["_includeServerAdmin", true, [true]]];

private _admins = [];

if (isMultiplayer) then {
    private _adminConfigs = "true" configClasses (configFile >> QGVAR(admins));
    private _allAdminsUIDs = [];
    {
        private _adminUID = getText (_x >> "uid");
        _allAdminsUIDs pushBack _adminUID;
    } foreach _adminConfigs;
    {
        if ((getPlayerUID _x) in _allAdminsUIDs) then {_admins pushBack _x;};
    } forEach allPlayers;
    if (_includeServerAdmin) then {
        _serverAdmin = missionNamespace getVariable [QGVAR(serverAdmin), objNull];
        if (!isNull _serverAdmin) then {
            _admins pushBackUnique _serverAdmin;
        };
    };
} else {
    _admins = [player];
};

_admins
