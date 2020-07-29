#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if given group should be transfered to given headless
 */

params ["_group", "_headlessOwner"];

// Exit if not called on server
if !(isServer) exitWith {false};

#ifdef DEBUG_MODE_FULL
private _groupId = groupId _group;
LOG_2('Checking group "%1" for transfer to headless (headlessOwner: %2).',_groupId,str _headlessOwner);
#endif

if ((units _group) isEqualTo []) exitWith {
  LOG_1('Group "%1" rejected for transfer - group is empty.',_groupId);
  false
};

// No transfer if group is already transferdd
if ((groupOwner _group) isEqualTo _headlessOwner) exitWith {
  LOG_2('Group "%1" rejected for transfer - already transfered (groupOwner: %2).',_groupId,str (groupOwner _group));
  false
};

// No transfer if group has disableTransfer flag
if (_group getVariable [QGVAR(disableTransfer), false]) exitWith {
  LOG_1('Group "%1" rejected for transfer - group has disableTransfer flag.',_groupId);
  false
};

// No transfer if group has waypoints with synchronized triggers
private _allWaypointsWithTriggers = (waypoints _group) select {!((synchronizedTriggers _x) isEqualTo [])};
if !(_allWaypointsWithTriggers isEqualTo []) exitWith {
  LOG_2('Group "%1" rejected for transfer - group has waypoints with synchronized triggers (invalid waypoints count: %2).',_groupId,str (count _allWaypointsWithTriggers));
  false
};

// Group is valid, now check group units
private _transferUnits = true;

{
  private _unit = _x;

  // No transfer if already transferred
  if ({owner _unit} isEqualTo _headlessOwner) exitWith {
    LOG_2('Group "%1" rejected for transfer - group unit already transfered (unit owner: %2).', str (owner _unit));
    _transferUnits = false;
  };

  // No transfer if player in group
  if (isPlayer _unit) exitWith {
    LOG_2('Group "%1" rejected for transfer - group unit is player (player: %2).', name _unit);
    _transferUnits = false;
  };

  // No transfer if any unit in group has disableTransfer flag
  if (_unit getVariable [QGVAR(disableTransfer), false]) exitWith {
    LOG_1('Group "%1" rejected for transfer - group unit has disableTransfer flag.');
    _transferUnits = false;
  };

  // No transfer if unit vehicle has disableTransfer flag
  private _vehicle = objectParent _unit;
  if (!(isNull _vehicle) && {_vehicle getVariable [QGVAR(disableTransfer), false]}) exitWith {
    LOG_1('Group "%1" rejected for transfer - group unit vehicle has disableTransfer flag.');
    _transferUnits = false;
  };

  // Save gear if unit about to be transferred with current
  // loadout (in case of need of loadout restoration later).
  _unit setVariable [QGVAR(loadout), getUnitLoadout _x, true];
} forEach (units _group);

_transferUnits
