#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Shows notification for 3DEN dynamicClassSelect
 */

params [["_playSound", true], ["_notificationBar", controlNull]];

if (_playSound) then {
  playsound ["3DEN_notificationDefault", true];
};

// Show notification about added unit on given notification bar
if !(isNull _notificationBar) then {
  private _prevFadeSpawn = _notificationBar getVariable [QGVAR(fadeSpawn), scriptNull];
  terminate _prevFadeSpawn;

  _notificationBar ctrlSetText format ["Dodano %1 do listy", _displayName];

  _notificationBar ctrlSetFade 0;
  _notificationBar ctrlCommit 0;

  private _fadeSpawn = _notificationBar spawn {
    uiSleep 0.5;
    _this ctrlSetFade 1;
    _this ctrlCommit 1.5;
  };

  _notificationBar setVariable [QGVAR(fadeSpawn), _fadeSpawn];
};
