/*
 * Author: SzwedzikPL
 * Check if unit is admin
 */
#include "script_component.hpp"

private _unit = player;

if (!isMultiplayer) exitWith {true};
private _adminConfigs = "true" configClasses (configFile >> QGVAR(admins));
private _allAdminsUIDs = [];
{
    private _adminUID = getText (_x >> "uid");
    _allAdminsUIDs pushBack _adminUID;
} foreach _adminConfigs;

private _unitUID = getPlayerUID _unit;
if (_unitUID == "") then {
    private _profileUID = profilenamespace getVariable ["player_uid", "0"];
    private _adminsConfig = (format ["(gettext (_x >> 'uid')) isEqualTo '%1'", _profileUID]) configClasses (configFile >> QGVAR(admins));
    if (count _adminsConfig > 0) then {
        private _adminConfig = _adminsConfig select 0;
        private _isSuperAdmin = getNumber (_adminConfig >> "admin") > 0;
        if (_isSuperAdmin) then {
            _unitUID = _profileUID;
        };
    };
};
if (_unitUID in _allAdminsUIDs) exitWith {true};

false
