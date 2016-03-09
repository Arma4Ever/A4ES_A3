/*
 * Author: SzwedzikPL
 * Loads special states from eden
 */
#include "script_component.hpp"

params ["_unit"];

if(!local _unit) exitWith {};

private _forceUpStance = (_unit getVariable [QGVAR(forceUpStance), 0]) > 0;
if(_forceUpStance) then {
    _unit disableAI "FSM";
    _unit setUnitPosWeak "UP";
};

private _forceMidStance = (_unit getVariable [QGVAR(forceMidStance), 0]) > 0;
if(_forceMidStance) then {
    _unit disableAI "FSM";
    _unit setUnitPosWeak "MIDDLE";
};

private _forceDownStance = (_unit getVariable [QGVAR(forceDownStance), 0]) > 0;
if(_forceDownStance) then {
    _unit disableAI "FSM";
    _unit setUnitPosWeak "DOWN";
};

private _forceFlashlightOn = (_unit getVariable [QGVAR(forceFlashlightOn), 0]) > 0;
if(_forceFlashlightOn) then {
    (group _unit) enableGunLights "forceOn";
};
