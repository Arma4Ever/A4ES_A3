#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(uniqueMapsDisabled) = getMissionConfigValue [QGVAR(disableUniqueMaps), false];

if (GVAR(uniqueMapsDisabled)) exitWith {ADDON = true;};

if (isServer) then {
  GVAR(maps) = createHashMap;

  [QGVAR(requestUniqueMap), {
    params ["_target", "_originalMap"];

    private _map = 0 call FUNC(getNewUniqueMap);
    [QGVAR(requestedUniqueMap), [_map, _originalMap], _target] call CBA_fnc_targetEvent;
  }] call CBA_fnc_addEventHandler;

  [QGVAR(requestUniqueMapMarkers), {
    params ["_target", "_map"];

    private _markers = GVAR(maps) getOrDefault [_map, createHashMap];

    [QGVAR(requestedUniqueMapMarkers), [_map, _markers], _target] call CBA_fnc_targetEvent;
  }] call CBA_fnc_addEventHandler;
};


if !(hasInterface) exitWith {};

GVAR(currentMap) = "";
GVAR(currentMapPreview) = "";
GVAR(isCurrentMapUnique) = false;
GVAR(currentMapMarkers) = createHashMap;
GVAR(currentMapChanges) = [[], []];

/*
[QGVAR(updateMapPreview), {
  params ["_map", "_marker", "_data"];

  if (_data isEqualTo []) then {
    deleteMarkerLocal _marker;
  } else {
    // Create or update given marker
  };

  // Update map preview if ??????
}] call CBA_fnc_addEventHandler;
*/

[QGVAR(requestedUniqueMap), {
  params ["_map", "_originalMap"];

  // Exit if no more unique maps - from this point map will behave as vanilla one
  if (_map isEqualTo "") exitWith {};

  // Exit if current map already changed
  if (GVAR(currentMap) isNotEqualTo _originalMap) exitWith {};

  // Switch to new map - this should happen before item replacement
  // Item replacement will trigger loadout player event - this way it will
  // request markers for newly created map which is pointless
  GVAR(currentMap) = _map;
  GVAR(currentMapMarkers) = createHashMap;
  GVAR(isCurrentMapUnique) = true;

  // Replace map item
  player linkItem _map;
}] call CBA_fnc_addEventHandler;

[QGVAR(requestedUniqueMapMarkers), {
  params ["_map", "_markers"];

  // Exit if current map already changed
  if (GVAR(currentMap) isNotEqualTo _map) exitWith {};

  GVAR(currentMapMarkers) = _markers;
  [_markers] call FUNC(applyMapMarkers);
}] call CBA_fnc_addEventHandler;

["loadout", {
  params ["_unit", "_newLoadout"];

  // Ignore curator remote controlled units
  // Don't create unique map each time curator takes control of some AI unit
  if (_unit isNotEqualTo player) exitWith {};

  private _currentMap = _unit call FUNC(getAssignedMap);

  if (GVAR(currentMap) isNotEqualTo _currentMap) then {
    GVAR(currentMap) = _currentMap;

    // Map changed - clear map
    0 call FUNC(clearCurrentMap);

    // There's no new map - exit
    if (_currentMap isEqualTo "") exitWith {};

    // New map is unique - request map markers from server
    if (_currentMap call FUNC(isUniqueMap)) exitWith {
      GVAR(isCurrentMapUnique) = true;
      [QGVAR(requestUniqueMapMarkers), [player, _currentMap]] call CBA_fnc_serverEvent;
      // Request markers for this map
    };

    // New map is not unique - request unique map from server
    GVAR(isCurrentMapUnique) = false;
    // Request unique map
    [QGVAR(requestUniqueMap), [player, _currentMap]] call CBA_fnc_serverEvent;
  };
}] call CBA_fnc_addPlayerEventHandler;

["visibleMap", {
  params ["_unit", "_visibleMap"];

  if !(GVAR(isCurrentMapUnique)) exitWith {};

  if (_visibleMap) then {
    // Record for changes
    GVAR(currentMapChanges) = [[], []];
  } else {
    // Save changess
    GVAR(currentMapChanges) params ["_addedMarkers", "_removedMarkers"];

    // Update currentMapMarkers
    // Send update to server
  };
}] call CBA_fnc_addPlayerEventHandler;


addMissionEventHandler ["MarkerCreated", {
  params ["_marker", "", "_owner"];

  // Exit if not unique map
  if !(GVAR(isCurrentMapUnique)) exitWith {};

  // Exit if marker is scripted/remote
  if !(_owner isEqualTo player) exitWith {};

  // Save polyline marker
  // Note: Icon markers are handled via markersPLaced ace event
  if ((markerShape _marker) isEqualTo "POLYLINE") then {
    // Make local copy
    if (_marker call FUNC(replaceMarkerAsLocal)) then {
      // Save changes for update
      (GVAR(currentMapChanges) # 0) pushBack _marker;
    };
  };
}];

addMissionEventHandler ["MarkerDeleted", {
  params ["_marker"];

  // Exit if not unique map
  if !(GVAR(isCurrentMapUnique)) exitWith {};

  GVAR(currentMapChanges) params ["_addedMarkers", "_removedMarkers"];

  // Check if removed marker was created during current map opening
  private _addedIndex = _addedMarkers find _marker;
  if (_addedIndex isNotEqualTo -1) exitWith {
    _addedMarkers deleteAt _addedIndex;
  };

  // Check if removed marker is marker from unique map
  if (_marker in GVAR(currentMapMarkers)) then {
    _removedMarkers pushBack _marker;
  };
}];

[QACEGVAR(markers,markerPlaced), {
  params ["_marker", "", ["_markerData", []]];

  // Exit if current map not unique
  if !(GVAR(isCurrentMapUnique)) exitWith {};

  // Make local copy
  if ([_marker, _markerData] call FUNC(replaceMarkerAsLocal)) then {
    // Save changes for update
    (GVAR(currentMapChanges) # 0) pushBack _marker;
  };
}] call CBA_fnc_addEventHandler;

ADDON = true;
