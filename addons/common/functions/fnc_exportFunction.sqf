/*
 * Author: SzwedzikPL
 * Exports preprocessed function code
 */
#include "script_component.hpp"

params ["_function"];

#define UTF8_EOL 10



/*
//filter tabs
private _codeArray = toArray str _function;
private _codeLines = [];
private _codeLine = [];
{
    if (_x == UTF8_EOL) then {
        private _oneBefore = (_codeArray select (_forEachIndex-1));
        if (_oneBefore == UTF8_EOL) then {
            private _twoBefore = (_codeArray select (_forEachIndex-2));
            if (_twoBefore != UTF8_EOL) then {
                _codeLine pushBack _x;
            };
        } else {
            _codeLine pushBack _x;
        };
        //Break line
        _codeLines pushBack _codeLine;
        _codeLine = [];
    } else {
        _codeLine pushBack _x;
    };
} foreach _codeArray;
_codeArray = nil;
_codeLine = nil;

{"ace_clipboard" callExtension (toString _x);} foreach _codeLines;
"ace_clipboard" callExtension "--COMPLETE--";
*/
