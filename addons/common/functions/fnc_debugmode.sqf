/*
 * Author: SzwedzikPL
 * Simple debug script
 */
#include "script_component.hpp"

0 spawn {
    if(!isNil "a3cs_debug") exitWith {};

    a3cs_debug = true;
    a3cs_debug_pos = [0,0,0];
    a3cs_debug_markers = false;
    a3cs_debug_3d = false;
    a3cs_debug_units = [];
    a3cs_debug_3d_id = -1;
    a3cs_debug_max_distance = 250;
    a3cs_debug_3d_iconSize = 5;

    private _markers = [];
    private _meMarker = "";

    ["a3cs_debugmode", "onMapSingleClick", {a3cs_debug_pos = _pos;}] call BIS_fnc_addStackedEventHandler;

    a3cs_debug_3d_id = addMissionEventHandler ["Draw3D", {
        if(!a3cs_debug_3d) exitWith {};
        {
            private _color = [side group _x] call BIS_fnc_sideColor;
            private _sizeByDistance = ((a3cs_debug_3d_iconSize + 1) - ((ace_player distance _x) / (a3cs_debug_max_distance / a3cs_debug_3d_iconSize)));
            drawIcon3D ["a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa", _color, ((position _x) vectorAdd [0,0,0.5]), _sizeByDistance, _sizeByDistance, 0, "", 1, 0.05, "PuristaMedium"];
        } forEach a3cs_debug_units;
    }];

    private _lastUnitsRefreshTime = 0;
    private _debugMarkers = [];

    while {alive player} do {
        if(a3cs_debug_markers) then {
            {deleteMarkerLocal _x;} forEach _debugMarkers;
            {
                private _marker = createMarkerLocal [str _x, position _x];
                _marker setMarkerTypeLocal "mil_triangle";
                _marker setMarkerColorLocal ([[side group _x, true] call BIS_fnc_sideColor, "ColorBlue"] select (_x == player));
                _marker setMarkerSizeLocal [1, 1];
                _marker setMarkerDirLocal (getDir _x);
                _debugMarkers pushback _marker;
            } forEach a3cs_debug_units;
        };
        if((a3cs_debug_markers || a3cs_debug_3d) && {(time - _lastUnitsRefreshTime) > 5}) then {
            _lastUnitsRefreshTime = time;
            a3cs_debug_units = (ace_player nearEntities ["Man", a3cs_debug_max_distance]);
        };
        sleep 1;
    };

    a3cs_debug = false;
    removeMissionEventHandler ["Draw3D", a3cs_debug_3d_id];
};
