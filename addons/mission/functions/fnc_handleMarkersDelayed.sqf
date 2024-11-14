#include "script_component.hpp"
/*
 * Author: Krzyciu
 * Removes local markers which were not created by player
 */

LOG("removeNonlocalMarkers");
private _markerToCheck = "";
private _markerArray = [];
private _playerID = getPlayerID ace_player;
private _markerID = 0;

private _briefingMarkers = missioNamespace getVariable [QGVAR(briefingMarkers), []];
private _markersToIterate = allMapMarkers - _briefingMarkers;
{
  _markerToCheck = _x;
  _markerArray = toArray _x;
  _markerArray resize 15;
  if (toString _markerArray == "_USER_DEFINED #") then {
    _markerID = _x splitString "#/";
    _markerID = _markerID select 1;
    if (_markerID isNotEqualTo _playerID) then {
      deleteMarkerLocal _markerToCheck;
    };
  }
} forEach _markersToIterate;

systemChat LLSTRING(Attributes_enableLocalMarkers_IngameTooltip);
