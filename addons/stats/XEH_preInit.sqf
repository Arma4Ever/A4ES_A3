#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(aceLastLoadCargo) = [objNull, objNull];
GVAR(aceLastLoadCargoTime) = 0;
GVAR(aceLastUnloadCargo) = [objNull, objNull, objNull, ""];
GVAR(aceLastUnloadCargoTime) = 0;

["ace_loadCargo", {
  params ["_item", "_vehicle"];
  TRACE_2("ace_loadCargo",_item,_vehicle);

	GVAR(aceLastLoadCargo) = [_item, _vehicle];
	GVAR(aceLastLoadCargoTime) = CBA_missionTime;
}] call CBA_fnc_addEventHandler;

["ace_cargoLoaded", {
  params ["_item", "_vehicle"];
  TRACE_2("ace_cargoLoaded",_item,_vehicle);

	if (
	  ([_item, _vehicle] isEqualTo GVAR(aceLastLoadCargo)) &&
		{(CBA_missionTime - GVAR(aceLastLoadCargoTime)) < 1}
	) then {
    GVAR(aceLastLoadCargo) = [objNull, objNull];
    GVAR(aceLastLoadCargoTime) = 0;
    ["a4es_cargoLoaded", [ace_player, _item, _vehicle]] call CBA_fnc_serverEvent;
	};
}] call CBA_fnc_addEventHandler;

["ace_unloadCargo", {
  params ["_item", "_vehicle", ["_unloader", objNull]];
  TRACE_3("ace_unloadCargo",_item,_vehicle,_unloader);

	GVAR(aceLastUnloadCargo) = [_item, _vehicle, _unloader, "unload"];
	GVAR(aceLastUnloadCargoTime) = CBA_missionTime;
}] call CBA_fnc_addEventHandler;

["ace_cargo_paradropItem", {
  params ["_item", "_vehicle"];
  TRACE_3("ace_cargo_paradropItem",_item,_vehicle);

	GVAR(aceLastUnloadCargo) = [_item, _vehicle, ace_player, "paradrop"];
	GVAR(aceLastUnloadCargoTime) = CBA_missionTime;
}] call CBA_fnc_addEventHandler;

["ace_cargoUnloaded", {
  params ["_item", "_vehicle", "_action"];
  TRACE_2("ace_cargoLoaded",_item,_vehicle);

	if (
	  ([_item, _vehicle, ace_player, _action] isEqualTo GVAR(aceLastUnloadCargo)) &&
		{(CBA_missionTime - GVAR(aceLastUnloadCargoTime)) < 1}
	) then {
    GVAR(aceLastUnloadCargo) = [objNull, objNull, objNull, ""];
    GVAR(aceLastUnloadCargoTime) = 0;
    ["a4es_cargoUnloaded", [ace_player, _item, _vehicle, _action]] call CBA_fnc_serverEvent;
	};
}] call CBA_fnc_addEventHandler;

["ace_loadPersonEvent", {
  params ["_unit", "_vehicle", ["_caller", objNull]];
  ["a4es_loadPerson", [_unit, _vehicle, _caller]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["ace_unloadPersonEvent", {
  params ["_unit", "_vehicle", ["_caller", objNull]];
  ["a4es_unloadPerson", [_unit, _vehicle, _caller]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["ace_marker_flags_placed", {
  params ["_player", "_flag", "_itemClass"];
  ["a4es_placedMarkerFlag", [_player, _flag, _itemClass]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["ace_refuel_started", {
  params ["_source", "_sink"];
  ["a4es_refuelStarted", [ace_player, _source, _sink]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

["ace_refuel_stopped", {
  params ["_source", "_sink"];
  ["a4es_refuelStopped", [ace_player, _source, _sink]] call CBA_fnc_serverEvent;
}] call CBA_fnc_addEventHandler;

ADDON = true;
