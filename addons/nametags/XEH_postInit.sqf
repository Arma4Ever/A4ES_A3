#include "script_component.hpp"

// Exit if it's main menu intro
if (EGVAR(common,isMainMenu)) exitWith {};

["CBA_settingsInitialized", {
  call FUNC(onDrawSettingsChanged);
}] call CBA_fnc_addEventHandler;

["CBA_teamColorChanged", {
  params ["_unit", "_team"];

  private _color = _team call EFUNC(common,getTeamColor);
  _unit setVariable [QGVAR(unitColor), _color];
}] call CBA_fnc_addEventHandler;

["ace_interactMenuOpened", {
  'ACEInteractMenu' call FUNC(displayLoad);
}] call CBA_fnc_addEventHandler;

["ace_interactMenuClosed", {
  'ACEInteractMenu' call FUNC(displayUnload);
}] call CBA_fnc_addEventHandler;
