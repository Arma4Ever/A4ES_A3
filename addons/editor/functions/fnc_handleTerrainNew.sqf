#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles onTerrainNew 3DEN event
 */

// Fix 3DEN Enhanced override
0 spawn {
  sleep 0.001;
  ["ShowPanelRight", true] call BIS_fnc_3DENINterface;
  ["ShowPanelLeft", true] call BIS_fnc_3DENINterface;
};
