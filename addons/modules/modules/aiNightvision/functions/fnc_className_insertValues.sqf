#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for aiNightvision className attribute
 */

private _classList = uiNamespace getVariable [QGVAR(aiNightvision_nvgClassList), []];

if (_classList isEqualTo []) then {
  private _hiddenNVGCfg = (configFile >> "CfgWeapons" >> QEGVAR(ai,NVGoggles));

  _classList = [[
    getText (_hiddenNVGCfg >> "displayName"),
    QEGVAR(ai,NVGoggles),
    true,
    ("[" + QEGVAR(ai,NVGoggles) + "] " + (getText (_hiddenNVGCfg >> "descriptionShort"))),
    getText (_hiddenNVGCfg >> "picture")
  ]];

  private _configs = ("(getNumber (_x >> 'ItemInfo' >> 'type')) == 616" configClasses (configFile >> "CfgWeapons"));
  {
    if (_hiddenNVGCfg isEqualTo _x) then {continue;};
    private _class = configName _x;

    _classList pushBack [
      getText (_x >> "displayName"),
      _class,
      false,
      ("[" + _class + "] " + getText (_x >> "descriptionShort")),
      getText (_x >> "picture")
    ];
  } forEach _configs;

  uiNamespace setVariable [QGVAR(aiNightvision_nvgClassList), _classList];
};

_classList
