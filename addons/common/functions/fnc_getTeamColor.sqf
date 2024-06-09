#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns team color
 */

params ["_team"];

private _color = switch (toUpper _team) do {
    case "RED": {
      [[1.00, 0.37, 0.37], '#ff5e5e']
    };
    case "GREEN": {
      [[0.37, 1.00, 0.37], '#5eff5e']
    };
    case "BLUE": {
      [[0.37, 0.37, 1.00], '#5e5eff']
    };
    case "YELLOW": {
      [[1.00, 1.00, 0.37], '#ffff5e']
    };
    default {
      [[1.00, 1.00, 1.00], '#ffffff']
    };
};

_color
