#include "script_component.hpp"

// Exit if no interface or it's main menu intro
if (!hasInterface || EGVAR(common,isMainMenu)) exitWith {};

["CBA_settingsInitialized", {
  LOG("CBA_settingsInitialized event");
  call FUNC(onSettingsChanged);
}] call CBA_fnc_addEventHandler;

[QEGVAR(squads,squadChanged), {
  LOG("squadChanged event");

  GVAR(currentSquad) = ace_player call EFUNC(squads,getUnitSquad);
  GVAR(currentSquadUnits) = GVAR(currentSquad) call EFUNC(squads,getSquadUnits);

  // Sort squad units by rank
  GVAR(currentSquadUnits) = [GVAR(currentSquadUnits), [], {
      (_x call EFUNC(nametags,getUnitRank)) # 2
  }, "DESCEND"] call BIS_fnc_sortBy;

  // Update radar
  call FUNC(onSettingsChanged);
}] call CBA_fnc_addEventHandler;

private _handleUnitStatusUpdate = {
  params ["_unit"];

  // Exit if units are not in same squad
  if !([ace_player, _unit] call EFUNC(squads,areInSameSquad)) exitWith {};

  // Refesh members cache
  call FUNC(refreshMembersCache);

  // Redraw memberlist if unit in range
  if ((_unit distance2D ace_player) < RADAR_MAX_UNIT_DISTANCE) then {
    false call FUNC(drawMemberlist);
  };
};

#ifdef DEBUG_MODE_FULL
[QGVAR(onSpeakDebug), "OnSpeak", {
  LOG_1("onSpeak event: %1",str _this);
}, ObjNull] call TFAR_fnc_addEventHandler;
["CBA_teamColorChanged", {
  LOG_1("CBA_teamColorChanged event: %1",str _this);
}] call CBA_fnc_addEventHandler;
["ace_unconscious", {
  LOG_1("ace_unconscious event: %1",str _this);
}] call CBA_fnc_addEventHandler;
#endif

[QGVAR(onSpeak), "OnSpeak", _handleUnitStatusUpdate, ObjNull] call TFAR_fnc_addEventHandler;
["CBA_teamColorChanged", _handleUnitStatusUpdate] call CBA_fnc_addEventHandler;
["ace_unconscious", _handleUnitStatusUpdate] call CBA_fnc_addEventHandler;
