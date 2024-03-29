#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns dialogue assigned to given unit
 */

params ["_unit"];
TRACE_1("getUnitDialogue",_unit);

private _dialogue = _unit getVariable [QGVAR(dialogue), ""];

if (_dialogue == "") then {
  private _dialogue = missionNamespace getVariable [
    format [QGVAR(defaultDialogue%1), str (side (group _unit))],
    ""
  ];
};

_dialogue
