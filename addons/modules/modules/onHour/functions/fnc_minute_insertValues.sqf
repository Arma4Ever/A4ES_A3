#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for onHour minute attribute
 */

private _hours = [];

for "_i" from 1 to 59 do {
  _hours pushBack [
    if (_i < 10) then {"0" + str _i} else {str _i},
    _i
  ]
};

_hours
