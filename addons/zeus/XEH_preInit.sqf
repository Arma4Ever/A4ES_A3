#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(curators) = [];
GVAR(curatorGroup) = grpNull;
GVAR(playersIconsDraw) = -1;

GVAR(showPlayerIcons) = false;
GVAR(drawPlayersCache) = [];
GVAR(drawPlayersLastCacheRefresh) = DRAWPLAYERSICONS_CACHE_LIFETIME * -1;

// Add objects/group placed by curator to all curators
["ModuleCurator_F", "InitPost", {
  params ["_curator"];
  _curator addEventHandler ["CuratorObjectPlaced", {
    params ["", "_object"];
    [QGVAR(addObjects), [_object]] call CBA_fnc_serverEvent;
  }];
  _curator addEventHandler ["CuratorGroupPlaced", {
    params ["", "_group"];
    _group deleteGroupWhenEmpty true;
    [QGVAR(addObjects), units _group] call CBA_fnc_serverEvent;
  }];
}] call CBA_fnc_addClassEventHandler;

if (isServer) then {
  // Server curator init
  [{
    ["ModuleCurator_F", "initPost", {
      _this call FUNC(initCurator);
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  }, [], 0.5] call CBA_fnc_waitAndExecute;

  // CBA Events
  [QGVAR(addObjects), {
    {
      _x addCuratorEditableObjects [_this, true];
    } forEach allCurators;
  }] call CBA_fnc_addEventHandler;

  // Create curator on demand
  [QGVAR(zeusAssign), {
    params ["_unit"];
    if !(isPlayer _unit) exitWith {};

    LOG_1("Assigning Zeus to '%1'",_unit);

    private _curatorModule = [_unit] call FUNC(getFreeCuratorModule);
    unassignCurator getAssignedCuratorLogic _unit;

    // Curator unassign can take a moment, add delay
    [{
      params ["_unit", "_curatorModule"];
      _unit assignCurator _curatorModule;
      [QGVAR(zeusAssigned), _curatorModule, _unit] call CBA_fnc_targetEvent;
    }, [_unit, _curatorModule], 5] call CBA_fnc_waitAndExecute;
  }] call CBA_fnc_addEventHandler;

  // Unassign curator on demand
  [QGVAR(zeusUnassign), {
    params ["_unit"];
    if !(isPlayer _unit) exitWith {};

    LOG_1("Unassigning Zeus from '%1'", _unit);

    private _curatorModule = getAssignedCuratorLogic _unit;
    if (_curatorModule isEqualTo objNull) exitWith {};
    unassignCurator _curatorModule;
  }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
  [QGVAR(zeusAssigned), {
    systemChat localize LSTRING(Activated);
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
