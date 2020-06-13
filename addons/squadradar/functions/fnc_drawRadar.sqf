#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles RscRadar map draw event
 */

params ["_control"];

private _playerDir = getDir ace_player;

{
  private _distance = _x distance2D ace_player;
  if (_distance < RADAR_MAX_UNIT_DISTANCE) then {
    private _opacity = linearConversion [RADAR_FADE_MIN_UNIT_DISTANCE, RADAR_MAX_UNIT_DISTANCE, _distance, 1, 0, true];

    private _icon = "a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";

    if (_x getVariable [QEGVAR(nametags,isSpeaking), false]) then {
      _icon = "\a3\ui_f\data\igui\rscingameui\rscdisplaychannel\mutevon_ca.paa";
    };

    _control drawIcon [
      _icon,
      [1, 1, 1, _opacity],
      position _x,
      18,
      18,
      (getDir _x) - _playerDir,
      ""
    ];
  };
} forEach allUnits; //DEBUG!
