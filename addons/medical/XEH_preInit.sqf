#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(medicalArsenalButton) = [
  [
    "ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot",
    "ACE_tourniquet", "ACE_splint", "ACE_morphine", "ACE_adenosine", "ACE_atropine",
    "ACE_epinephrine", "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250",
    "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250", "ACE_salineIV", 
    "ACE_salineIV_500", "ACE_salineIV_250", "ACE_personalAidKit", "ACE_surgicalKit",
    "ACE_bodyBag", "A4ES_dressingSet", "A4ES_painkillers", "A4ES_emptyBloodBag",
    "A4ES_usedBloodBag", "A4ES_clottedBloodBag"
  ],
  LLSTRING(Medications),
  "\z\ace\addons\medical_gui\data\categories\medication.paa"
] call ace_arsenal_fnc_addRightPanelButton;

GVAR(friendlyFireLock) = false;
GVAR(friendlyFireSource) = objNull;
GVAR(friendlyFireID) = 0;

GVAR(fatalStateCheckScheduled) = false;

// Save last damage source
["ace_medical_woundReceived", {
  params ["_unit", "", "", "_damageType"];
  _unit setVariable [QGVAR(lastDamageType), _damageType];
}] call CBA_fnc_addEventHandler;

["ace_unconscious", {
  params ["_unit", "_active"];
  TRACE_2("ace_unconscious",_unit,_active);

  if (player isEqualTo _unit) exitWith {};
  if (_active) then {
    player disableCollisionWith _unit; 
  } else {
    player enableCollisionWith _unit; 
  };
}] call CBA_fnc_addEventHandler;

// Publish last damage type of dead units
["ace_medical_death", {
  params ["_unit"];

  private _lastDamageType = _unit getVariable [QGVAR(lastDamageType), ""];
  TRACE_2("ace_medical_death: publishing lastDamageType"_unit, _lastDamageType);
  _unit setVariable [QGVAR(lastDamageType), _lastDamageType, true];
}] call CBA_fnc_addEventHandler;

ADDON = true;
