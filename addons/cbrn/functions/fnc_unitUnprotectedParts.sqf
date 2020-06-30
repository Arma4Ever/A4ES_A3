#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit body parts unprotected by CBRN gear
 */

params ["_unit"];

private _cfgWeapons = configFile >> "CfgWeapons";
private _unprotectedParts = ["face", "head", "body"];
private _goggles = goggles _unit;
private _uniform = uniform _unit;
private _headgear = headgear _unit;

private _gearSettings = missionNamespace getVariable [QGVAR(gearSettings), []];
private _gearParams = missionNamespace getVariable [QGVAR(gearParams), []];

{
  _x params ["_className", "_config"];
  private _settingsIndex = _gearSettings find _className;
  private _value = if (_settingsIndex >= 0) then {
    (_gearParams select _settingsIndex) # 1
  } else {
    getArray (_config >> QGVAR(protectedParts))
  };

  _unprotectedParts = _unprotectedParts - _value;
} forEach [
  [_goggles, configFile >> "CfgGlasses" >> _goggles],
  [_uniform, _cfgWeapons >> _uniform],
  [_headgear, _cfgWeapons >> _headgear]
];

_unprotectedParts
