/*
 * Author: SzwedzikPL
 * Loads given admin panel module
 */
#include "script_component.hpp"

params [["_module", "", [""]]];
_module = tolower _module;

private _access = _module call FUNC(canAccessPanelModule);
if(!_access) exitWith {hint localize LSTRING(NoAccess);};

private _moduleConfig = (configFile >> QGVAR(modules) >> _module);
private _moduleType = getNumber (_moduleConfig >> "type");

if(_moduleType in [0,2,3]) then {
    private _moduleFunctionName = getText (_moduleConfig >> "function");
    private _moduleFunction = missionNamespace getVariable [_moduleFunctionName, {}];
    _module call FUNC(sendAdminActionLog);
    if(_moduleFunction isEqualType {}) then {
        [] call _moduleFunction;
    };
};
