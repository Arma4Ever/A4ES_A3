#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Disables entity randomization
 */
params ["_entity"];

_entity setVariable ['BIS_enableRandomization', false, true];
_entity setVariable ['ALiVE_OverrideLoadout', true, true];
_entity setVariable ['CFP_DisableRandom', true, true];
_entity setVariable ['NoRandom', true, true];
