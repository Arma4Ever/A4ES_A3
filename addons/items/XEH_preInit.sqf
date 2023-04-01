#include "script_component.hpp"

ADDON = false;

// Placeable items arsenal tab
GVAR(placeableItemsArsenalButton) = [
  [
    "A4ES_dressingSet",
    "A4ES_mobileArtilleryRadarItem",
    "tfw_rf3080Item",
    "ace_marker_flags_white",
    "ace_marker_flags_black",
    "ace_marker_flags_red",
    "ace_marker_flags_green",
    "ace_marker_flags_blue",
    "ace_marker_flags_yellow",
    "ace_marker_flags_orange",
    "ace_marker_flags_purple",
    "ACE_SpottingScope",
    "ACE_Tripod"
  ],
  LLSTRING(placeableItems),
  "\z\a4es\addons\items\data\logoArsenal.paa"
] call ace_arsenal_fnc_addRightPanelButton;

ADDON = true;