/*
 * Author: SzwedzikPL
 * Killed EH (runs on serverName only)
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

[{
    params [["_victim", objNull, [objNull]], ["_killerVanilla", objNull, [objNull]]];

    private _killer = _victim getVariable ["a3cs_lastHitPartSource", _killerVanilla];
    private _ammo = _victim getVariable ["a3cs_lastHitPartSourceAmmo", ""];

    private _victimName = _victim call EFUNC(common,getName);
    private _killerName = localize LSTRING(Environment);
    private _killerWeapon = "";

    if (!isNull _killer) then {
        _killerName = ["AI", (_killer call EFUNC(common,getName))] select (isPlayer _killer);
        if (_ammo != "") then {
            private _killerVehicle = vehicle _killer;
            if ((_killer isKindOf "CAManBase") && (_killerVehicle isEqualTo _killer)) then {
                //on foot
                private _currentMagazine = currentMagazine _killer;
                private _currentAmmo = getText (configFile >> "CfgMagazines" >> _currentMagazine >> "ammo");
                if (_ammo == _currentAmmo) then {
                    private _currentWeapon = currentWeapon _killer;
                    _killerWeapon = getText (configFile >> "CfgWeapons" >> _currentWeapon >> "DisplayName");
                } else {
                    _killerWeapon = _ammo;
                };
            } else {
                //Vehicle
                _killerWeapon = getText (configFile >> "CfgVehicles" >> typeof _killerVehicle >> "DisplayName");
            };
        };

        if (_killerWeapon != "") then {
            _killerName = format ["%1 (%2)", _killerName, _killerWeapon];
        };
    };

    private _logData = [_victim, _victimName, _killer, _killerName, _ammo, _killerWeapon];
    TRACE_1("handleKilled",_logData);

    //Send dead log if victim is player
    if (isPlayer _victim) then {
        private _Log = format [localize LSTRING(Log_WasKilledBy), _victimName, _killerName];
        _Log call FUNC(missionLog);
    };

    //Add kill score if killer is player?
    if (isPlayer _killer) then {

    };
}, _this, 1] call CBA_fnc_waitAndExecute;
