#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[QGVAR(revealUnit), {
  params ["_entity"];
  {
    _x reveal [_entity, 4];
  } forEach allGroups;
}] call CBA_fnc_addEventHandler;

[QGVAR(revealAllPlayers), {
  private _players = allPlayers select {alive _x && {!(_x isKindOf "VirtualMan_F")}};
  {
    private _player = _x;
    {
      _x reveal [_player, 4];
    } forEach allGroups;
  } forEach _players;
}] call CBA_fnc_addEventHandler;

[QGVAR(switchPATH), {
  params ["_unit", "_state"];

  if (
    !(local _unit) ||
    {!(_unit isKindOf "CAManBase")}
  ) exitWith {};

  if (_state) then {
    _unit enableAI "PATH";
    _unit enableAI "FSM";
  } else {
    _unit disableAI "PATH";
    _unit disableAI "FSM";
  };
}] call CBA_fnc_addEventHandler;

// Add objects/group placed by curator to all curators
["ModuleCurator_F", "InitPost", {
  params ["_curator"];

  _curator addEventHandler ["CuratorObjectPlaced", {
    params ["", "_object"];
    [QGVAR(curatorObjectPlaced), _object] call CBA_fnc_serverEvent;
  }];

  _curator addEventHandler ["CuratorGroupPlaced", {
    params ["", "_group"];
    [QGVAR(curatorGroupPlaced), _group] call CBA_fnc_serverEvent;
  }];

  _curator addEventHandler ["CuratorPinged", {
	   _this call FUNC(handleCuratorPinged);
  }];

  _curator addEventHandler ["CuratorObjectDeleted", {
    params ["_curator", "_entity"];

    if (player isEqualTo (getAssignedCuratorUnit _curator)) then {
      ["a4es_curatorObjectDeleted", [player, typeOf _entity]] call CBA_fnc_serverEvent;
    };
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

  // Parse curator placed object
  [QGVAR(curatorObjectPlaced), {
    params ["_object"];
    
    if (_object isKindOf "CAManBase") then {
      (group _object) call FUNC(transferCuratorGroup);
    };

    [_object] call FUNC(addCuratorObjects);
  }] call CBA_fnc_addEventHandler;

  // Parse curator placed group
  [QGVAR(curatorGroupPlaced), {
    _this call FUNC(transferCuratorGroup);
  }] call CBA_fnc_addEventHandler;

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

  ["zen_remoteControlStarted", {
    params ["_unit"];
    ["a4es_curatorRemCtrlStarted", [player, _unit]] call CBA_fnc_serverEvent;
  }] call CBA_fnc_addEventHandler;

  ["zen_remoteControlStopped", {
    params ["_unit"];
    ["a4es_curatorRemCtrlEnded", [player, _unit]] call CBA_fnc_serverEvent;
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
