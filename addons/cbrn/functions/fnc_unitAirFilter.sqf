#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns level of air filter of given unit
 */

params ["_unit"];

private _filter = 0;
private _goggles = goggles _unit;
private _headgear = headgear _unit;

private _gearSettings = missionNamespace getVariable [QGVAR(gearSettings), []];
private _gearParams = missionNamespace getVariable [QGVAR(gearParams), []];

{
  _x params ["_className", "_config"];
  private _settingsIndex = _gearSettings find _className;
  private _value = if (_settingsIndex >= 0) then {
    (_gearParams select _settingsIndex) # 0
  } else {
    getNumber (_config >> QGVAR(airFilter))
  };

  _filter = _filter max _value;
} forEach [
  [_goggles, configFile >> "CfgGlasses" >> _goggles],
  [_headgear, configFile >> "CfgWeapons" >> _headgear]
];

_filter
