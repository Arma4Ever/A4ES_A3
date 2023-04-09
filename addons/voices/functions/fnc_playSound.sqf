#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Plays unit voice sound of given type
 */

params ["_unit", "_soundType"];

// Disable speaking if invalid/muted speaker
private _speaker = speaker _unit;
if (toLower _speaker in ["", "novoice", "ace_novoice", "fow_mute", "vie", "mute"]) exitWith {
  _unit setVariable [QGVAR(speakingDisabled), true];
};

private _sounds = GVAR(voiceLinesData) get _soundType;
// Exit if invalid sound type
if (isNil "_sounds") exitWith {};

private _voiceLine = "ReloadingE";
if (_soundType != "reloading") then {
	private _lastLine = _unit getVariable [QGVAR(lastVoiceLine), ""];
	_voiceLine = selectRandom (_sounds - [_lastLine]);
  _unit setVariable [QGVAR(lastVoiceLine), _voiceLine];
};

private _speakerVoiceLine = _speaker + _voiceLine;
private _voiceLinePaths = GVAR(speakerVoiceLinesCache) getOrDefaultCall [_speakerVoiceLine, {
  [_speaker, _voiceLine] call FUNC(getVoiceLinePaths)
}, true];

// Voice lines paths empty, disable speaking
if (_voiceLinePaths isEqualTo []) exitWith {
  _unit setVariable [QGVAR(speakingDisabled), true];
};

// Mark as speaking (prevents repetition)
_unit setVariable [QGVAR(isSpeaking), true];
[{_this setVariable [QGVAR(isSpeaking), false]}, _unit, random [5, 10, 15]] call CBA_fnc_waitAndExecute;

// Play voice line globally
[QGVAR(playVoiceLine), [_unit, selectRandom _voiceLinePaths]] call CBA_fnc_globalEvent;
