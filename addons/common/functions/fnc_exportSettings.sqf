/*
 * Author: SzwedzikPL
 * Exports all ACE settings
 */
#include "script_component.hpp"

private _configs = "true" configClasses (configFile >> "ACE_Settings");
{
     private _config = _x;
     private _class = configName _config;
     //typeName
     private _typeName = getText (_config >> "typeName");
     //value
     private _value = 0;
     if(isNumber (_config >> "value")) then {_value = getNumber (_config >> "value");};
     if(isText (_config >> "value")) then {_value = getText (_config >> "value");};
     if(isArray (_config >> "value")) then {_value = getArray (_config >> "value");};
     //isClientSettable
     private _isClientSettable = getNumber (_config >> "isClientSettable");
     //values
     private _values = getArray (_config >> "values");
     if(count _values > 0) then {_values = format ["
     values[] = %1;", _values];} else {_values = "";};

     private _compiledConfigEntry = format ["
class %1 {
    typeName = %2;
    value = %3;
    isClientSettable = %4;%5
};", _class, _typeName, _value, _isClientSettable, _values];

    "ace_clipboard" callExtension _compiledConfigEntry;
} foreach _configs;

"ace_clipboard" callExtension "--COMPLETE--";
hint "gotowe";
