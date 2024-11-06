#include "script_component.hpp"

// Exit if it's main menu intro
if (EGVAR(common,isMainMenu)) exitWith {};

// Exit if no interface
if !(hasInterface) exitWith {};

// JIP support
[{
  // Update all playable units teams
  {
    private _team = assignedTeam _x;
    
    if (_team isEqualTo "") then {
      _team = _x getVariable [QGVAR(assignedTeam), ""];
    };

    if (_team isNotEqualTo "") then {
      [QEGVAR(common,teamChanged), [_x, _team]] call CBA_fnc_localEvent;
    };
  } forEach playableUnits;
  
  // Get player squad
  private _squad = player getVariable [QGVAR(squad), objNull];
  // Exit if player has no squad
  if (isNull _squad) exitWith {};
  // Trigger squad changed event
  [QGVAR(squadChanged), []] call CBA_fnc_localEvent;
}, [], 0.5] call CBA_fnc_waitAndExecute;

["CBA_settingsInitialized", {
  call FUNC(onDrawSettingsChanged);
}] call CBA_fnc_addEventHandler;

[QEGVAR(common,teamChanged), {
  params ["_unit", "_team"];
  LOG_2('teamChanged event (unit: "%1" team: "%2")',str _unit,_team);

  _unit setVariable [QGVAR(assignedTeam), _team, true];

  private _color = _team call EFUNC(common,getTeamColor);
  _unit setVariable [QGVAR(unitColor), _color, true];
  [QGVAR(unitColorChanged), [_unit, _color]] call CBA_fnc_localEvent;
}] call CBA_fnc_addEventHandler;

["ace_interactMenuOpened", {
  'ACEInteractMenu' call FUNC(displayLoad);
}] call CBA_fnc_addEventHandler;

["ace_interactMenuClosed", {
  'ACEInteractMenu' call FUNC(displayUnload);
}] call CBA_fnc_addEventHandler;
