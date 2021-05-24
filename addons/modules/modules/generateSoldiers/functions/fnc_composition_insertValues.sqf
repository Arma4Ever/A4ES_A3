#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for generateSoldiers compositions attribute
 */

params ["_module"];

private _modules = (all3DENEntities # 3) select {_x isKindOf QGVAR(generatorComposition)};

// Get compositions ids list
private _compositions = _modules apply {
  private _id = (_x get3DENAttribute QGVAR(id)) param [0, ""];
  if ((_id isEqualType "") && (_id isNotEqualTo "")) then {[_id, _id]} else {nil};
};

// Clear nils
_compositions = _compositions arrayIntersect _compositions;

// Add info about empty compositions
if (_compositions isEqualTo []) then {
  _compositions = [[
    LLSTRING(generateSoldiers_emptyCompositions),
    "",
    true,
    LLSTRING(generateSoldiers_emptyCompositions_Tooltip),
    QPATHTOF(data\warning_red.paa)
  ]];
};

_compositions
