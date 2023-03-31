#include "script_component.hpp"

ADDON = false;

// Role-play items arsenal tab
GVAR(rolePlayItemsArsenalButton) = [
  [
    "A4ES_RPItems_antibiotics",
    "A4ES_RPItems_gasCanister",
    "A4ES_RPItems_matches",
    "A4ES_RPItems_keys",
    "A4ES_RPItems_phone",
    "A4ES_RPItems_knife",
    "A4ES_RPItems_vodka",
    "A4ES_RPItems_money",
    "A4ES_RPItems_uSB",
    "A4ES_RPItems_milID",
    "A4ES_RPItems_ID",
    "A4ES_RPItems_passport",
    "A4ES_RPItems_drivingLicense",
    "A4ES_RPItems_gunLicense",
    "A4ES_RPItems_cigarettes",
    "A4ES_RPItems_camera",
    "A4ES_RPItems_policeBadge",
    "A4ES_RPItems_pass",
    "A4ES_RPItems_alcoholConcession",
    "A4ES_RPItems_narcotics"
  ],
  LLSTRING(roleplayItems),
  "\z\a4es\addons\roleplayitems\data\logoArsenal.paa"
] call ace_arsenal_fnc_addRightPanelButton;

ADDON = true;
