/*
 * Author: SzwedzikPL
 * Check is player a server admin
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

if(!isMultiplayer) exitWith {true};
if(!isPlayer _unit) exitWith {false};

if (_unit isEqualTo player && {serverCommandAvailable "#logout"}) exitWith {true};
if (!(_unit isEqualTo player) && {(missionNamespace getVariable [QGVAR(serverAdmin), objNull]) isEqualTo _unit}) exitWith {true};

_return
