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

    LOG_1('Handling deleted event (unit: "%1")',str _unit);

    private _name = _unit call EFUNC(common,getUnitName);
    private _squad = _unit call FUNC(getUnitSquad);
    if (isNull _squad) exitWith {};

    LOG_1('Creating dummy unit for deleted unit "%1".',str _unit);
    private _group = createGroup [sideLogic, true];
    "VirtualSpectator_F" createUnit [[-1000, -1000, 1000], _group];

    private _dummyUnit = (units _group) # 0;
    _dummyUnit setVariable ["ACE_Name", _name, true];
    // Disable transfer of dummy unit
    _dummyUnit setVariable [QEGVAR(headless,disableTransfer), true];

    // Replace unit with dummy unit
    [_unit, _dummyUnit] call FUNC(replaceSquadUnit);

    // Make sure ACE won't change unit name
    LOG_1('Checking name of dummy unit "%1".',str _unit);
    [
      {
        !(((_this # 0) getVariable "ACE_Name") isEqualTo (_this # 1))
      },
      {
        LOG_1('Name of dummy unit "%1" has changed - overriding.',str (_this # 0));
        (_this # 0) setVariable ["ACE_Name", _this # 1, true];
        [{
          (_this # 0) setVariable ["ACE_Name", _this # 1, true];
        }, _this, 1] call CBA_fnc_waitAndExecute;
      },
      [_dummyUnit, _name],
      10,
      {
        LOG_1('Checking name of dummy unit "%1" done.',str (_this # 0));
      }
    ] call CBA_fnc_waitUntilAndExecute;
  }];
};
