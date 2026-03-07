#include "script_component.hpp"

if (!hasInterface) exitWith {};

["visionMode", {
    params ["_unit", "_newvVsionMode", "_oldVisionMode"];
    if (isNull objectParent _unit) then {
        if (_newvVsionMode > 0 && _oldVisionMode == 0) then {
            playSound QGVAR(nvg_on);
        } else {
            if (_newvVsionMode == 0) then {
                playSound QGVAR(nvg_off);
            };
        };
    };
}] call CBA_fnc_addPlayerEventHandler;