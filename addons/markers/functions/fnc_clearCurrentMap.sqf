#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes current map markers from map
 */

{
  deleteMarkerLocal _x; false
} count (keys GVAR(currentMapMarkers));
