#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

// Add objects/group placed by curator to all curators
["ModuleCurator_F", "InitPost", {
  params ["_curator"];

  // Log event
  if (isServer) then {
    ["a4esserver_events_curModCreat", 0] call CBA_fnc_localEvent;
  };

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

  // Add all vehicles to curators
  ["AllVehicles", "initPost", {
    params ["_vehicle"];
    [_vehicle] call FUNC(addCuratorObjects);
  }, true, [], true] call CBA_fnc_addClassEventHandler;

  // Server curator init
  ["ModuleCurator_F", "initPost", {
    _this call FUNC(initCuratorModule);
  }, true, [], true] call CBA_fnc_addClassEventHandler;

  // Disable curators ability to trigger dyn sim
  ["VirtualMan_F", "initPost", {
    params ["_unit"];
    [_unit] call FUNC(addCuratorObjects);
    _unit triggerDynamicSimulation false;
  }, true, [], true] call CBA_fnc_addClassEventHandler;

  // Add objects on server
  [QGVAR(addObjects), {
    _this call FUNC(addCuratorObjects);
  }] call CBA_fnc_addEventHandler;

  // Create curator on demand
  [QGVAR(assignCuratorModule), {
    _this call FUNC(assignCuratorModule);
  }] call CBA_fnc_addEventHandler;

  // Unassign curator
  [QGVAR(unassignCuratorModule), {
    _this call FUNC(unassignCuratorModule);
  }] call CBA_fnc_addEventHandler;

  [QGVAR(requestLogicFlagsList), {
    params ["_player"];
    [QGVAR(logicFlagsList), EGVAR(modules,logicFlagTitles), [_player]] call CBA_fnc_targetEvent;
  }] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
  GVAR(curatorIconsDraw3D) = -1;
  GVAR(remoteControlDraw3D) = -1;
  GVAR(showPlayerIcons) = false;
  GVAR(drawPlayersCache) = [];
  GVAR(drawPlayersLastCacheRefresh) = DRAWPLAYERSICONS_CACHE_LIFETIME * -1;
  GVAR(logicFlags) = createHashMap;

  [QGVAR(logicFlagsList), {
    GVAR(logicFlags) = _this;
  }] call CBA_fnc_addEventHandler;

  [QGVAR(curatorModuleAssigned), {
    params ["_curatorsCount"];
    systemChat format [
      LLSTRING(CuratorModuleAssigned),
      _curatorsCount
    ];
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
