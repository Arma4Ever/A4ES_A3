/*
 * Author: SzwedzikPL
 * Toggle 3rd person
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcAdminPanel.hpp"

params [["_force", false, [false]]];

private _access = "debug3rdperson" call FUNC(canAccessPanelModule);
if(!_access && !_force) exitWith {hint localize LSTRING(NoAccess);};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if(isNull _display && !_force) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};

private _actionConfig = (configFile >> QGVAR(modules) >> "debug3rdperson");
private _actionName = getText (_actionConfig >> "displayName");
private _actionValues = getArray (_actionConfig >> "values");
private _actionVariable = getText (_actionConfig >> "variable");

if(!_force) then {
    _buttonIndex = GVAR(panelActiveButtonsActions) find "debug3rdperson";
    if(_buttonIndex < 0) exitWith {};
    _buttonControl = _display displayCtrl (GVAR(panelActiveButtons) select _buttonIndex);
};

if(!GVAR(debug3rdPersonEnabled)) then {
    if(difficultyEnabled "3rdPersonView") exitWith {};

    missionNamespace setVariable [_actionVariable, 1];
    if(!_force) then {_buttonControl ctrlSetText format [_actionName, _actionValues select 1];};
    GVAR(debug3rdPersonEnabled) = true;
    GVAR(lastInputPersonView) = 0;
    GVAR(enableForce3rd) = false;

    [{
        if(!GVAR(debug3rdPersonEnabled)) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};
        if(GVAR(lastInputPersonView) != inputAction "personView") then {
            if(GVAR(lastInputPersonView) == 1 && (inputAction "personView") == 0) then {
                GVAR(enableForce3rd) = !GVAR(enableForce3rd);
            };
            GVAR(lastInputPersonView) = inputAction "personView";
        };
        if(inputAction "Optics" > 0) then {
            GVAR(enableForce3rd) = false;
            (vehicle ace_player) switchCamera "Gunner";
            if(player != ace_player) then {player remoteControl cameraOn;};
        };
        if(GVAR(enableForce3rd) && {alive cameraOn}) then {
            (vehicle ace_player) switchCamera "External";
            if(player != ace_player) then {player remoteControl cameraOn;};
        };
    }, 0, []] call CBA_fnc_addPerFrameHandler;
} else {
    missionNamespace setVariable [_actionVariable, 1];
    if(!_force) then {_buttonControl ctrlSetText format [_actionName, _actionValues select 0];};
    GVAR(debug3rdPersonEnabled) = false;
};
