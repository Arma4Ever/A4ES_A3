#include "\z\ace\addons\microdagr\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Get marker type & color
 */

if !(ace_player getVariable [QGVAR(receivePos), false]) exitWith {
  [GVAR(receivePFH)] call CBA_fnc_removePerFrameHandler;
  GVAR(receivePFH) = -1;
  {deleteMarkerLocal _x} forEach GVAR(receiveMarkers);
};

private _receiveMarkers = GVAR(receiveMarkers);
{deleteMarkerLocal _x} forEach _receiveMarkers;
_receiveMarkers = [];

private _units = (playableUnits + switchableUnits) select {(_x getVariable [QGVAR(broadcastPos), false]) && (alive _x)};
private _index = 0;
private _alpha = parseNumber (GVAR(showMicrodagrMarkersOnMap) || !visibleMap);

GVAR(receiveMarkers) = _units apply {
  _index = _index + 1;
  if ((_x getVariable [QGVAR(markerIdCache), -1]) != (_x getVariable [QGVAR(broadcastMarkerId), -1])) then {
    private _markerId = _x getVariable [QGVAR(broadcastMarkerId), -1];
    private _markerData = _markerId call FUNC(getMarkerData);

    _x setVariable [QGVAR(markerIdCache), _markerId];
    _x setVariable [QGVAR(markerTypeCache), _markerData # 1];
    _x setVariable [QGVAR(markerColorCache), (_markerData # 2) # 1];
  };

  private _marker = createMarkerLocal [format [QGVAR(marker_%1), _index], position (vehicle _x)];

  if (_x getVariable ["A4ES_simpleGPSOn", false]) then {
    _marker setMarkerTypeLocal (_x getVariable [QGVAR(markerTypeCache), "Contact_dot1"]);
    _marker setMarkerColorLocal (_x getVariable [QGVAR(markerColorCache), "ColorWEST"]);
    _marker setMarkerTextLocal (_x getVariable [QGVAR(broadcastMarkerTitle), ""]);
  } else {
    _marker setMarkerTypeLocal (_x getVariable [QGVAR(markerTypeCache), "b_unknown"]);
    _marker setMarkerColorLocal (_x getVariable [QGVAR(markerColorCache), "ColorWEST"]);
    _marker setMarkerTextLocal (_x getVariable [QGVAR(broadcastMarkerTitle), ""]);
  };

  _marker setMarkerAlphaLocal _alpha;

  _marker
};
