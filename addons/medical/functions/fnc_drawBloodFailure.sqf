#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles failure of drawing blood action
 */
params ["_medic", "_patient", "_volume"];

_medic removeItem "A3CS_emptyBloodBag";

// Dead patient, return clotted blood
if !(alive _patient) exitWith {
  _medic addItem "A3CS_clottedBloodBag";
};

_medic addItem "A3CS_usedBloodBag";
