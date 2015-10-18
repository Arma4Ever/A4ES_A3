/*
 * Author: SzwedzikPL
 *
 * Return mission data
 */
#include "script_component.hpp"

private ["_map", "_missionName", "_missionID", "_missionData"];

_map = getText (configFile >> "cfgWorlds" >> worldName >> "description");

_missionName = getText (missionConfigFile >> "onLoadName");
if(_missionName == "") then {
    _missionName = briefingName;
};

_missionID = getNumber (missionConfigFile >> "missionID");

_missionData = [_map, _missionName, _missionID];

_missionData
