#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates radar dialog data
 */

params ["_data", "_updateTime"];
TRACE_1("updateRadarDialog",_updateTime);

private _display = uiNamespace getVariable [QGVAR(radarDialogDisplay), displayNull];
if (isNull _display) exitWith {};

private _ctrlList = _display displayCtrl IDC_RADARDIALOG_LIST;
private _ctrlStatus = _display displayCtrl IDC_RADARDIALOG_STATUS;

// Update list
lnbClear _ctrlList;
_ctrlList lnbAddRow [
  LLSTRING(RadarDialog_Id),
  LLSTRING(RadarDialog_Type),
  LLSTRING(RadarDialog_Dir),
  LLSTRING(RadarDialog_DistTraveled),
  LLSTRING(RadarDialog_Status)
];

for "_i" from 0 to 4 do {
  _ctrlList lnbSetColor [[0, _i], [1,1,1,0.8]];
};

private _statusOptions = [LLSTRING(RadarDialog_Status_Active), LLSTRING(RadarDialog_Status_Inctive)];

{
  _x params ["_id", "_type", "_dir", "_distance", "_isNull"];
  if (_type == "") then {_type = LLSTRING(Unknown);};
  _ctrlList lnbAddRow ["#" + _id, _type, _dir, _distance + "m", _statusOptions select _isNull];
} forEach _data;

// Start new timer
terminate GVAR(radarDialogUpdateTimer);
GVAR(radarDialogUpdateTimer) = [_ctrlStatus, _updateTime] spawn {
  params ["_ctrlStatus", "_updateTime"];

  while {!(isNull _ctrlStatus)} do {
    private _seconds = floor (CBA_missionTime - _updateTime);

    private _minutes =  floor (_seconds / 60);
    _seconds = _seconds - (_minutes * 60);

    private _time = (str _seconds) + "s";
    if (_minutes > 0) then {
      _time = (str _minutes) + "m " + _time;
    };

    _ctrlStatus ctrlSetText format [LLSTRING(LastUpdateTime), _time];

    sleep 1;
  };
};
