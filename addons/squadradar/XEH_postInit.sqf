#include "script_component.hpp"

// Exit if no interface or it's main menu intro
if (!hasInterface || EGVAR(common,isMainMenu)) exitWith {};

["CBA_settingsInitialized", {
  call FUNC(onSettingsChanged);
}] call CBA_fnc_addEventHandler;

[QEGVAR(squads,squadChanged), {
  LOG("squadChanged");

  // Init radar if not enabled because of null squad before
  if (GVAR(enable) && !GVAR(enabled)) exitWith {
    call FUNC(onSettingsChanged);
  };

  // Refresh members cache & redraw memberlist
  true call FUNC(drawMemberlist);
}] call CBA_fnc_addEventHandler;

private _handleUnitStatusUpdate = {
  params ["_unit"];

  // Exit if units are not in same squad
  if !([ace_player, _unit] call EFUNC(squads,areInSameSquad)) exitWith {};

  if ((_unit distance2D ace_player) < RADAR_MAX_UNIT_DISTANCE) then {
    false call FUNC(drawMemberlist);
  };
};

[QGVAR(onSpeak), "OnSpeak", _handleUnitStatusUpdate, ObjNull] call TFAR_fnc_addEventHandler;
["CBA_teamColorChanged", _handleUnitStatusUpdate] call CBA_fnc_addEventHandler;
["ace_unconscious", _handleUnitStatusUpdate] call CBA_fnc_addEventHandler;
