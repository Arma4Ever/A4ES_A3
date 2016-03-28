/*
 * Author: SzwedzikPL
 * Exports all ACE settings
 */
#include "script_component.hpp"

private _configs = "true" configClasses (configFile >> "ACE_Settings");
private _classes = [];
{
    private _class = configName _x;
    if((toLower _class) find "a3cs_" != 0) then {
        _classes pushBackUnique _class;
    };
} foreach _configs;
_classes sort true;

diag_log text "======================================";
diag_log text "======================================";
{
    private _class = _x;
    private _config = (configFile >> "ACE_Settings" >> _class);
    private _category = getText (_config >> "category");
    private _displayName = getText (_config >> "displayName");
    private _description = getText (_config >> "description");
    private _typeName = getText (_config >> "typeName");

    //value
    private _value = 0;
    if(isNumber (_config >> "value")) then {_value = getNumber (_config >> "value");};
    if(isText (_config >> "value")) then {_value = getText (_config >> "value");_value = format ["""%1""", _value];};
    if(isArray (_config >> "value")) then {_value = getArray (_config >> "value");};

    private _isClientSettable = getNumber (_config >> "isClientSettable");
    private _values = getArray (_config >> "values");

    diag_log text format ["class %1 {", _class];
    if(_displayName != "") then {diag_log text format ["    //%1", _displayName];};
    if(_displayName != "") then {diag_log text format ["    //%1", _description];};
    diag_log text format ["    typeName = ""%1"";", _typeName];
    diag_log text format ["    value = %1;", _value];
    diag_log text format ["    isClientSettable = %1;", _isClientSettable];
    if(count _values > 0) then {
        diag_log text format ["    values[] = %1;", _values];
    };
    diag_log text "};"
} foreach _classes;
diag_log text "======================================";
diag_log text "======================================";
hint "gotowe";
