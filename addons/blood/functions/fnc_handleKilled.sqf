#include "script_component.hpp"
/*
 * Author: SzwedzikPL, ARK
 * Handles EntityKilled event
 */

params ["_unit"];

if (
  !(_unit isKindOf "CAManBase") ||
  {!(isNull (objectParent _unit))}
) exitWith {};

// Exit if system disabled
if (
  (missionNamespace getVariable [QGVAR(disabled), false]) ||
  {_unit getVariable [QGVAR(disabled), false]}
) exitWith {};

private _blood = createSimpleObject [selectRandom GVAR(bloodModels), getPosWorld _unit];
_blood setDir (random 360);
_blood setVectorUp (surfaceNormal (position _blood));

// Use ACE medical blood module to handle clean up
["ace_medical_blood_bloodDropCreated", [_blood]] call CBA_fnc_serverEvent;
