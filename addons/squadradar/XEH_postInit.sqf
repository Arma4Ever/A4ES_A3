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
[QGVAR(jamRadar), {
  LOG_1("jamRadar event: %1",str _this);
}] call CBA_fnc_addEventHandler;
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
["ace_finger_fingered", {
  LOG_1("ace_finger_fingered event: %1",str _this);
}] call CBA_fnc_addEventHandler;
#endif

["unit", {
  // Hide current squad for now
  GVAR(showCurrentSquad) = false;

  // Trigger squads changed event on unit change & update UI
  [{
    [QEGVAR(squads,squadChanged), []] call CBA_fnc_localEvent;
  }, []] call CBA_fnc_execNextFrame;
}] call CBA_fnc_addPlayerEventHandler;

["vehicle", {
  false call FUNC(updateUI);
}] call CBA_fnc_addPlayerEventHandler;

[QGVAR(jamRadar), {
  // Update UI
  true call FUNC(updateUI);
}] call CBA_fnc_addEventHandler;

[QEGVAR(squads,squadChanged), {
  GVAR(currentSquad) = ace_player call EFUNC(squads,getUnitSquad);

  if (isNull GVAR(currentSquad)) then {
    GVAR(currentSquadUnits) = [];
    GVAR(showCurrentSquad) = false;
  } else {
    private _squadUnits = GVAR(currentSquad) call EFUNC(squads,getSquadUnits);

    // Sort squad units by rank descending
    GVAR(currentSquadUnits) = [_squadUnits, 0] call EFUNC(nametags,sortUnitsByRank);
    GVAR(showCurrentSquad) = (count GVAR(currentSquadUnits)) >= 2;
  };

  // Update UI
  true call FUNC(updateUI);
}] call CBA_fnc_addEventHandler;

[QGVAR(onSpeak), "OnSpeak", DFUNC(handleUnitStatusUpdate), ObjNull] call TFAR_fnc_addEventHandler;
["CBA_teamColorChanged", DFUNC(handleUnitStatusUpdate)] call CBA_fnc_addEventHandler;

["ace_unconscious", {
  params ["_unit"];

  _this call FUNC(handleUnitStatusUpdate);

  // Update ui if player unconsciousness status changes
  if (_unit isEqualTo ace_player) then {
    false call FUNC(updateUI);
  };
}] call CBA_fnc_addEventHandler;

// ACE Finger
["ace_finger_fingered", {
  _this call FUNC(handleFinger);
}] call CBA_fnc_addEventHandler;

// UI screenshot mode
[QEGVAR(ui,screenshotModeToggled), {
  false call FUNC(updateUI);
}] call CBA_fnc_addEventHandler;
