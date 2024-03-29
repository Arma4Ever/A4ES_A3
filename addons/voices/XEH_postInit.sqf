#include "script_component.hpp"

GVAR(speakerVoiceLinesCache) = createHashMap;
GVAR(voiceLinesData) = createHashMapFromArray [
  ["suppressed", ["UnderFireE", "ContactE_1", "ContactE_2", "ContactE_3", "CombatGenericE", "CoverMeE", "moveBack", "EndangeredE"]],
  ["firing", ["CheeringE", "ContactE_1", "ContactE_2", "ContactE_3", "CombatGenericE", "CoveringE", "moveUp", "SuppressingE"]],
  ["throwing", ["ThrowingGrenadeE_1", "ThrowingGrenadeE_2", "ThrowingGrenadeE_3"]],
  ["killed", ["FXDeath", "FXHurt", "FXHit", "FXDrowning"]],
  ["reloading", ["ReloadingE"]]
];

["CAManBase", "Killed", {
  _this call FUNC(handleKilled);
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "Fired", {
  _this call FUNC(handleFired);
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "GestureChanged", {
  _this call FUNC(handleGestureChanged);
}] call CBA_fnc_addClassEventHandler;

["CAManBase", "Suppressed", {
  _this call FUNC(handleSuppressed);
}] call CBA_fnc_addClassEventHandler;

["ace_unconscious", {
  params ["_unit", "_state"];

  if (
    !_state || 
    {!(alive _unit)} || 
    {objectParent _unit isKindOf "Tank"} ||
    {objectParent _unit isKindOf "Plane"}
  ) exitWith {};

  private _id = ceil (random 10);
  if (_id < 10) then {
    _id = "0" + (str _id);
  };

  _unit say3D [format ["hit_snd_%1", _id], 200, 1, false];
}] call CBA_fnc_addEventHandler;

[QGVAR(playVoiceLine), {
  _this call FUNC(playVoiceLine);
}] call CBA_fnc_addEventHandler;

