#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Switches on/off lights assigned to given module
 */

params ["_logic", "_mode"];

private _lamps = _logic getVariable [QGVAR(lamps), []];

// Select dmg level
private _damage = [0, 0.95] select _mode;

// Prep switch function
private _switchFnc = {
  private _lamp = _this # 0;
  if ((damage _lamp) < 1) then {
    {
      if ((_lamp getHitIndex _x) < 1) then {
        _lamp setHitIndex [_x, _damage, true];
      };
    } forEach (_this # 1);
  };
};

private _segments = _logic getVariable [QGVAR(segments), false];

if (_segments) then {
  private _segmentSize = _logic getVariable [QGVAR(segmentSize), 1];
  private _segmentDelay = _logic getVariable [QGVAR(segmentDelay), 1];
  private _counter = 0;
  {
    _x call _switchFnc;
    _counter = _counter + 1;
    if (_counter >= _segmentSize) then {
      _counter = 0;
      sleep _segmentDelay;
    };
  } forEach _lamps;
} else {
  {_x call _switchFnc} forEach _lamps;
};
