/*
 * Author: SzwedzikPL
 * Display Dogtag
 */
#include "script_component.hpp"

params ["_unit"];
private _unitName = _unit call EFUNC(common,getName);

0 cutRsc ["A3CS_RscDogtag", "PLAIN", 1, true];
(uiNamespace getvariable ['A3CS_ctrlDogtag', controlNull]) ctrlSetText _unitName;
