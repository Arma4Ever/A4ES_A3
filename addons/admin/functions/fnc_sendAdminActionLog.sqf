/*
 * Author: SzwedzikPL
 * Send log to main admin
 */
#include "script_component.hpp"

params ["_moduleClass"];

private _adminConfigs = "getNumber (_x >> 'admin') > 0" configClasses (configFile >> QGVAR(admins));
if (count _adminConfigs > 0) then {
    private _adminUIDs = [];
    {_adminUIDs pushback (getText (_x >> "uid"));} forEach _adminConfigs;
    private _admins = [];
    {
        if ((getPlayerUID _x) in _adminUIDs) then {_admins pushback _x;};
    } foreach allPlayers;
    if (count _admins > 0) then {
        private _name = player call EFUNC(common,getName);
        private _log = format ["[%1]: %2", _name, _moduleClass];
        _log remoteExecCall ["systemChat", _admins, false];
    };
};
