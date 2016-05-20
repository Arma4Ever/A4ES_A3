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
if (isNull _unit) then {
    _unitUID = profilenamespace getVariable ["player_uid", "0"];
};
if (_unitUID in _allAdminsUIDs) exitWith {true};

false
