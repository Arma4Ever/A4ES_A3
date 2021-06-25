#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * units3DENComp module exec function
 */

params ["_logic"];
TRACE_1("units3DENComp_moduleExec",_logic);

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

private _mode = _logic getVariable [QGVAR(mode), 0];
if (_mode isNotEqualTo 1) exitWith {
  TRACE_1("units3DENComp_moduleExec abort: module not in read mode",_mode);
  deleteVehicle _logic;
};

private _dataSaved = _logic getVariable [QGVAR(dataSaved), false];
if !(_dataSaved) exitWith {
  TRACE_1("units3DENComp_moduleExec abort: data not saved",_dataSaved);
  deleteVehicle _logic;
};

private _data = parseSimpleArray (_logic getVariable [QGVAR(data), "[]"]);
if (_data isEqualTo []) exitWith {
  TRACE_1("units3DENComp_moduleExec abort: empty data",_data);
  deleteVehicle _logic;
};

// Collect post init handlers
private _unitPostInit = {};
if (_logic getVariable [QGVAR(addUnitPostInit), false]) then {
  _unitPostInit = compile (_logic getVariable [QGVAR(unitPostInit), ""]);
};
private _groupPostInit = {};
if (_logic getVariable [QGVAR(addGroupPostInit), false]) then {
  _groupPostInit = compile (_logic getVariable [QGVAR(groupPostInit), ""]);
};
private _vehiclePostInit = {};
if (_logic getVariable [QGVAR(addVehiclePostInit), false]) then {
  _vehiclePostInit = compile (_logic getVariable [QGVAR(vehiclePostInit), ""]);
};

// Prep params
private _params = [
  _logic getVariable [QGVAR(groupsDynSim), 1],
  _logic getVariable [QGVAR(goUpAfterSpawn), false],
  _logic getVariable [QGVAR(vehiclesDynSim), 1],
  _logic getVariable [QGVAR(clearVehCargo), true],
  _unitPostInit,
  _groupPostInit,
  _vehiclePostInit
];

// Spawn units
if (
  isMultiplayer
  && {!(_logic getVariable [QGVAR(disableHeadless), false])}
  && {!(isNull EGVAR(headless,headlessClient))}
) then {
  // Exec on headless
  LOG_1('Spawning EXEC_MODULE_NAME exec function on headless (owner: %1)', str (owner EGVAR(headless,headlessClient)));
  [_logic, _data, _params] remoteExec [QFUNC(units3DENComp_spawnData), owner EGVAR(headless,headlessClient)];
} else {
  // Exec on server
  LOG('Spawning EXEC_MODULE_NAME exec function on server');
  [_logic, _data, _params] spawn FUNC(units3DENComp_spawnData);
};
