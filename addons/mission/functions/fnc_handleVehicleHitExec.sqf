#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles hit event for all vehicles, makes sure disabled vehicles have dyn sim enabled
 */

params ["_vehicle"];
TRACE_1("handleVehicleHitExec",_vehicle);

private _aliveCrew = (crew _vehicle) select {alive _x};

// Exit if alive crew
if (_aliveCrew isNotEqualTo []) exitWith {
  // Enable sim if vehicle or crew has disabled sim
  if (
    !(simulationEnabled _vehicle) ||
    {!(simulationEnabled (_aliveCrew select 0))}
  ) then {
    private _entities = _aliveCrew apply {group _x};
    _entities = _entities arrayIntersect _entities;
    _entities pushBack _vehicle;
    [QEGVAR(common,disableDynSim), _entities] call CBA_fnc_serverEvent;
  };
};

if (!(alive _vehicle) || {_vehicle isKindOf "Air"}) exitWith {};

TRACE_1("Enabling dyn sim for empty vehicle",_vehicle);
[QEGVAR(common,enableDynSim), [_vehicle]] call CBA_fnc_serverEvent;
