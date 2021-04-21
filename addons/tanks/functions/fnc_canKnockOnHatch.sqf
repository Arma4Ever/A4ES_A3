#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can knock on hatch
 */

params ["_target"];

(crew _target) isNotEqualTo []
