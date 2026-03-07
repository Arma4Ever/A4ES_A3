#include "script_component.hpp"

if (!hasInterface) exitWith {};

ace_player addEventHandler ["VisionModeChanged", {
    params ["_person", "_visionMode"];
    if (isNull objectParent _person) then {
        private _visionModeSound = [QGVAR(nvg_off), QGVAR(nvg_on)] select _visionMode;
        playSound _visionModeSound;
    };
}];