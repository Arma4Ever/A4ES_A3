/*
 * Author: SzwedzikPL
 * Open admin panel button action
 */
#include "script_component.hpp"

params [["_module", "", [""]]];
_module = tolower _module;

private _return = false;

if (_module isEqualTo "adminpanel") then {
    if (!isMultiplayer) then {
        _return = true;
    } else {
        if ([] call FUNC(isServerAdmin)) then {
            _return = true;
        } else {
            if ([] call FUNC(isAdmin)) then {_return = true;};
        };
    };
} else {
    _moduleConfig = (configFile >> QGVAR(modules) >> _module);
    if (!isClass _moduleConfig) exitWith {false};
    _moduleMode = getNumber (_moduleConfig >> "mode");

    //Check in SP
    if (!isMultiplayer && {_moduleMode in [0,2]}) then {_return = true;};
    //Check in MP
    if (isMultiplayer && {_moduleMode in [1,2]}) then {
        private _serverAdminAllowed = (getNumber (_moduleConfig >> "serveradmin")) > 0;
        if (_serverAdminAllowed && {[] call FUNC(isServerAdmin)}) then {
            _return = true;
        } else {
            private _isAdmin = [] call FUNC(isAdmin);
            if (_isAdmin) then {
                private _unitUID = getPlayerUID player;
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
                private _adminsConfig = (format ["(gettext (_x >> 'uid')) isEqualTo '%1'", _unitUID]) configClasses (configFile >> QGVAR(admins));
                if (count _adminsConfig > 0) then {
                    private _adminConfig = _adminsConfig select 0;
                    private _adminAllowedModules = (getArray (_adminConfig >> "allowedModules")) apply {tolower _x};
                    if (tolower _module in _adminAllowedModules) then {_return = true;};
                };
            };
        };
    };
};

_return
