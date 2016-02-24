/*
    Author: SzwedzikPL
    Replace class of selected object in eden editor
*/
#include "script_component.hpp"

params ["_class"];

diag_log GVAR(changeClassArray);
diag_log _class;

//check params
if(isNil QGVAR(changeClassArray) || {count GVAR(changeClassArray) == 0}) exitWith {
    [localize LSTRING(ChangeClass_InvalidObjects), 2, 1] call FUNC(showMessage);
};
if(isNil "_class" || _class == "") exitWith {
    [localize LSTRING(ChangeClass_InvalidClass), 2, 1] call FUNC(showMessage);
};

//check given class
if(!isClass (configFile >> "CfgVehicles" >> _class) || {getNumber (configFile >> "CfgVehicles" >> _class >> "scope") == 0}) exitWith {
    [localize LSTRING(ChangeClass_InvalidClass), 2, 1] call FUNC(showMessage);
};

//change class
GVAR(changeClassArray) set3DENObjectType _class;
GVAR(changeClassArray) = [];

//show message
[localize LSTRING(ChangeClass_ClassChanged), 0.8, 0] call FUNC(showMessage);

//close display
disableSerialization;
private _display = uiNamespace getVariable ["A3CS_ui_3DENChangeClass", displayNull];
if(isNull _display) exitWith {};
_display closeDisplay 1;

true
