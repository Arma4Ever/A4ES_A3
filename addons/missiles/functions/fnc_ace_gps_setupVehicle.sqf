#include "\z\ace\addons\missileguidance\script_component.hpp"
/*
 * Author: Dani (TCVM)
 * Adds interaction menu actions to configure GPS bombs
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player] call ace_missileguidance_fnc_gps_setupVehicle
 *
 * Public: No
 */
params ["_player"];

private _vehicle = vehicle _player;
private _turretPath = [-1];

if (_vehicle getVariable [QGVAR(gps_actionsAdded), false]) exitWith {};
_vehicle setVariable [QGVAR(gps_actionsAdded), true];

private _condition = {
    params ["_target", "_player"];

    private _turretPath = if (ACE_player == (driver _target)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
    private _hasGPS = false;
    {
        private _magazines = getArray (configFile >> "CfgWeapons" >> _x >> "magazines");
        {
            private _ammo = getText (configFile >> "CfgMagazines" >> _x >> "ammo");
            private _ammoSeekerTypes = getArray (configFile >> "CfgAmmo" >> _ammo >> QUOTE(ADDON) >> "seekerTypes");

            _hasGPS = "GPS" in _ammoSeekerTypes;

            if (_hasGPS) exitWith { true };
        } forEach _magazines;

        if (_hasGPS) exitWith { true };
    } forEach (_target weaponsTurret _turretPath);

    _hasGPS
};

private _statement = {
    createDialog QGVAR(gpsAttackOptionsUI);
};

private _action = [QUOTE(ADDON), localize "STR_A3CS_missiles_GPS_ui_action", "", _statement, _condition] call EFUNC(interact_menu,createAction);
[_vehicle, 1, ["ACE_SelfActions"], _action] call EFUNC(interact_menu,addActionToObject);
