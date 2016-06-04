/*
 * Author: SzwedzikPL
 * Add curator access to given admin
 */
#include "script_component.hpp"

params ["_admin"];

if (!isServer) exitWith {};

private _canAccess = false;

if (!isMultiplayer) then {
    _canAccess = true;
} else {
    private _adminUID = getPlayerUID _admin;
    private _adminsConfig = (format ["(gettext (_x >> 'uid')) isEqualTo %1", _adminUID]) configClasses (configFile >> QGVAR(admins));
    if (count _adminsConfig > 0) then {
        private _adminConfig = _adminsConfig select 0;
        private _adminAllowedModules = (getArray (_adminConfig >> "allowedModules")) apply {tolower _x};
        if ("debugcurator" in _adminAllowedModules) then {_canAccess = true;};
    };
};

if (!_canAccess) exitWith {};
if (!isNull (getAssignedCuratorLogic _admin)) exitWith {};

private _curatorModule = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "FORM"];
_curatorModule setVariable [QGVAR(adminCurator), true, true];
_admin assignCurator _curatorModule;

[{
    _this addCuratorAddons (("true" configClasses (configFile >> "CfgPatches")) apply {toLower configName _x});
    _this addCuratorEditableObjects [allMissionObjects "All", false];
}, _curatorModule, 2] call CBA_fnc_waitAndExecute;
