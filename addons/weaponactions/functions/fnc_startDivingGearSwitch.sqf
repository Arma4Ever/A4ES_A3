/*
 * Author: SzwedzikPL
 * Init diving gear switch action
 */
#include "script_component.hpp"

params ["_player", "_type"];

private _gear = "";
private _actionTime = -1;
private _actionProgressTitle = "";
private _actionFailureText = "";
private _actionSuccessText = "";
private _actionClass = "";
private _actionType = "";

if (_type == "uniform") then {
    _gear = uniform ace_player;
    _actionClass = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingUniform));
    _actionType = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingUniformType));
};
if (_type == "vest") then {
    _gear = vest ace_player;
    _actionClass = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingVest));
    _actionType = getText (configFile >> "CfgWeapons" >> _gear >> QGVAR(switchDivingVestType));
};

if (_actionClass == "" || _actionType == "") exitWith {};

if (_type == "uniform") then {
    _actionTime = 8;
    if (_actionType == "diving") then {
        _actionProgressTitle = localize LSTRING(switchUniformProgress);
        _actionSuccessText = localize LSTRING(switchUniformSuccess);
        _actionFailureText = localize LSTRING(switchUniformFailure);
    };
    if (_actionType == "normal") then {
        _actionProgressTitle = localize LSTRING(switchUniformBackProgress);
        _actionSuccessText = localize LSTRING(switchUniformBackSuccess);
        _actionFailureText = localize LSTRING(switchUniformBackFailure);
    };
};
if (_type == "vest") then {
    _actionTime = 4;
    if (_actionType == "diving") then {
        _actionProgressTitle = localize LSTRING(switchVestProgress);
        _actionSuccessText = localize LSTRING(switchVestSuccess);
        _actionFailureText = localize LSTRING(switchVestFailure);
    };
    if (_actionType == "normal") then {
        _actionProgressTitle = localize LSTRING(switchVestBackProgress);
        _actionSuccessText = localize LSTRING(switchVestBackSuccess);
        _actionFailureText = localize LSTRING(switchVestBackFailure);
    };
};

if (_actionProgressTitle == "") exitWith {};

//Check canInteractWith
if (!([ace_player, objNull, []] call ace_common_fnc_canInteractWith)) exitWith {};

//Do anim
[ace_player] call ace_common_fnc_goKneeling;

//Start action
[
    _actionTime,
    [_type, _actionClass, _actionSuccessText, _actionFailureText],
    {_this call FUNC(finishDivingGearSwitch)},
    {_this call FUNC(finishDivingGearSwitch)},
    _actionProgressTitle,
    {true},
    []
] call ace_common_fnc_progressBar;
