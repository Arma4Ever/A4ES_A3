#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(lastFunctionErrorFade) = scriptNull;

// Check if mission is a main menu
GVAR(isMainMenu) = !is3DEN && !is3DENPreview && !is3DENMultiplayer && !isMultiplayer && !isMultiplayerSolo;
if (GVAR(isMainMenu)) then {
  LOG("Main menu intro detected");
};

["a4es_simpleObjectsCreated", {
  if !(isServer) exitWith {};
  LOG("Event: a4es_simpleObjectsCreated");

  // TODO: desync detection
  0 spawn {
    sleep 20;
    // Send signal to start intro on clients
    ["a4es_startIntro", 0] call CBA_fnc_globalEvent;
  };
}] call CBA_fnc_addEventHandler;

[QGVAR(deleteGroup), {
  params ["_group"];
  TRACE_1("Event deleteGroup",_group);

  if (local _group) then {
    deleteGroup _group;
  };
}] call CBA_fnc_addEventHandler;

[QGVAR(switchMove), {
  params ["_unit", "_anim"];
  TRACE_2("Event switchMove",_unit,_anim);
  _unit switchMove _anim;
}] call CBA_fnc_addEventHandler;

if (isServer) then {
  [QGVAR(enableDynSim), {
    TRACE_1("Event enableDynSim",_this);
    {
      if !(dynamicSimulationEnabled _x) then {
        _x enableDynamicSimulation true;
      };
    } forEach _this;
  }] call CBA_fnc_addEventHandler;

  [QGVAR(disableDynSim), {
    TRACE_1("Event disableDynSim",_this);
    {
      if (dynamicSimulationEnabled _x) then {
        _x enableDynamicSimulation false;
      };
    } forEach _this;
  }] call CBA_fnc_addEventHandler;
};

ADDON = true;
