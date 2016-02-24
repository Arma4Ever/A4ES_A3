/*
 * Author: SzwedzikPL
 * Check diving gear action
 */
#include "script_component.hpp"

params [["_player", objNull, [objNull]], ["_type", "", [""]], ["_mode", 0, [0]]];

private _gear = "";
private _expectedType = "";

if(_mode == 0) then {_expectedType = "normal";};
if(_mode == 1) then {_expectedType = "diving";};

if(_type == "uniform") then {_gear = uniform _player;};
if(_type == "vest") then {_gear = vest _player;};
if(_gear == "") exitWith {false};

private _switchClass = "";
private _switchType = "";

if(_type == "uniform") then {
    _switchClass = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingUniform));
    _switchType = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingUniformType));
};
if(_type == "vest") then {
    _switchClass = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingVest));
    _switchType = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingVestType));
};

if(_switchClass != "" && _switchType == _expectedType) exitWith {true};

false
