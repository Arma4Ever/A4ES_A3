#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows prep for unlock message
 */

params ["_unit"];
TRACE_1("prepForUnlock",_unit);

if (_unit != player) exitWith {};

0 spawn {
  private _endTime = CBA_missionTime + 15;
  private _text = "<t size='2.5' font='RobotoCondensedBold'>" + LLSTRING(Prepare) + "</t><br /><br />
  <t size='1.7'>" + LLSTRING(UnlockTimeInfo) + "</t><br /><t size='2' font='RobotoCondensedBold'>";

  waitUntil {
    private _secondsLeft = (_endTime - CBA_missionTime) max 0;
    titleText [
      _text + ((_secondsLeft toFixed 2)) + "s</t>",
      "PLAIN", 0.001, true, true
    ];
    _secondsLeft <= 0
  };

  titleFadeOut 0.01;
};
