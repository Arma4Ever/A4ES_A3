#include "script_component.hpp"

params ["_player", "_type", "_mode"];
private ["_gear", "_expectedType", "_switchClass", "_switchType"];

_gear = "";
_expectedType = "";

if(_mode == 0) then {_expectedType = "normal";};
if(_mode == 1) then {_expectedType = "diving";};

if(_type == "uniform") then {_gear = uniform _player;};
if(_type == "vest") then {_gear = vest _player;};
if(_gear == "") exitWith {false};

_switchClass = "";
_switchType = "";

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
