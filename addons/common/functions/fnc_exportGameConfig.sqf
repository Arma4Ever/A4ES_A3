/*
 * Author: SzwedzikPL
 * Exports whole ArmA config
 */
#include "script_component.hpp"

//if (true) exitWith {_this spawn a3cs_common_fnc_exportGameConfig;};

hint "Wczytywanie...";
sleep 2;

diag_log text format ["//==   %1 %2 %3   ==//", productVersion select 0, productVersion select 2, productVersion select 4];
diag_log text "//======================================//";
diag_log text "//              GAME CONFIG             //";
diag_log text "//======================================//";
diag_log text "";

_getTabs = {
    params ["_level"];
    private _return = "";
    for "_i" from 1 to _level do {
        _return = _return + "    ";
    };
    _return
};

_arrayToString = {
    params ["_array"];
    private _strArray = str _array;
    private _arArray = toArray _strArray;
    private _inString = false;
    {
        if (_x == 34) then {_inString = !_inString;};
        if (_x == 91 && !_inString) then {_arArray set [_forEachIndex, 123];};
        if (_x == 93 && !_inString) then {_arArray set [_forEachIndex, 125];};
    } forEach _arArray;
    toString _arArray
};

_readClass = {
    params ["_config", "_classLevel"];
    private _classProperties = configProperties [_config, "true", false];
    private _tabs = [_classLevel] call _getTabs;
    private _classPropertiesClasses = [];
    {
        private _property = _x;
        private _propertyName = configName _property;
        if (isClass _property) then {
            _classPropertiesClasses pushBackUnique _property;
        } else {
            private _value = "";
            if (isNumber _property) then {
                _value = getNumber _property;
            };
            if (isText _property) then {
                _value = """" + (getText _property) + """";
            };
            if (isArray _property) then {
                _value = [getArray _property] call _arrayToString;
                _propertyName = format ["%1[]", _propertyName];
            };
            diag_log text format ["%1%2 = %3;", _tabs, _propertyName, _value];
        };
    } forEach _classProperties;
    {
        private _class = _x;
        private _className = configName _class;
        private _inheritClass = configname (inheritsFrom _class);
        private _haveProperties = count (configProperties [_class, "true", false]) > 0;

        if (_inheritClass != "") then {_inheritClass = format [": %1", _inheritClass];};

        if (_haveProperties) then {
            diag_log text format ["%1class %2%3 {", _tabs, _className, _inheritClass];
            [_class, _classLevel+1] call _readClass;
            diag_log text format ["%1};", _tabs];
        } else {
            diag_log text format ["%1class %2%3 {};", _tabs, _className, _inheritClass];
        };
    } forEach _classPropertiesClasses;
};

private _timeStart = time;
private _mainClasses = "true" configClasses (configFile);
_countMainClasses = count _mainClasses;
_mainClassesDone = 0;
{
    private _className = configName _x;

    _mainClassesDone = _mainClassesDone + 1;
    hint format ["%1 / %2", _mainClassesDone, _countMainClasses];
    hintSilent parseText format["<t size='1.5'>%1 / %2</t><br/><br/>%3", _mainClassesDone, _countMainClasses, _className];

    diag_log text format ["class %1 {", _className];
    [_x, 1] call _readClass;
    diag_log text "};";
} forEach _mainClasses;

private _time = time - _timeStart;
private _timeStr = [_time, "MM:SS"] call BIS_fnc_secondsToString;

hintSilent parseText format["<t size='1.5'>Koniec</t><br/><br/>Czas: %1", _timeStr];
