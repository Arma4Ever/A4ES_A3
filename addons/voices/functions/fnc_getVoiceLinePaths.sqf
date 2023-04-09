#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK, Diwako
 * Handles fired event
 */

params ["_speaker", "_voiceLine"];

private _speakerCfg = configFile >> "CfgVoice" >> _speaker;

private _dirPath = (getArray (_speakerCfg >> "directories")) param [0, ""];
if (_dirPath isEqualTo "") exitWith {[]};

// Remove leading slash
if ((_dirPath select [0, 1]) isEqualTo "\") then {
  _dirPath = _dirPath select [1];
};

private _protocolWordsCfg = configFile >> (getText (_speakerCfg >> "protocol")) >> "Words";
private _protocolSoundsList = getArray (_protocolWordsCfg >> "Combat" >> _voiceLine);

// If combat version is missing, try normal
if (_protocolSoundsList isEqualTo []) then {
  _protocolSoundsList = getArray (_protocolWordsCfg >> "Normal" >> _voiceLine);
};

// If still nothing, give up
if (_protocolSoundsList isEqualTo []) exitWith {[]};

_protocolSoundsList apply {_dirPath + _x};
