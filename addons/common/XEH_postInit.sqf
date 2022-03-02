#include "script_component.hpp"

// Mark units ever taken by players
player setVariable [QGVAR(isPlayer), true, true];
player setVariable [QGVAR(UID), getPlayerUID player, true];
(group player) setVariable [QGVAR(playerGroup), true, true];
