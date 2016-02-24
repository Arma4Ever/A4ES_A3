/*
 * Author: SzwedzikPL
 * Convert seconds to proper time string
 */
#include "script_component.hpp"

params [["_seconds", 0, [0]], ["_format", "HH:MM:SS", [""]]];

_seconds = floor _seconds;
private _minutes =  floor (_seconds / 60);
_seconds = _seconds - (_minutes * 60);
private _hours = floor (_minutes / 60);
_minutes = _minutes - (_hours * 60);

if(_seconds < 10) then {_seconds = format ["0%1",_seconds];};
if(_minutes < 10) then {_minutes = format ["0%1",_minutes];};
if(_hours < 10) then {_hours = format ["0%1",_hours];};

if (_format isEqualTo "HH") exitWith {_hours};
if (_format isEqualTo "HH:MM") exitWith {[_hours, _minutes] joinString ":"};
if (_format isEqualTo "HH:MM:SS") exitWith {[_hours, _minutes, _seconds] joinString ":"};
