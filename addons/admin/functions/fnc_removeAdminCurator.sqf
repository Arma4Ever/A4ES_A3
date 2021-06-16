/*
 * Author: SzwedzikPL
 * Remove curator access from given admin
 */
#include "script_component.hpp"

params ["_admin"];

if (!isServer) exitWith {};

private _canAccess = false;

if (!isMultiplayer) then {
    _canAccess = true;
} else {
    private _adminUID = getPlayerUID _admin;
    private _adminsConfig = (format ["(gettext (_x >> 'uid')) isEqualTo '%1'", _adminUID]) configClasses (configFile >> QGVAR(admins));
    if (count _adminsConfig > 0) then {
        private _adminConfig = _adminsConfig select 0;
        private _adminAllowedModules = (getArray (_adminConfig >> "allowedModules")) apply {tolower _x};
        if ("debugcurator" in _adminAllowedModules) then {_canAccess = true;};
    };
};

if (!_canAccess) exitWith {};
if (isNull (getAssignedCuratorLogic _admin)) exitWith {};

_admin setVariable [QEGVAR(curator,isCurator), false, true];
_admin call EFUNC(curator,unassignCuratorModule);

private _name = _admin call EFUNC(common,getUnitName);
[QGVAR(debugCuratorDeactivated), _name] call CBA_fnc_globalEvent;
