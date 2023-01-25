#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles failure of drawing blood action
 */
params ["_medic", "_patient", "_volume"];

_medic removeItem "A4ES_emptyBloodBag";

// Dead patient, return clotted blood
if !(alive _patient) exitWith {
  _medic addItem "A4ES_clottedBloodBag";
};

_medic addItem "A4ES_usedBloodBag";
