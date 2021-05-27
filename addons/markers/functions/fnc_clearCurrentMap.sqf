#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Removes current map markers from map
 */

{deleteMarkerLocal _x} forEach (keys GVAR(currentMapMarkers));
