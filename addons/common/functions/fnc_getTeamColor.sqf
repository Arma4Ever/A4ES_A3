#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns team color
 */

params ["_team"];

private _color = switch (_team) do {
    case "RED": {
      [[1.00, 0.67, 0.67], '#ffabab']
    };
    case "GREEN": {
      [[0.67, 1.00, 0.67], '#abffab']
    };
    case "BLUE": {
      [[0.67, 0.67, 1.00], '#ababff']
    };
    case "YELLOW": {
      [[1.00, 1.00, 0.67], '#ffffab']
    };
    default {
      [[1.00, 1.00, 1.00], '#ffffff']
    };
};

_color
