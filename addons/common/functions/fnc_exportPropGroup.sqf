/*
 * Author: SzwedzikPL
 * Exports 3DEN mission props to group cfg format
 * WIP - not working for now!
 */
#include "script_component.hpp"

if(!is3DEN) exitWith {systemchat "not in eden";};

private _centerObject = (get3DENSelected "logic") select 0;

if(isNil "_centerObject" || {isNull _centerObject}) exitWith {systemchat "no center point detected";};

private _allObjects = all3DENEntities select 0;
private _tab = "    ";
private _objectCount = 0;

diag_log text "======================================";
{
    private _object = _x;
    if(!(_object isKindOf "CAManBase") && !(_object isKindOf "Logic")) then {

        private _objectClass = typeof _object;
        private _objectDir = getDir _object;
        private _objectPosition = _centerObject worldToModelVisual (ASLToAGL getPosASL _object);

        diag_log text format ["class Object%1 {", _objectCount];
        diag_log text format ["%1dir = %2;", _tab, _objectDir];
        diag_log text format ["%1position[] = {%2,%3,%4};", _tab, _objectPosition select 0, _objectPosition select 1, _objectPosition select 2];
        diag_log text format ["%1rank = """";", _tab];
        diag_log text format ["%1side = 8;", _tab];
        diag_log text format ["%1vehicle = ""%2"";", _tab, _objectClass];
        diag_log text format ["};"];

        _objectCount = _objectCount + 1;
    };
} forEach _allObjects;
diag_log text "======================================";
systemchat "export successful";
