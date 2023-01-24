#include "script_component.hpp"


if (hasInterface) then {
  if (
    (getMissionConfigValue [QGVAR(enableArtComputer), false]) ||
    {(side (group player)) isEqualTo sideLogic}
  ) exitWith {};

  enableEngineArtillery false;
};
