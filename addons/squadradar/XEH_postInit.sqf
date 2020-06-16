#include "script_component.hpp"

// Exit if no interface or it's main menu intro
if (!hasInterface || EGVAR(common,isMainMenu)) exitWith {};

["CBA_settingsInitialized", {
  LOG("CBA_settingsInitialized event");
  GVAR(settingsInitialized) = true;
  call FUNC(handleSettingsChanged);
}] call CBA_fnc_addEventHandler;

#ifdef DEBUG_MODE_FULL
["unit", {
  LOG_1("unit event: %1",str _this);
}] call CBA_fnc_addPlayerEventHandler;
["vehicle", {
  LOG_1("vehicle event: %1",str _this);
}] call CBA_fnc_addPlayerEventHandler;
[QEGVAR(squads,squadChanged), {
  LOG_1("squadChanged event: %1",str _this);
}] call CBA_fnc_addEventHandler;
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

["unit", {
  // Trigger squads changed event on unit change & update UI
  [{
    [QEGVAR(squads,squadChanged), []] call CBA_fnc_localEvent;
  }, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addPlayerEventHandler;

["vehicle", {
  call FUNC(updateUI);
}] call CBA_fnc_addPlayerEventHandler;

[QEGVAR(squads,squadChanged), {
  GVAR(currentSquad) = ace_player call EFUNC(squads,getUnitSquad);
  GVAR(currentSquadUnits) = GVAR(currentSquad) call EFUNC(squads,getSquadUnits);

  // Sort squad units by rank
  GVAR(currentSquadUnits) = [GVAR(currentSquadUnits), [], {
      (_x call EFUNC(nametags,getUnitRank)) # 2
  }, "DESCEND"] call BIS_fnc_sortBy;

  // Update UI
  call FUNC(updateUI);
}] call CBA_fnc_addEventHandler;

[QGVAR(onSpeak), "OnSpeak", DFUNC(handleUnitStatusUpdate), ObjNull] call TFAR_fnc_addEventHandler;
["CBA_teamColorChanged", DFUNC(handleUnitStatusUpdate)] call CBA_fnc_addEventHandler;
["ace_unconscious", {
  params ["_unit"];

  _this call FUNC(handleUnitStatusUpdate);

  // Update ui if player unconsciousness status changes
  if (_unit isEqualTo ace_player) then {
    call FUNC(updateUI);
  };
}] call CBA_fnc_addEventHandler;
