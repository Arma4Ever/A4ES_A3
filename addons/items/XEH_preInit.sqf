#include "script_component.hpp"

ADDON = false;

// Placeable items arsenal tab
GVAR(placeableItemsArsenalButton) = [
  [
    "A3CS_dressingSet",
    "A3CS_mobileArtilleryRadarItem",
    "tfw_rf3080Item",
    "ace_marker_flags_white",
    "ace_marker_flags_black",
    "ace_marker_flags_red",
    "ace_marker_flags_green",
    "ace_marker_flags_blue",
    "ace_marker_flags_yellow",
    "ace_marker_flags_orange",
    "ace_marker_flags_purple"
    // SPOTTING SCOPE
    // ROZKLADANY TROJNG
  ],
  LLSTRING(placeableItems),
  "" //TODO: ICON
] call ace_arsenal_fnc_addRightPanelButton;

// Role-play items arsenal tab
GVAR(roleplayItemsArsenalButton) = [
  [
    // Itemy armowe, dowod osobsty, laptopy itp
    // https://github.com/acemod/ACE3/blob/master/addons/field_rations/CfgWeapons.hpp
    // 
  ],
  LLSTRING(roleplayItems),
  "" //TODO: ICON
] call ace_arsenal_fnc_addRightPanelButton;

ADDON = true;
