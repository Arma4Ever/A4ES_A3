/*
 * Author: PabstMirror
 * Handles the draw event from all 3 maps (compass + 2 minimaps)
 *
 * Arguments:
 * 0: The Map <CONTROL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [compassMap] call ace_microdagr_fnc_mapOnDrawEH
 *
 * Public: No
 */
#include "\z\ace\addons\microdagr\functions\script_component.hpp"

PARAMS_1(_theMap);

private ["_mapSize", "_waypoints", "_size", "_targetPos", "_relBearing", "_wpName", "_wpPos", "_alpha"];

_mapSize = (ctrlPosition _theMap) select 3;

_waypoints = [] call FUNC(deviceGetWaypoints);

if (GVAR(currentApplicationPage) == 1) then {
    _theMap ctrlMapAnimAdd [0, DUMMY_ZOOM, DUMMY_POS];
    ctrlMapAnimCommit _theMap;
    _size = 412 * _mapSize;
    _theMap drawIcon [QUOTE(PATHTO_R(images\compass_starInverted.paa)), [1,1,1,1], DUMMY_POS, _size, _size, (-1 * (getDir ace_player)), '', 0 ];
    _theMap drawIcon [QUOTE(PATHTO_R(images\compass_needle.paa)), [0.533,0.769,0.76,1], DUMMY_POS, _size, _size, 0, '', 0 ];

    if (GVAR(currentWaypoint) != -1) then {
        _targetPos = [];
        if (GVAR(currentWaypoint) == -2) then {
            if ((count GVAR(rangeFinderPositionASL)) == 3) then {
                _targetPos = GVAR(rangeFinderPositionASL);
            };
        } else {
            if (GVAR(currentWaypoint) < (count _waypoints)) then {
                _targetPos = (_waypoints select GVAR(currentWaypoint)) select 1;
            };
        };
        if ((count _targetPos) == 3) then {
            _relBearing = [ace_player, _targetPos] call BIS_fnc_relativeDirTo;
            _theMap drawIcon [QUOTE(PATHTO_R(images\compass_needle.paa)), [1,0.564,0.564,1], DUMMY_POS, _size, _size, _relBearing, '', 0 ];
        };
    };

} else { //Map Mode:
    if (GVAR(mapAutoTrackPosition)) then {
        _theMap ctrlMapAnimAdd [0, (GVAR(mapZoom)/_mapSize), (getPosASL ace_player)];
        ctrlMapAnimCommit _theMap;
    };
    _size = 48 * _mapSize;
    _theMap drawIcon [QUOTE(PATHTO_R(images\icon_self.paa)), [0.533,0.769,0.76,0.75], (getPosASL ace_player), _size, _size, (getDir ace_player), '', 0 ];

    //--- EDIT

    if(GVAR(settingReceiver)) then {
        private ["_markerSize", "_textSize", "_time"];

        _markerSize = 48 * _mapSize;
        _textSize = 0.07 * _mapSize;

        _time = time;
        if(_time - GVAR(mapMarkersLastUpdate) >= GVAR(mapMarkersUpdateInterval)) then {
            private ["_unit", "_markerParams", "_markerName", "_markerData", "_markerPos", "_markerParams"];

            GVAR(mapMarkersLastUpdate) = _time;
            GVAR(mapMarkersCache) = [];
            _units = playableUnits;
            if(!isMultiplayer) then {_units = [ace_player];};
            {
                _unit = _x;
                _markerParams = [];
                //prosty nadajnik
                if(_unit getvariable [QGVAR(simpleTransmitting), false] && GVAR(settingShowAllMarkers)) then {
                    _markerPos = getPosASL _unit;
                    _markerParams = ["a3\ui_f\data\map\Markers\NATO\o_unknown.paa", [0,0,0,0.75], _markerPos, (_markerSize*0.6), (_markerSize*0.6), 0, "", 0, 0, "TahomaB", "right"];
                };
                //microdagr
                if(_unit getvariable [QGVAR(transmitting), false]) then {
                    _markerName = _unit getvariable [QGVAR(transmittingMarkerName), ""];
                    _markerData = [(_unit getvariable [QGVAR(transmittingMarkerIcon), 0]), _unit] call FUNC(getMarker);
                    _markerPos = getPosASL _unit;
                    _markerParams = [(_markerData select 1), (_markerData select 2), _markerPos, _markerSize, _markerSize, 0, _markerName, 0, _textSize, "TahomaB", "right"];
                };
                if(count _markerParams > 0) then {
                    GVAR(mapMarkersCache) pushback _markerParams;
                    _theMap drawIcon _markerParams;
                };
            } foreach _units;
        } else {
            {
                _m = _x;
                if((_m select 0) == "a3\ui_f\data\map\Markers\NATO\o_unknown.paa") then {
                    _m set [3, (_markerSize*0.6)];
                    _m set [4, (_markerSize*0.6)];
                } else {
                    _m set [3, _markerSize];
                    _m set [4, _markerSize];
                };
                _m set [8, _textSize];
                _theMap drawIcon _x;
            } foreach GVAR(mapMarkersCache);
        };
    };

    //--- !EDIT

    if (GVAR(settingShowAllWaypointsOnMap)) then {
        _size = 32 * _mapSize;
        {
            EXPLODE_2_PVT(_x,_wpName,_wpPos);
            _alpha = if (_forEachIndex == GVAR(currentWaypoint)) then {1} else {0.5};
            _theMap drawIcon [QUOTE(PATHTO_R(images\icon_mapWaypoints.paa)), [1,1,1,_alpha], _wpPos, _size, _size, 0, '', 0 ];
        } forEach _waypoints;
    };
};
