#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Adds objects to all curators
 */

if !(isServer) exitWith {};

{
  _x addCuratorEditableObjects [_this, true];
} forEach allCurators;
