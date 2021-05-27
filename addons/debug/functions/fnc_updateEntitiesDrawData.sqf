#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates entities data for map debug draw
 */

// Do not update if map not visible
if !(visibleMap) exitWith {};

private _entitiesData = [];
private _vehicles = [];
private _sides = [west, east, independent, civilian];
private _sideColors = [
  [west, false] call BIS_fnc_sideColor,
  [east, false] call BIS_fnc_sideColor,
  [independent, false] call BIS_fnc_sideColor,
  [civilian, false] call BIS_fnc_sideColor
];

{
  if !((side (group _x)) in _sides) then {continueWith false};

  private _entity = _x;
  private _group = group _entity;
  private _waypointsData = [];
  if ((leader _group) isEqualTo _entity && {_entity isNotEqualTo player}) then {
    private _waypoints = waypoints _group;
    if (_waypoints isNotEqualTo []) then {
      private _currentWaypoint = currentWaypoint _group;
      {
        if ((_x # 1) >= _currentWaypoint) then {
          _waypointsData pushBack (waypointPosition _x);
        };
      } forEach _waypoints;
    } else {
      private _dest = expectedDestination _x;
      if ((_dest # 1) isNotEqualTo "DoNotPlan") then {
        _waypointsData pushBack (_dest # 0);
      };
    };
  };

  private _color = +(_sideColors select (_sides find (side _group)));
  if !(simulationEnabled _entity) then {
    _color set [3, 0.4];
  };

  private _icon = "";
  private _parent = objectParent _x;

  if (isNull _parent) then {
    _icon = getText ((configOf _entity) >> "icon");
  } else {
    if !(_parent in _vehicles) then {
      _icon = getText ((configOf _parent) >> "icon");
      _vehicles pushBack _parent;
      _entity = _parent;
    };
  };

  _entitiesData pushBack [
    _entity,
    _icon,
    _color,
    _waypointsData
  ];
} forEach allUnits;

GVAR(entitiesDrawData) = _entitiesData;
