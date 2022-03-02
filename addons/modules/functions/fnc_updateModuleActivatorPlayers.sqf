#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Sets unique id attribute on given module
 */

LOG("updateModuleActivatorPlayers");

private _players = ((playableUnits + switchableUnits) select {
  !(_x isKindOf 'VirtualMan_F')
});

GVAR(moduleActivatorPlayers) = _players;
GVAR(moduleActivatorPlayersNoHelis) = _players select {
  (isNull (objectParent _x)) || {!((objectParent _x) isKindOf "Helicopter")}
};
GVAR(moduleActivatorPlayersNoPlanes) = _players select {
  (isNull (objectParent _x)) || {!((objectParent _x) isKindOf "Plane")}
};
GVAR(moduleActivatorPlayersNoAir) = _players select {
  (isNull (objectParent _x)) || {!((objectParent _x) isKindOf "Air")}
};
