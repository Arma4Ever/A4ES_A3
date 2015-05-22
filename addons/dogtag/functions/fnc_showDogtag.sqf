/*
 * Author: SzwedzikPL
 *
 * Display Dogtag
 */
 #include "script_component.hpp"

 private ["_unit", "_unitname"];

 _unit = _this select 0;
_unitname = _unit getVariable ["ACE_Name", name _unit];

0 cutRsc["A3CS_RscDogtag", "PLAIN", 1, true];
(uiNamespace getvariable ['A3CS_ctrlDogtag', controlNull]) ctrlSetText _unitname;