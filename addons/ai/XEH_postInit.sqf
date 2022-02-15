#include "script_component.hpp"

if !(isServer) exitWith {};

// Remove AI NVG
addMissionEventHandler ["EntityKilled", {
  params ["_unit"];

  if !(_unit isKindOf "CAManBase") exitWith {};
  _unit unlinkItem "a3cs_ai_NVGoggles";
}];
