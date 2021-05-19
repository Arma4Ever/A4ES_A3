#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Add objects/group placed by curator to all curators
["ModuleCurator_F", "InitPost", {
  params ["_curator"];

  _curator addEventHandler ["CuratorObjectPlaced", {
    params ["", "_object"];
    [QGVAR(addObjects), [_object]] call CBA_fnc_serverEvent;
  }];

  _curator addEventHandler ["CuratorPinged", {
	   _this call FUNC(handleCuratorPinged);
  }];
}] call CBA_fnc_addClassEventHandler;

if (isServer) then {
  GVAR(curatorModulesGroup) = grpNull;
  GVAR(curatorModules) = [];
  GVAR(curatorUnits) = [];
  GVAR(entitiesInitAdded) = false;

  // Entity inits for adding to curator
  ["CAManBase", "initPost", {
    params ["_unit"];
    [_unit] call FUNC(addCuratorObjects);
  }, true, [], true] call CBA_fnc_addClassEventHandler;
  ["AllVehicles", "initPost", {
    params ["_vehicle"];
    [_vehicle] call FUNC(addCuratorObjects);
  }, true, [], true] call CBA_fnc_addClassEventHandler;

  // Server curator init
  ["ModuleCurator_F", "initPost", {
    _this call FUNC(initCuratorModule);
  }, true, [], true] call CBA_fnc_addClassEventHandler;

  // Add objects on server
  [QGVAR(addObjects), {
    _this call FUNC(addCuratorObjects);
  }] call CBA_fnc_addEventHandler;

  // Create curator on demand
  [QGVAR(assignCuratorModule), {
    _this spawn FUNC(assignCuratorModule);
  }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
  GVAR(curatorIconsDraw3D) = -1;
  GVAR(remoteControlDraw3D) = -1;
  GVAR(showPlayerIcons) = false;
  GVAR(drawPlayersCache) = [];
  GVAR(drawPlayersLastCacheRefresh) = DRAWPLAYERSICONS_CACHE_LIFETIME * -1;

  [QGVAR(curatorModuleAssigned), {
    params ["_curatorsCount"];
    systemChat format [
      LLSTRING(CuratorModuleAssigned),
      _curatorsCount
    ];
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
