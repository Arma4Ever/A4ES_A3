#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Insert values function for createTask type attribute
 */

params ["_module"];

private _typeValues = [];
{
  private _types = "true" configClasses _x;
  {
    private _name = getText (_x >> "displayName");
    if (_name isNotEqualTo "") then {
      private _class = toLower (configName _x);
      private _icon = getText (_x >> "icon");
      _typeValues pushBack [
        _name,
        _class,
        _class isEqualTo "default",
        _class,
        _icon
      ];
    };
  } forEach _types;
} forEach [
  (configFile >> "CfgTaskTypes"),
  (missionConfigFile >> "CfgTaskTypes")
];

_typeValues
