#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Plays sound based on module attributes
 */

params ["_logic", ["_playSound", false]];
TRACE_2("modulePLaySound",_logic,_playSound);

// Read module playSound attribute, _playSound is used as default because
// playSound module does not have this attribute
_playSound = _logic getVariable [QGVAR(playSound), _playSound];

if (!_playSound) exitWith {
  TRACE_2("modulePLaySound - abort, playing sound disabled",_logic,_playSound);
};

private _filePath = _logic getVariable [QGVAR(soundFilePath), ""];
if (_filePath isEqualTo "") exitWith {
  ERROR_2("%1 [%2] - abort modulePLaySound, empty file path",str _logic,typeOf _logic);
};

private _soundSource = missionNamespace getVariable [_logic getVariable [QGVAR(soundSource), ""], objNull];
if (
  !(_soundSource isEqualType objNull) ||
  {isNull _soundSource}
) exitWith {
  ERROR_4("%1 [%2] - abort modulePLaySound, wrong sound source (%3 [%4])",str _logic,typeOf _logic,str _soundSource,typeOf _soundSource);
};

if (_logic getVariable [QGVAR(soundFromMission), false]) then {
  _filePath = getMissionPath _filePath;
};

private _soundParams = [
  _filePath,
  _soundSource,
  _logic getVariable [QGVAR(soundIsInside), false],
  getPosASL _soundSource,
  _logic getVariable [QGVAR(soundVolume), 1],
  _logic getVariable [QGVAR(soundPitch), 1],
  _logic getVariable [QGVAR(soundDistance), 100],
  _logic getVariable [QGVAR(soundOffset), 0]
];

private _execParams = _soundParams;
private _exec = {playSound3D _this;};

if (_logic getVariable [QGVAR(soundRepeat), false]) then {
  private _repeatMode = _logic getVariable [QGVAR(soundRepeatMode), 0];
  private _repeatDelay = _logic getVariable [QGVAR(soundRepeatDelay), 0];

  // Count
  if (_repeatMode isEqualTo 0) exitWith {
    _execParams = [
      _logic getVariable [QGVAR(soundRepeatCount), 2],
      _repeatDelay,
      _soundParams
    ];
    _exec = {
      _this spawn {
        params ["_count", "_delay", "_soundParams"];
        for "_i" from 1 to _count do {
          playSound3D _soundParams;
          sleep _delay;
        };
      };
    };
  };
  // Condition
  if (_repeatMode isEqualTo 1) exitWith {
    _execParams = [
      compile (_logic getVariable [QGVAR(soundRepeatCondition), "true"]),
      _repeatDelay,
      _soundParams
    ];
    _exec = {
      params ["_condition", "_delay", "_soundParams"];

      if !(0 call _condition) exitWith {
        TRACE_3("Aborting modulePlaySound, false condition",_condition,_delay,_soundParams);
      };

      // First run
      playSound3D _soundParams;

      TRACE_3("Adding modulePlaySound PFH",_condition,_delay,_soundParams);
      [{
        params ["_params", "_handle"];

        if !(0 call (_params # 0)) exitWith {
          TRACE_1("Removing modulePlaySound PFH",_params);
          [_handle] call CBA_fnc_removePerFrameHandler;
        };

        playSound3D (_params # 1);
      }, _delay, [_condition, _soundParams]] call CBA_fnc_addPerFrameHandler;
    };
  };
};

private _delay = _logic getVariable [QGVAR(playSoundDelay), 0];
[_exec, _execParams, _delay] call CBA_fnc_waitAndExecute;
