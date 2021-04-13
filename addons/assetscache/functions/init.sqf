#include "script_component.hpp"
/*
 * Author: Dedmen, modified by SzwedzikPL
 * Arma Zeus Cache init (preStart)
 */

// Exit for dedicated and headless
if !(hasInterface) exitWith {};

// Init extension
private _response = "ArmaZeusCache" callExtension "init";

// Exit if extension not inited properly (32bit clients)
if !(_response isEqualTo "init") exitWith {};

private _allUnits = [];
private _allAddons = [];

// Collect all addons & units from game config
{
  _allAddons pushBack (configName _x);
  _allUnits append (getArray (_x >> "units"));
} forEach configProperties [configFile >> "CfgPatches", "isClass _x"];

// Remove duplicates
_allUnits = _allUnits arrayIntersect _allUnits;

// Cache
"ArmaZeusCache" callExtension ["allowedUnits", [_allUnits, _allAddons]];
