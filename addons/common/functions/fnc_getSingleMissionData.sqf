/*
 * Author: SzwedzikPL
 * Get single mission data
 */
#include "script_component.hpp"

params ["_dataType"];

if (_dataType == "missionname") exitWith {
    private _missionName = briefingName;
    if (_missionName == "") then {_missionName = missionName;};
    _missionName
};

if (_dataType == "missionmap") exitWith {
    private _missionMap = getText (configFile >> "cfgWorlds" >> worldName >> "description");
    _missionMap
};

if (_dataType == "missionauthor") exitWith {
    private _missionAuthor = "Scenario" get3DENMissionAttribute "Author";
    _missionAuthor
};

if (_dataType == "missionid") exitWith {
    0
};
