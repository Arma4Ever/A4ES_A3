/*
 * Author: SzwedzikPL
 * Updates admin panel mission data
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\admin\ui\idcAdminPanel.hpp"

disableSerialization;
private _display = uiNamespace getVariable ["A3CS_adminPanel", displayNull];
if (isNull _display) exitWith {[_this select 1] call CBA_fnc_removePerFrameHandler;};

private _controlList = (_display displayCtrl IDC_ADMINPANEL_MISSIONDATATEXT);
lnbClear _controlList;
_missionConstData = missionNamespace getVariable [QGVAR(missionConstData), []];

if ((count _missionConstData) isEqualTo 0) then {
    //first run, collect constant data
    private _basicData = call FUNC(getMissionData);
    _basicData params ["_missionName", "_missionMap", "_missionAuthor"];
    _missionConstData pushBack [localize LSTRING(MissionData_MissionName), _missionName];
    _missionConstData pushBack [localize LSTRING(MissionData_MissionAuthor), _missionAuthor];
    _missionConstData pushBack [localize LSTRING(MissionData_MapName), _missionMap];
    missionNamespace setVariable [QGVAR(missionConstData), _missionConstData];
};

_missionConstData params ["_missionName", "_missionAuthor", "_missionMap"];
private _missionData = [];

_missionData pushBack _missionName;
_missionData pushBack _missionAuthor;
_missionData pushBack _missionMap;

_missionTime = time call FUNC(secondsToTime);
_missionData pushBack [localize LSTRING(MissionData_TimeElapsed), _missionTime];

if (isMultiplayer) then {
    private _players = count (allPlayers - entities "HeadlessClient_F");
    private _slots = count playableUnits;
    private _admins = count (false call FUNC(getOnlineAdmins));
    private _serverAdmin = missionNamespace getVariable [QGVAR(serverAdmin), objNull];
    private _serverAdminName = _serverAdmin call EFUNC(common,getUnitName);
    if (isNull _serverAdmin || !(isPlayer _serverAdmin)) then {_serverAdminName = localize ELSTRING(common,None);};
    _missionData pushBack [localize LSTRING(MissionData_Slots), format ["%1/%2", _players, _slots]];
    _missionData pushBack [localize LSTRING(MissionData_OnlineAdmins), str _admins];
    _missionData pushBack [localize LSTRING(MissionData_ServerAdmin), _serverAdminName];
};

private _index = 0;
{_index = _controlList lnbAddRow _x;} forEach _missionData;
