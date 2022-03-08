#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles onMissionNew 3DEN event
 */

0 spawn {
  waitUntil {isGameFocused};
  sleep 2;
  0 call FUNC(setupMissionAttributes);
};
