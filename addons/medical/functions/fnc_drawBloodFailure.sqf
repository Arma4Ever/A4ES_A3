#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles failure of drawing blood action
 */
params ["_medic", "_patient", "_volume"];

_medic removeItem "A4ES_emptyBloodBag";

private _drawedBlood = _patient getVariable [QGVAR(drawedBlood), 0];
private _item = "A4ES_usedBloodBag";

// Dead patient, return clotted blood
if !(alive _patient) then {
  _item = "A4ES_clottedBloodBag";
};

_medic addItem _item;

["a4es_playerDrawedBlood", [_medic, _patient, _drawedBlood, false, _item]] call CBA_fnc_serverEvent;