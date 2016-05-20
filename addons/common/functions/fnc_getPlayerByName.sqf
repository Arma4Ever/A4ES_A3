/*
 * Author: SzwedzikPL
 * get unit by name
 */
#include "script_component.hpp"

params [["_name", "", [""]]];

_name = toLower _name;
private _allPlayers = [[player], allPlayers] select isMultiplayer;

private _units = _allPlayers select {(toLower (_x call FUNC(getName)) find _name) >= 0};
private _return = objNull;

if (count _units > 0) then {_return = _units select 0;};

_return
