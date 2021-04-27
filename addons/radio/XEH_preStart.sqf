#include "script_component.hpp"

#include "XEH_PREP.hpp"

if !(hasInterface) exitWith {};

uiNamespace setVariable [
  QGVAR(binoClasses),
  (QUOTE(getNumber (_x >> 'type') == TYPE_BINOCULAR) configClasses (configFile >> "CfgWeapons")) apply {configName _x}
];
