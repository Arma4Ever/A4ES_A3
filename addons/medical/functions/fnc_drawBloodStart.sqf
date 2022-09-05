#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles start of drawing blood action
 */

params ["_medic", "_patient", "_volume"];

_patient setVariable [QGVAR(drawedBlood), 0];
