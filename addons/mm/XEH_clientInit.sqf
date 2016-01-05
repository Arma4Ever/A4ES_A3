#include "script_component.hpp"

["SettingChanged", {
    params ["_option"];
    if(_option == QGVAR(enableColorCorrectionsEffect)) then {
        private ["_ppEnabled", "_ppEffect"];
        _ppEnabled = missionNamespace getVariable [QGVAR(colorCorrectionsEnabled), false];
        if(!_ppEnabled) exitWith {};
        _ppEffect = missionNamespace getVariable [QGVAR(colorCorrectionsEffect), []];
        _ppEffect ppEffectEnable GVAR(enableColorCorrectionsEffect);
        _ppEffect ppEffectCommit 0;
    };
}] call ace_common_fnc_addEventHandler;
