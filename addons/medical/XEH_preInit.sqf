#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(medicalArsenalButton) = [
  [
    "ACE_fieldDressing", "ACE_packingBandage", "ACE_elasticBandage", "ACE_quikclot",
    "ACE_tourniquet", "ACE_splint",
    "ACE_morphine", "ACE_adenosine", "ACE_atropine", "ACE_epinephrine",
    "ACE_plasmaIV", "ACE_plasmaIV_500", "ACE_plasmaIV_250",
    "ACE_bloodIV", "ACE_bloodIV_500", "ACE_bloodIV_250",
    "ACE_salineIV", "ACE_salineIV_500", "ACE_salineIV_250",
    "ACE_personalAidKit", "ACE_surgicalKit", "ACE_bodyBag",
    "A3CS_dressingSet", "A3CS_painkillers"
  ],
  LLSTRING(Medications),
  "\z\ace\addons\medical_gui\data\categories\medication.paa"
] call ace_arsenal_fnc_addRightPanelButton;

GVAR(ffReported) = false;

ADDON = true;
