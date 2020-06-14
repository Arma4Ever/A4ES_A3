#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles killed event
 */

params ["_unit"];

// Exit if not server
if !(isServer) exitWith {};

LOG_1("Handling killed event (unit: %1)",str _unit);

private _squad = _unit call FUNC(getUnitSquad);

// Exit if killed unit has no squad
if (isNull _squad) exitWith {};

private _squadUnits = _squad call FUNC(getSquadUnits);

// Remove squad if killed unit was only squad member
if ((count _squadUnits) isEqualTo 1) then {
  _squad call FUNC(deleteSquad);
} else {
  // Trigger squad change for members to refresh icons
  [_squad] call FUNC(triggerSquadChanged);

  // Add deleted handler in case of need of dummy unit
  _unit addEventHandler ["deleted", {
    params ["_unit"];

    LOG_1("Handling deleted event (unit: %1)",str _unit);

    private _squad = _unit call FUNC(getUnitSquad);
    if (isNull _squad) exitWith {};

    // TODO: create dummy unit
    // TODO: save squadradar name, icon & baseIcon for dummy unit
  }];
};
