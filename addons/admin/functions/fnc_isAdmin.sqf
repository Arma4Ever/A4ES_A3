/*
 * Author: SzwedzikPL
 * Check if unit is admin
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if(!isMultiplayer) exitWith {true};
if(!isPlayer _unit) exitWith {false};

private _adminConfigs = "true" configClasses (configFile >> QGVAR(admins));
private _allAdminsUIDs = [];
{
    private _adminUID = getText (_x >> "uid");
    _allAdminsUIDs pushBack _adminUID;
} foreach _adminConfigs;

private _unitUID = getPlayerUID _unit;
if(_unitUID in _allAdminsUIDs) exitWith {true};

false
