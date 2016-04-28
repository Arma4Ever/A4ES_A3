/*
 * Author: SzwedzikPL
 * Exports all ACE settings
 */
#include "script_component.hpp"

private _classesClient = [];
private _classesConfig = [];
{
    private _class = configName _x;
    private _isColor = (getText (_x >> "typeName")) == "color";
    if(((toLower _class) find "a3cs_" != 0) && !_isColor) then {
        if(getNumber (_x >> "isClientSettable") > 0) then {
            _classesClient pushBackUnique _class;
        } else {
            _classesConfig pushBackUnique _class;
        };
    };
} foreach ("true" configClasses (configFile >> "ACE_Settings"));
_classesClient sort true;
_classesConfig sort true;

private _fnc_exportSettings = {
    private _class = _this;
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
    if(_description != "") then {diag_log text format ["    //%1", _description];};
    diag_log text format ["    //typeName: %1", _typeName];
    diag_log text format ["    //default value: %1", _value];
    if(count _values > 0) then {
        diag_log text format ["    //values: %1", _values];
    };
    diag_log text format ["    //client: %1", _isClientSettable];
    diag_log text "};"
};

diag_log text format ["//==   ACE3 %1   ==//", getText (configfile >> "CfgPatches" >> "ace_main" >> "version")];

diag_log text "//======================================//";
diag_log text "//                CLIENT                //";
diag_log text "//======================================//";
diag_log text "";
{
    _x call _fnc_exportSettings;
} foreach _classesClient;
diag_log text "";
diag_log text "//======================================//";
diag_log text "//                CONFIG                //";
diag_log text "//======================================//";
diag_log text "";
{
    _x call _fnc_exportSettings;
} foreach _classesConfig;
hint "gotowe";
