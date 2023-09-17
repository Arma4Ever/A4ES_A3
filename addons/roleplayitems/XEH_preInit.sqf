#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

[ROLEPLAY_ITEMS, LLSTRING(roleplayItems), "\z\a4es\addons\roleplayitems\data\logoArsenal.paa", -1, true] call ace_arsenal_fnc_addRightPanelButton;

ADDON = true;