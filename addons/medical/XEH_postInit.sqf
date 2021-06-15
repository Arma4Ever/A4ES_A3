#include "script_component.hpp"

if (hasInterface) then {
  // Exit if curator/spectator
  if ((side (group player)) isEqualTo sideLogic) exitWith {};

  addMissionEventHandler ["EntityKilled", {
    _this call FUNC(handleEntityKilled);
  }];
};
