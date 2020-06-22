/*
 * Author: SzwedzikPL
 * Get actual mission data
 */
#include "script_component.hpp"

private _missionName = briefingName;
if (_missionName == "") then {_missionName = missionName;};

private _missionMap = getText (configFile >> "cfgWorlds" >> worldName >> "description");

private _missionAuthor = getMissionConfigValue ["Author", "Nie podano"];

[_missionName, _missionMap, _missionAuthor];
