/*
 * Author: SzwedzikPL
 * Toggle debug camera
 */
#include "script_component.hpp"

private _access = "debugcamera" call FUNC(canAccessPanelModule);
if(!_access) exitWith {hint localize LSTRING(NoAccess);};

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if(isNull _display) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};

private _actionConfig = (configFile >> QGVAR(modules) >> "debugcamera");
private _actionVariable = getText (_actionConfig >> "variable");

if(isNull (findDisplay 60492)) then {
    missionNamespace setVariable [_actionVariable, 1];
    GVAR(debugCameraEnabled) = true;
    ["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
} else {
    missionNamespace setVariable [_actionVariable, 0];
    GVAR(debugCameraEnabled) = false;
    ["Terminate"] call BIS_fnc_EGSpectator;
};

closeDialog 0;
