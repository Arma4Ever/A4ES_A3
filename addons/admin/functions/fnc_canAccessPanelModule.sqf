/*
 * Author: SzwedzikPL
 * Open admin panel button action
 */
#include "script_component.hpp"

params [["_module", "", [""]]];
_module = tolower _module;

private _return = false;

if(_module isEqualTo "adminpanel") then {
    if(!isMultiplayer) then {
        _return = true;
    } else {
        if(player call FUNC(isServerAdmin)) then {
            _return = true;
        } else {
            if(player call FUNC(isAdmin)) then {_return = true;};
        };
    };
} else {
    _moduleConfig = (configFile >> QGVAR(modules) >> _module);
    if(!isClass _moduleConfig) exitWith {false};
    _moduleMode = getNumber (_moduleConfig >> "mode");

    //Check in SP
    if(!isMultiplayer && {_moduleMode in [0,2]}) then {_return = true;};
    //Check in MP
    if(isMultiplayer && {_moduleMode in [1,2]}) then {
        private _serverAdminAllowed = (getNumber (_moduleConfig >> "serveradmin")) > 0;
        if(_serverAdminAllowed && {player call FUNC(isServerAdmin)}) then {
            _return = true;
        } else {
            private _isAdmin = player call FUNC(isAdmin);
            if(_isAdmin) then {
                private _adminsConfig = "(gettext (_x >> 'uid')) isEqualTo (getPlayerUID player)" configClasses (configFile >> QGVAR(admins));
                if(count _adminsConfig > 0) then {
                    private _adminConfig = _adminsConfig select 0;
                    private _adminAllowedModules = (getArray (_adminConfig >> "allowedModules")) apply {tolower _x};
                    if(tolower _module in _adminAllowedModules) then {_return = true;};
                };
            };
        };
    };
};

_return
