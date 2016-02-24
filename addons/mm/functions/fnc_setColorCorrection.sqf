/*
 * Author: SzwedzikPL
 * sets color correction on client
 */
#include "script_component.hpp"

if(!hasInterface) exitWith {};

params ["_effectType"];

private _effectArray = switch _effectType do {
    case ("dayzsa"): {[1, 1.06, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.4, 1.4, 1.5], [0.199, 0.587, 0.114, 0.0]]};
    case ("ofp"): {[1, 1, 0, [0, 0, 0, 0], [1, 1, 1.2, 0.85], [1, 1, -2.5, 0]]};
    case ("arma2"): {[1, 1.24, -0.004, [0.0, 0.0, 0.0, 0.0], [1, 0.8, 0.7, 0.7], [0.199, 0.587, 0.114, 0.0]]};
    case ("arma2oa"): {[ 1.0, 1, -0.003, [0.2, 0.15, -0.0, 0.125],[-2, -1.5, -1, 0.55], [-0.54, -0.53, 0.4, -0.09]]};
    case ("winter"): {[1, 1, 0, [0.01, 0.02, 0.04, 0.01], [0.87, 1.08, 1.196, 0.3], [0.399, 0.287, 0.014, 0.0]]};
    case ("spring"): {[1, 1.15, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.2, 1.2, 1.4], [0.199, 0.587, 0.114, 0.0]]};
    case ("autumn"): {[1, 0.9, -0.002, [0.0, 0.0, 0.0, 0.0], [1.0, 0.6, 0.4, 0.6],  [0.199, 0.587, 0.114, 0.0]]};
    case ("sunnyday"): {[1, 1.35, -0.004, [0.0, 0.0, 0.0, 0.0], [1.4, 1.3, 1.3, 1.4], [0.199, 0.587, 0.114, 0.0]]};
    case ("rainyday"): {[1, 1, 0, [0, 0, 0, -0.31],[1.9, 1.9, 1.73, 0.7],[0.2, 1.1, -1.5, 1.64]]};
    case ("africa"): {[1, 1.3, 0.001, [-0.11, -0.65, -0.76, 0.015],[-5, -1.74, 0.09, 0.86],[-1.14, -0.73, 1.14, -0.09]]};
    case ("desert"): {[1, 0.6, 0, [1.01, -2.46, -1.23, 0],[2.11, 1.6, 0.71, 0.8],[1.43, 0.56, 3.69, 0.31]]};
    case ("postapo"): {[1, 1, 0, [0.0, 0.0, 0.0, 0.0], [0.8*2, 0.5*2, 0.0, 0.7], [0.9, 0.9, 0.9, 0.0]]};
    default {[]};
};
if((count _effectArray) == 0) exitWith {true};

if(is3DEN) then {
    private _ppEffect = ppEffectCreate ["colorCorrections", 5];
    _ppEffect ppEffectEnable true;
    _ppEffect ppEffectAdjust _effectArray;
    _ppEffect ppEffectCommit 0;
    missionNamespace setVariable [QGVAR(colorCorrectionsEffect), _ppEffect];
} else {
    [{
        params ["_effectArray"];
        private _ppEffect = ppEffectCreate ["colorCorrections", 5];
        _ppEffect ppEffectEnable GVAR(enableColorCorrectionsEffect);
        _ppEffect ppEffectAdjust _effectArray;
        _ppEffect ppEffectCommit 0;
        missionNamespace setVariable [QGVAR(colorCorrectionsEnabled), true];
        missionNamespace setVariable [QGVAR(colorCorrectionsEffect), _ppEffect];
    }, [_effectArray]] call ace_common_fnc_runAfterSettingsInit;
};
